//
//  MeteoriteListViewModel.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 19/07/2021.
//

import Foundation
import Combine

class MeteoriteListViewModel: ObservableObject {
    
    @Published var data: MeteoriteListModel
    
    private let isFavoriteScreen: Bool
    private let modelFactory: MeteoriteListModelBuildable
    private let manager: MeteoriteListManagerProtocol
    private var subscription: AnyCancellable?
    
    init(isFavoriteScreen: Bool,
         modelFactory: MeteoriteListModelBuildable = MeteoriteListModelFactory(),
         manager: MeteoriteListManagerProtocol = MeteoriteListManager()) {
        
        self.isFavoriteScreen = isFavoriteScreen
        self.modelFactory = modelFactory
        self.manager = manager
        self.data = modelFactory.makeDefaultModel(isFavoriteScreen: isFavoriteScreen)
        
        subscribeToNotifications()
        setup(isFavoriteScreen: isFavoriteScreen)
    }
    
    deinit {
        subscription?.cancel()
    }
    
    func getMeteorite(id: Int) -> Meteorite {
        meteorsFeature.meteorites.first { $0.id == id } ?? PreviewMockGenerator.MeteoriteBusinessModel.model
    }
}

// MARK: - Private

extension MeteoriteListViewModel {
    
    private func subscribeToNotifications() {
        
        subscription = NotificationCenter.default
            .publisher(for: .meteoriteListUpdated)
            .sink(receiveValue: { [weak self] _ in
                
                guard let self = self else {
                    return
                }
                
                DispatchQueue.main.async {
                    
                    if self.isFavoriteScreen {
                        self.getFavorites()
                    } else {
                        self.data = self.modelFactory.makeModel(meteorites: meteorsFeature.meteorites,
                                                                isFavoriteScreen: self.isFavoriteScreen)
                    }
                    
                }
            })
    }
    
    private func setup(isFavoriteScreen: Bool) {
        
        if isFavoriteScreen {
            getFavorites()
        } else {
            downloadMeteorites()
        }
    }
    
    private func getFavorites() {
        
        let favs = manager.getFavorites()
        data = modelFactory.makeModel(meteorites: favs, isFavoriteScreen: true)
    }
    
    private func downloadMeteorites() {
        
        guard meteorsFeature.meteorites.isEmpty else {
            return
        }
        
        manager.fetchMeteorites { [weak self] result in
            
            guard let self = self else {
                return
            }
            
            switch result {
            case .success(let meteorites):
                
                let processedMeteorites = self.processFavorites(meteorites: meteorites,
                                                                favorites: self.manager.getFavorites())
                
                meteorsFeature.meteorites = processedMeteorites
                
                DispatchQueue.main.async {
                    self.data = self.modelFactory.makeModel(meteorites: processedMeteorites,
                                                            isFavoriteScreen: false)
                }
                
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func processFavorites(meteorites: [Meteorite],
                                  favorites: [Meteorite]) -> [Meteorite] {
        
        let idFavorites = favorites.map { $0.id }
        
        guard idFavorites.count > 0 else {
            return meteorites
        }
        
        return meteorites.map { m -> Meteorite in
            
            if idFavorites.contains(m.id) {
                return Meteorite(
                    id: m.id,
                    name: m.name,
                    isFavorite: true,
                    mass: m.mass,
                    date: m.date,
                    coordinates: m.coordinates
                )
            } else {
                return m
            }
        }
    }
}

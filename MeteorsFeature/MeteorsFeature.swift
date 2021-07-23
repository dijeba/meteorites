//
//  MeteorsFeature.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 22/07/2021.
//

import SwiftUI
import Combine

public let meteorsFeature = MeteorsFeature()

public class MeteorsFeature {
    
    public typealias OnMeteoritesUpdate = ([Meteorite]) -> Void
    
    // MARK: - Variables
    
    // TODO: review
    public enum View {
        case meteoriteList
//        case mapView(meteorites: [Meteorite])
        case favoriteMeteorites
    }
    
    public var meteorites: [Meteorite] = [] {
        didSet {
            NotificationCenter.default.post(Notification(name: .meteoriteListUpdated))
        }
    }
    
    private var onUpdate: OnMeteoritesUpdate?
    
    // MARK: - Functions
    
    public func show(_ containerView: View,
                     onUpdate: OnMeteoritesUpdate? = nil) -> MeteorsFeatureContainerView {
        
        self.onUpdate = onUpdate
        return MeteorsFeatureContainerView(viewType: containerView)
    }
}

extension Bundle {
    
    static var module: Bundle? {
        Bundle(identifier: "diego.MeteorsFeature")
    }
}

extension DispatchQueue {
    
    /// Make sure the passed closure uses the main thread.
    /// Useful for code that can be called from background threads on production and from the main thread in tests
    /// - Parameter job: code to run on the main thread
    static func guaranteeMainThread(_ job: @escaping () -> Void) {
        if Thread.isMainThread {
            job()
        } else {
            DispatchQueue.main.async(execute: job)
        }
    }
}

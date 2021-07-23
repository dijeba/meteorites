//
//  DispatchQueue+Extension.swift
//  MeteorsFeature
//
//  Created by Diego Jerez Barroso on 23/07/2021.
//

import Foundation

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

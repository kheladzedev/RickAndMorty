//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Edward Kheladze on 05.08.2023.
//

import UIKit

extension UIView {
    /// Add multiple subviews
    /// - Parameter views: Variadic views
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}


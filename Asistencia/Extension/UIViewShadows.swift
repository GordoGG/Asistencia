//
//  UIViewShadows.swift
//  Asistencia
//
//  Created by Fabrizio on 10/22/19.
//  Copyright © 2019 Fabrizio Valdivia. All rights reserved.
//

import UIKit
extension UIView {
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = .zero
        layer.shadowRadius = 1
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}

// To drop a shadow to a UIView just do:
// let view = UIView()
// view.dropShadow()

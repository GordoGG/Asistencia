//
//  UIViewControlorExtensions.swift
//  Asistencia
//
//  Created by Fabrizio on 10/2/19.
//  Copyright © 2019 Fabrizio Valdivia. All rights reserved.
//

import UIKit

extension UIViewController {
    class func displaySpinner(onView : UIView) -> UIView {
        
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        
        let loadingView: UIView = UIView()
        loadingView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        loadingView.center = onView.center
        loadingView.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        let activityIndicator = UIActivityIndicatorView.init(style: .whiteLarge)
        activityIndicator.color = UIColor.orange
        activityIndicator.startAnimating()
        activityIndicator.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2)
        
        DispatchQueue.main.async {
            loadingView.addSubview(activityIndicator)
            spinnerView.addSubview(loadingView)
            onView.addSubview(spinnerView)
        }
        
        return spinnerView
    }
    
    class func removeSpinner(spinner : UIView) {
        DispatchQueue.main.async {
            spinner.removeFromSuperview()
        }
    }
}

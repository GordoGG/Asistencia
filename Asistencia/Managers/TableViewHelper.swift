//
//  TableViewHelper.swift
//  PokeDex
//
//  Created by Fabrizio Valdivia on 8/29/19.
//  Copyright © 2019 Fabrizio. All rights reserved.
//

//import Foundation
import UIKit

class TableViewHelper {
    
    class func EmptyMessage(message:String, viewController:ListaAlumnosViewController) {
        let rect = CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: viewController.view.bounds.size.width, height: viewController.view.bounds.size.height))
        let messageLabel = UILabel(frame: rect)
        messageLabel.text = message
        messageLabel.textColor = UIColor.black
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = .center;
        messageLabel.font = UIFont(name: "TrebuchetMS", size: 30)
        messageLabel.sizeToFit()
        viewController.setEmpty(label: messageLabel)
//
//        viewController.tableView
//
//        viewController.tableView.backgroundView = messageLabel
//        viewController.tableView.separatorStyle = .none
    }
}

//
//  ListaAlumnosCells.swift
//  Asistencia
//
//  Created by Fabrizio on 9/4/19.
//  Copyright (c) 2019 Fabrizio Valdivia. All rights reserved.
//
//  This file was generated by the StartApps CleanSwift Xcode Templates. V2.0
//  By Gabriel Lanata (http://StartApps.pe) with credit to http://clean-swift.com
//

import UIKit

class ListaAlumnosTableViewCell: UITableViewCell {
    
    static let identifier = "ListaAlumnosTableViewCell"
    @IBOutlet weak var fotoAlumno: UIImageView!
    @IBOutlet weak var nombreLabel: UILabel!
    @IBOutlet weak var checkImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Configure cell initial settings
    }
    
//    var displayedSomething: ListaAlumnosScene.Alumnos.ViewModel.DisplayedAlumno! {
//        didSet {
//            // Configure cell from object
//            // iconImageView.image = displayedSomething.image
//            // titleLabel.text = displayedSomething.title
//            // contentLabel.text = displayedSomething.content
//        }
//    }
    
}

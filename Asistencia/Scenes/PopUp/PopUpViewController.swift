//
//  PopUpViewController.swift
//  Asistencia
//
//  Created by Fabrizio Valdivia on 9/13/19.
//  Copyright © 2019 Fabrizio Valdivia. All rights reserved.
//

import Foundation
import UIKit

class PopUpViewController: UIViewController {
    @IBOutlet weak var nombreLabel: UILabel!
    @IBOutlet weak var correoLabel: UILabel!
    @IBOutlet weak var telefonoLabel: UILabel!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var containerView: UIView!
    
    var nombre: String!
    var correo: String!
    var telefono: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.definesPresentationContext = true
    }
    
    func setupView() {
        view.bringSubviewToFront(containerView)
        containerView.layer.cornerRadius = 10
        nombreLabel.text = nombre
        correoLabel.text = correo
        telefonoLabel.text = telefono
    }
    
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

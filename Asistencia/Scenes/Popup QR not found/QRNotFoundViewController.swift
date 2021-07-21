//
//  QRNotFoundViewController.swift
//  Asistencia
//
//  Created by Fabrizio on 10/21/19.
//  Copyright © 2019 Fabrizio Valdivia. All rights reserved.
//

import UIKit

class QRNotFoundViewController: UIViewController {
    @IBOutlet weak var notFoundLabel: UILabel!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.definesPresentationContext = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.text = "ERROR"
        notFoundLabel.text = "Codigo de inscripción invalido"
    }
    
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

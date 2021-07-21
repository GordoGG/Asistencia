//
//  PopupCompletionViewController.swift
//  Asistencia
//
//  Created by Fabrizio on 10/4/19.
//  Copyright © 2019 Fabrizio Valdivia. All rights reserved.
//

import UIKit
import Firebase

class PopupCompletionViewController: UIViewController {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageCompletion: UIImageView!
    @IBOutlet weak var nombreLabel: UILabel!
    @IBOutlet weak var completionLabel: UILabel!
    @IBOutlet weak var correoLabel: UILabel!
    @IBOutlet weak var exitoLabel: UILabel!
    
    var ref: DatabaseReference!
    var idEvento: Int!
    var fechasEvento = [EventDate]()
    var nombreA: String!
    var correoA: String!
    var idAlumno: String!
    var attendanceRaw = [String: Bool]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.definesPresentationContext = true
    }
    
    func setupView() {
        view.bringSubviewToFront(containerView)
        containerView.layer.cornerRadius = 10
        verificarAlumno()
    }
    
    func verificarAlumno() {
        self.ref = Database.database().reference()

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let month = Calendar.current.component(.month, from: Date())
        let year = Calendar.current.component(.year, from: Date())
        let day = Calendar.current.component(.day, from: Date())
        let currentDate = dateFormatter.date(from: "\(year)-\(month)-\(day)")
        let currentDateRaw = String(describing: currentDate)
        let currentDateA = currentDateRaw.components(separatedBy: "(")
        let currentDateF = currentDateA[1].components(separatedBy: " ")
        let currDate = currentDateF[0]
        let fecha = fechasEvento.contains(EventDate(date: "\(currDate)"))
        var i = 0
        if fecha {
            for dates in fechasEvento {
                let dateArr = String(describing: dates)
                let dateA = dateArr.components(separatedBy: " ")
                let dateF = dateA[1]
                let dateFinal = dateF.components(separatedBy: "\"")
                let fechaE = dateFormatter.date(from: String(describing: dateFinal[1]))
                if fechaE == currentDate {
                    let fechaEv = String(describing: fechaE)
                    let fechaArr = fechaEv.components(separatedBy: "(")
                    let fechaF = fechaArr[1].components(separatedBy: " ")
                    let date = fechaF[0]
                    if attendanceRaw[date] == true {
                        nombreLabel.text = nombreA
                        correoLabel.text = ""
                        exitoLabel.text = "Asistente previamente registrado"
                        completionLabel.text = ""
                        imageCompletion.image = UIImage(named: "failure")
                        attendanceRaw[date] = false
                    } else {
                        self.ref.child("events").child(String(idEvento)).child(idAlumno).child("extras").child("attendance").child(String(describing: date)).setValue(true)
                        nombreLabel.text = nombreA
                        exitoLabel.text = "Asistente registrado con exito"
                        correoLabel.text = "Correo:"
                        completionLabel.text = "\"" + correoA + "\""
                        imageCompletion.image = UIImage(named: "success")
                        attendanceRaw[date] = true
                    }
                } else {
                    i += 1
                }
            }
        } else {
            if attendanceRaw[fechasEvento[0].date] == true {
                nombreLabel.text = nombreA
                correoLabel.text = ""
                completionLabel.text = "Material ya entregado."
                imageCompletion.image = UIImage(named: "failure")
            } else {
                nombreLabel.text = nombreA
                completionLabel.text = correoA
                imageCompletion.image = UIImage(named: "success")
            }
        }
    }
    
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

//
//  AgregarAlumno.swift
//  Asistencia
//
//  Created by Fabrizio on 10/3/19.
//  Copyright © 2019 Fabrizio Valdivia. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class AgregarAlumno: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var nombres: UITextField!
    @IBOutlet weak var apellidos: UITextField!
    @IBOutlet weak var DNI: UITextField!
    @IBOutlet weak var categoria: UITextField!
    @IBOutlet weak var correo: UITextField!
    @IBOutlet weak var telefono: UITextField!
    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var containerViewBottomConstraint: NSLayoutConstraint!
    
    
    var ref: DatabaseReference!
    var id: Int = 0
    var fechas = [EventDate]()
    var count: Int = 0
    var pickOption = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        view.bringSubviewToFront(containerView)
        navigationController?.navigationBar.barTintColor = .orange
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        navigationItem.setRightBarButton(UIBarButtonItem(title: "Cerrar", style: .plain, target: self, action: #selector(dismiss(_:))), animated: true)
        
        navigationItem.setLeftBarButton(UIBarButtonItem(image: UIImage(named: "add")?.resizeImageWith(newSize: CGSize(width: 30, height: 30)), style: .plain, target: self, action: #selector(agregar(_:))), animated: true)
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
        let pickerView = UIPickerView()
        pickerView.delegate = self
        categoria.inputView = pickerView
        
        DNI.keyboardType = .numberPad
        telefono.keyboardType = .numberPad
        correo.keyboardType = .emailAddress
    }
        
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickOption.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickOption[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        categoria.text = pickOption[row]
    }
    
    @objc func agregar(_ sender: Any) {
        ref = Database.database().reference()
        let nombreCompleto = apellidos.text! + " " + nombres.text!
        var attendance = [String: Any]()
        fechas.forEach({
            attendance[$0.date] = false
        })
        
        let dicctionary: [String: Any] = ["name" : nombreCompleto,
                           "id" : DNI.text!,
                           "extras" : ["attendance" : attendance,
                            "attendeeType" : "Categoria \(categoria.text!)",
                            "email" : correo.text!,
                            "phone" : telefono.text!]]
        
        let key = count + 1
        ref.child("events").child("\(id)").child("\(key)").setValue(dicctionary)
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func adjustForKeyboard(notification: Notification) {
        guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        
        let keyboardScreenEndFrame = keyboardValue.cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
        self.containerViewBottomConstraint.constant = 0
        if notification.name == UIResponder.keyboardWillHideNotification {
            self.scroll.contentInset = .zero
        } else {
            if #available(iOS 11.0, *) {
                self.scroll.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height - view.safeAreaInsets.bottom + 130, right: 0)
            } else {
                // Fallback on earlier versions
            }
            self.containerViewBottomConstraint.constant = self.containerViewBottomConstraint.constant - 130
        }
        self.view.layoutIfNeeded()
        self.scroll.scrollIndicatorInsets = self.scroll.contentInset
    }
}

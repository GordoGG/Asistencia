//
//  ListaAlumnosPresenter.swift
//  Asistencia
//
//  Created by Fabrizio on 9/4/19.
//  Copyright (c) 2019 Fabrizio Valdivia. All rights reserved.
//
//  This file was generated by the StartApps CleanSwift Xcode Templates. V2.0
//  By Gabriel Lanata (http://StartApps.pe) with credit to http://clean-swift.com
//

import Foundation

class ListaAlumnosPresenter {

    weak var viewController: ListaAlumnosViewController?

    // MARK: - Presentation logic
    
    func presentAlumnos(response: ListaAlumnosScene.Alumnos.Response) {
//        let displayedAlumnos = response.alumnos.map({ ListaAlumnosScene.Alumnos.ViewModel.DisplayedAlumno(
//            name: $0.name,
//            email: $0.extras.first!.email,
//            phone: $0.extras.first!.phone
//            )
//        })

        
        var displayedAlumnos = [ListaAlumnosScene.Alumnos.ViewModel.DisplayedAlumno]()
        
        response.alumnos.forEach({
            let displayedAlumno = ListaAlumnosScene.Alumnos.ViewModel.DisplayedAlumno(
                name: $0.name,
                email: $0.extras.first!.email,
                phone: $0.extras.first!.phone,
                id: $0.id,
                dni: $0.dni,
                attendance: $0.extras.first!.attendance
            )
            displayedAlumnos.append(displayedAlumno)
        })
        
        
        viewController?.displayAlumnos(viewModel: ListaAlumnosScene.Alumnos.ViewModel(displayedAlumnos: displayedAlumnos))
    }
    
    func presentAlertError(response: ListaAlumnosScene.AlertError.Response) {
        viewController?.displayAlertError(viewModel: ListaAlumnosScene.AlertError.ViewModel(
            message: response.error.localizedDescription
        ))
    }

}

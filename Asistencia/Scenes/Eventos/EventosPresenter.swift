//
//  EventosPresenter.swift
//  Asistencia
//
//  Created by Fabrizio on 9/4/19.
//  Copyright (c) 2019 Fabrizio Valdivia. All rights reserved.
//
//  This file was generated by the StartApps CleanSwift Xcode Templates. V2.0
//  By Gabriel Lanata (http://StartApps.pe) with credit to http://clean-swift.com
//

import Foundation

class EventosPresenter {

    weak var viewController: EventosViewController?

    // MARK: - Presentation logic
    
    func presentEventos(response: EventosScene.Eventos.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        // NOTE: Remember to use workers if complex processing is required
        var displayedEvents = [EventosScene.Eventos.ViewModel.DisplayedEvent]()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let month = Calendar.current.component(.month, from: Date())
        let year = Calendar.current.component(.year, from: Date())
        let day = Calendar.current.component(.day, from: Date())
        let currentDate = dateFormatter.date(from: "\(year)-\(month)-\(day)")
        response.events.forEach({
            //validacion de fecha
            let dateH = dateFormatter.date(from: $0.dateHidden)
            if currentDate! < dateH! {
                let displayedEvent = EventosScene.Eventos.ViewModel.DisplayedEvent(
                    name: $0.name,
                    color: $0.color,
                    image: $0.image,
                    id: $0.id,
                    dateHidden: $0.dateHidden,
                    canAddAttendee: $0.canAddAttendee,
                    dates: $0.dates,
                    attendeeType: $0.attendeeType
                )
                displayedEvents.append(displayedEvent)
            }
        })
            
        
        viewController?.displayEventos(viewModel: EventosScene.Eventos.ViewModel(displayedEvents: displayedEvents))
    }
    
    func presentAlertError(response: EventosScene.AlertError.Response) {
        viewController?.displayAlertError(viewModel: EventosScene.AlertError.ViewModel(
            message: response.error.localizedDescription
        ))
    }

}
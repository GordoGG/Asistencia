//
//  File.swift
//  Asistencia
//
//  Created by Fabrizio Valdivia on 9/4/19.
//  Copyright © 2019 Fabrizio Valdivia. All rights reserved.
//

import Foundation


struct Evento {
    let color: String
    let dateHidden: String
    let id: Int
    let image: String
    let name: String
    let canAddAttendee: Bool
    let dates: [EventDate]
    let attendeeType: [String]
}

struct EventDate: Equatable {
    let date: String
    
}

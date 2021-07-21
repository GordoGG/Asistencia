//
//  ListaAlumnos.swift
//  Asistencia
//
//  Created by Fabrizio Valdivia on 9/4/19.
//  Copyright © 2019 Fabrizio Valdivia. All rights reserved.
//

import Foundation

struct Alumno {
    let name: String
    let id: String
    let dni: String
    let extras: [Extras]
}

struct Extras {
    var attendance: [String: Bool]
    let attendeeType: String
    let email: String
    let phone: String
}

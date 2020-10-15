//
//  Professor.swift
//  ProfWiki
//
//  Created by Harjas Monga on 10/13/20.
//

import Foundation
import Swift

struct Professor: Decodable {
    let id: Int
    let firstname: String
    let lastname: String
    let imageurl: String
}

struct ProfessorDetail: Decodable {
    let id: Int
    let firstname: String
    let lastname: String
    let email: String
    let office: String
    let phone: String?
    let ratemyprofessorscore: Double?
    let difficulty: Double?
    let education: String?
}

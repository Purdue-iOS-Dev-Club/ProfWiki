//
//  ProfessorService.swift
//  ProfWiki
//
//  Created by Harjas Monga on 10/13/20.
//

import Foundation
import SwiftUI

struct ProfessorService {
    
    private static let server = URL(string: "https://csprofessors.herokuapp.com")!
    
    static func getAll(handle: @escaping ([Professor]) -> ()) {
        let professorsEndpoint = server.appendingPathComponent("professors")
        let allProfsRequest = URLRequest(url: professorsEndpoint)
        
        let task = URLSession.shared.dataTask(with: allProfsRequest) { (data, response, error) in
            if let error = error {
                print(error)
                handle([])
                return
            }
            guard let data = data else {
                print("data missing")
                handle([])
                return
            }
            let decoder = JSONDecoder()
            guard let decodedProfs = try? decoder.decode([Professor].self, from: data) else {
                print("data not matching to Professor Struct")
                handle([])
                return
            }
            handle(decodedProfs)
        }
        
        task.resume()
    }
    
    static func getDetail(for professor: Professor, handle: @escaping (ProfessorDetail?) -> ()) {
        let professorDetailEndpoint = server.appendingPathComponent("professors/\(professor.id)")
        let detailProfRequest = URLRequest(url: professorDetailEndpoint)
        
        let task = URLSession.shared.dataTask(with: detailProfRequest) { (data, response, error) in
            if let error = error {
                print(error)
                handle(nil)
                return
            }
            guard let data = data else {
                print("data missing")
                handle(nil)
                return
            }
            let decoder = JSONDecoder()
            guard let decodedProfDetail = try? decoder.decode(ProfessorDetail.self, from: data) else {
                print("data not matching to Professor Struct")
                handle(nil)
                return
            }
            handle(decodedProfDetail)
        }
        
        task.resume()
    }
}

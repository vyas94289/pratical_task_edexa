//
//  EmployeeInfo.swift
//  pratical_task_edexa
//
//  Created by Gaurang Vyas on 07/07/21.
//
import Foundation
import SwiftUI

struct EmployeeInfo: Codable, Identifiable {
    let id: Int
    let city: String
    let lastName, firstName: String
    
    var fullName: String {
        "\(firstName) \(lastName)"
    }

    enum CodingKeys: String, CodingKey {
        case id, city
        case lastName = "last_name"
        case firstName = "first_name"
    }
}

var dummy: [EmployeeInfo] {
    let str: String = """
[{"id":1,"city":"Chicago","last_name":"Swire","first_name":"Sharlene"},{"id":2,"city":"NewYork","last_name":"Haacker","first_name":"Juliette"},{"id":3,"city":"Los Angeles","last_name":"Morriss","first_name":"Ted"},{"id":4,"city":"NewYork","last_name":"Wakefield","first_name":"Danice"},{"id":5,"city":"Chicago","last_name":"Twigg","first_name":"Rycca"},{"id":6,"city":"NewYork","last_name":"Manketell","first_name":"Lacie"},{"id":7,"city":"Chicago","last_name":"McKane","first_name":"Iolande"},{"id":8,"city":"NewYork","last_name":"Scoffins","first_name":"Robinia"},{"id":9,"city":"Los Angeles","last_name":"Marcome","first_name":"Robena"},{"id":10,"city":"NewYork","last_name":"Fazackerley","first_name":"Nelson"},{"id":11,"city":"Chicago","last_name":"Tewes","first_name":"Gideon"},{"id":12,"city":"NewYork","last_name":"Redgewell","first_name":"Fallon"},{"id":13,"city":"Chicago","last_name":"Lydiatt","first_name":"Walt"},{"id":14,"city":"NewYork","last_name":"Parcell","first_name":"Marguerite"},{"id":15,"city":"Los Angeles","last_name":"Demkowicz","first_name":"Gunter"},{"id":16,"city":"NewYork","last_name":"Taylor","first_name":"Kim"},{"id":17,"city":"Chicago","last_name":"Beldam","first_name":"Dorian"},{"id":18,"city":"NewYork","last_name":"Stowte","first_name":"Mano"},{"id":19,"city":"Chicago","last_name":"Ghidini","first_name":"Lanae"},{"id":20,"city":"NewYork","last_name":"Paffett","first_name":"Glyn"},{"id":21,"city":"Los Angeles","last_name":"Verling","first_name":"Jessamine"},{"id":22,"city":"NewYork","last_name":"Bellhanger","first_name":"Jobey"},{"id":23,"city":"Chicago","last_name":"Nowick","first_name":"Ferdy"},{"id":24,"city":"NewYork","last_name":"McMenamin","first_name":"Ania"},{"id":25,"city":"Chicago","last_name":"Mazey","first_name":"Linea"},{"id":26,"city":"NewYork","last_name":"Winger","first_name":"Gage"},{"id":27,"city":"Los Angeles","last_name":"Ironside","first_name":"Finn"},{"id":28,"city":"NewYork","last_name":"Caile","first_name":"Jacynth"},{"id":29,"city":"Chicago","last_name":"Danskine","first_name":"Harlan"},{"id":30,"city":"NewYork","last_name":"Lowseley","first_name":"Benedicto"}]
    
"""
    
    guard let data = str.data(using: .utf8) else {  return [] }
    do {
        return try JSONDecoder().decode([EmployeeInfo].self, from: data)
    } catch {
        return []
    }
}

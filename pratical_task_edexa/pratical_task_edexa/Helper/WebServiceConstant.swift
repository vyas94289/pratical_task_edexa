//
//  WebServiceConstant.swift
//  RecipeSwiftui2pointO
//
//  Created by Gaurang Vyas on 11/06/21.
//

import Foundation

enum WsUrls {
    static let employeesBase = "https://api.npoint.io/"
}

enum WsHeaders {
    static let accept = "Accept"
    static let applicationJson = "application/json"
    static let contentType = "Content-Type"
    static let authorization = "Authorization"
    static let spotifyAll: [String: String] = [accept: applicationJson,
                                               contentType: applicationJson,
                                              ]
    
}


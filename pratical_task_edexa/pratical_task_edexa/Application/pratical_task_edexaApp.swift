//
//  pratical_task_edexaApp.swift
//  pratical_task_edexa
//
//  Created by Gaurang Vyas on 07/07/21.
//

import SwiftUI

@main
struct pratical_task_edexaApp: App {
    
    init() {
        UINavigationBar.appearance().barTintColor = UIColor.primaryColor
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        
    }
    
    var body: some Scene {
        WindowGroup {
            EmployeeListView()
        }
    }
}

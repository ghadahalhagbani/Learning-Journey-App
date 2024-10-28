//
//  Learning_Journey_AppApp.swift
//  Learning Journey App
//
//  Created by Ghadah Alhagbani on 17/04/1446 AH.
//

import SwiftUI

@main
struct Learning_Journey_AppApp: App {
    @StateObject private var userData = UserData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userData)
                .preferredColorScheme(.dark)
        }
    }
}


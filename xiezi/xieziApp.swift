//
//  xieziApp.swift
//  xiezi
//
//  Created by Marc Intha on 25/09/2022.
//

import SwiftUI

@main
struct XieziApp: App {
    @StateObject private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
        .windowToolbarStyle(UnifiedWindowToolbarStyle(showsTitle: true))
    }
}

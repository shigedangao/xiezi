//
//  ContentView.swift
//  xiezi
//
//  Created by Marc Intha on 25/09/2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var modelData: ModelData
    @State var xuexiError: LocalizedError?
    @State var showAlert = false

    var body: some View {
        NavigationView {
            NavbarList()

            Editor()
            Generator()
                .toolbar {
                    ToolbarItemGroup {
                        ToolbarMenu()
                        Actions()
                    }
                }
        }
        .task {
            do {
                let errs = try await xuexiDic.loadDictionaries()
                if !errs.isEmpty {
                    throw errs[0]
                }

                modelData.isLoaded = true
            } catch {
                xuexiError = error.localizedDescription
            }
        }
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text("error while loading dictionaries \(xuexiError!.localizedDescription)"))
        })
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}

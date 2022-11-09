//
//  ToolbarMenu.swift
//  xiezi
//
//  Created by Marc Intha on 09/10/2022.
//

import SwiftUI

struct ToolbarMenu: View {
    @State private var selectedLanguage = "Traditional Chinese"
    @EnvironmentObject var modelData: ModelData

    func setLanguage(lang: Language) {
        switch lang {
        case Language.traditionalChinese:
                selectedLanguage = "Traditional Chinese"
        case Language.simplifiedChinese:
                selectedLanguage = "Simplified Chinese"
        case Language.laotian:
                selectedLanguage = "Laotian"
        }

        modelData.language = lang
        modelData.setLanguageForNoteID(language: lang)
    }

    var body: some View {
        Menu {
            Button(action: { setLanguage(lang: Language.traditionalChinese) }) {
                Text("Traditional Chinese")
            }

            Button(action: { setLanguage(lang: Language.simplifiedChinese) }) {
                Text("Simplified Chinese")
            }

            Button {
                setLanguage(lang: Language.laotian)
            } label: {
                Text("Laotian")
            }
        } label: {
            Text("Language: \(selectedLanguage)")
            Image(systemName: "textformat.subscript.th")
        }
        .onChange(of: modelData.language) {newValue in
            setLanguage(lang: newValue)
        }
    }
}

struct ToolbarMenu_Previews: PreviewProvider {
    static var previews: some View {
        ToolbarMenu()
            .environmentObject(ModelData())
    }
}

//
//  Actions.swift
//  xiezi
//
//  Created by Marc Intha on 09fdf/10/2022.
//

import SwiftUI

// Open a dialog and get the url of the file to create
// Based on @link https://swdevnotes.com/swift/2022/save-an-image-to-macos-file-system-with-swiftui/
func showSaveDialog() -> URL? {
    let savePanel = NSSavePanel()
    savePanel.allowedContentTypes = [.commaSeparatedText]
    savePanel.canCreateDirectories = true
    savePanel.isExtensionHidden = false
    savePanel.title = "Save the generated definitions"
    savePanel.message = "Choose a folder and a name to store the definitions"
    savePanel.nameFieldLabel = "CSV file name:"

    let response = savePanel.runModal()
    return response == .OK ? savePanel.url : nil
}

struct Actions: View {
    @EnvironmentObject var modelData: ModelData

    func deleteNote() {
        modelData.deleteNote()
    }

    // Share the note content by getting the selected note, getting the url
    // and storing the generated file in the targeted url
    func shareNoteContent() {
        if let note = modelData.getSelectedNote() {
            if let url = showSaveDialog() {
                let xuexiLang = xuexiDic.getXuexiLanguageFromSwiftLang(lang: note.lang)
                exportToCsv(lang: xuexiLang, sentence: note.content, path: url)
            }
        }
    }

    var body: some View {
        Button(action: deleteNote) {
            Image(systemName: "trash")
        }

        Button(action: shareNoteContent) {
            Image(systemName: "square.and.arrow.up")
        }
    }
}

struct Actions_Previews: PreviewProvider {
    static var previews: some View {
        Actions()
            .environmentObject(ModelData())
    }
}

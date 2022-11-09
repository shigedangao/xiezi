//
//  ModelData.swift
//  xiezi
//
//  Created by Marc Intha on 25/09/2022.
//

import Foundation
import XuexiPackage

final class ModelData: ObservableObject {
    @Published var notes: [Note] = loadNotes()
    @Published var selected: Int = 0
    @Published var language: Language = Language.traditionalChinese
    @Published var isLoaded: Bool = false

    // Set Note Textual Content
    //
    // # Description
    // Set the textual content such as the title and the content
    // of the selected note
    func setNoteTextualContent(content: String) {
        if content.count > 0 {
            let computedIndex = content.count > 10 ? 10 : content.count - 1
            let startIndex = content.index(content.startIndex, offsetBy: 0)
            let endIndex = content.index(content.startIndex, offsetBy: computedIndex)

            notes[selected].title = String(content[startIndex...endIndex])
        }

        notes[selected].content = content
        // Persist the change to the notes
        saveStore(notes: notes)
    }

    func generateXuexiDefinitions() {
        let content = notes[selected].content
        let lang = notes[selected].lang

        var xuexiLang: XuexiPackage.XuexiLibLanguage
        switch lang {
        case Language.traditionalChinese:
            xuexiLang = XuexiPackage.XuexiLibLanguage.Chinese
        case Language.simplifiedChinese:
            xuexiLang = XuexiPackage.XuexiLibLanguage.Chinese
        case Language.laotian:
            xuexiLang = XuexiPackage.XuexiLibLanguage.Laotian
        }

        if isLoaded {
            let res = xuexiDic.dictionary.search_in_dictionaries(xuexiLang, content)
            if let content = res {
                var generated = XuexiGenerate.fromJSONDictionary(content: content.toString())
                // loop on the generated and set a color for each value
                for idx in generated.values.indices {
                    generated.values[idx].color = CColor.random()
                }

                notes[selected].generated = generated
            }
        }
    }

    // Create a New Note
    //
    // # Description
    // Create a new default new note which has the traditional chinese set
    // and the selected id to 0 to put it at the top of the selection
    func createNewNote() {
        var id = 0
        if let first = notes.first {
            id = first.id + 1
        }

        notes.insert(Note.as_default(id: id), at: 0)
        language = Language.traditionalChinese
        self.setSelectedIndex(index: 0)
        // Persist the change to the notes
        saveStore(notes: notes)
    }

    // Set Language For Note ID
    //
    // # Description
    // Set the language note for the targeted id
    func setLanguageForNoteID(language: Language) {
        notes[selected].lang = language
        // Persist the change to the notes
        saveStore(notes: notes)
    }

    // Set Selected Index
    //
    // # Description
    // Set the selected index (user click on one of the item on the left panel)
    func setSelectedIndex(index: Int) {
        selected = index
        // set the language dropdown value to the current selected language
        language = notes[selected].lang
        // Persist the change to the notes
        saveStore(notes: notes)
    }

    // Delete a note
    //
    // # Description
    // Delete a note by using the selected index
    func deleteNote() {
        if notes.count == 1 {
            return
        }

        // remove the target note for the selected index
        notes.remove(at: selected)
        // Persist the change to the notes
        saveStore(notes: notes)

        if selected != 0 {
            // downgrade selected value
            selected -= 1
        }
    }

    // Getter //
    // Get Selected Note Generated Items
    //
    // # Description
    // Get a dictionary from a selected note
    func getSelectedNoteGeneratedItems() -> [String: XuexiGenerate]? {
        if let data = notes.get(index: selected) {
            return data.generated
        }

        return nil
    }

    // Get Selected Note
    //
    // # Description
    // Get a selected note based on the selected cursor
    func getSelectedNote() -> Note? {
        if let note = notes.get(index: selected) {
            return note
        }

        return nil
    }
}

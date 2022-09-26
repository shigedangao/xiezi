//
//  Editor.swift
//  xiezi
//
//  Created by Marc Intha on 28/09/2022.
//

import SwiftUI

struct Editor: View {
    @State var content: String = ""
    @State var note: Note = Note.as_default();
    @EnvironmentObject var modelData: ModelData
        
    var body: some View {
        VStack {
            Text("Scratchpad")
                .font(.callout)
                .padding(.top, 10)
            
            TextEditor(text: $content)
                .background(Color.red)
                .onChange(of: content) { newContent in
                    modelData.setNoteTextualContent(content: newContent)
                    modelData.generateXuexiDefinitions()
                }
        }
        .background(Color.tertiaryBackground)
        .onAppear {
            if let item = modelData.getSelectedNote() {
                note = item
                content = item.content
            }
        }
        .onChange(of: modelData.selected) {_ in
            if let item = modelData.getSelectedNote() {
                note = item
                content = item.content
            }
        }
    }
}

struct Editor_Previews: PreviewProvider {
    static var previews: some View {
        Editor()
            .environmentObject(ModelData())
    }
}

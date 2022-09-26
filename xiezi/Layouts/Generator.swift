//
//  Generator.swift
//  xiezi
//
//  Created by Marc Intha on 28/09/2022.
//

import SwiftUI

struct Generator: View {
    @State var generated: Dictionary<String, XuexiGenerate> = Dictionary()
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        VStack {
            Text("Generated")
                .font(.callout)
                .padding(.top, 10)
            
            List {
                ForEach(Array(generated.keys), id: \.self) { key in
                    GeneratorItem(
                        character: generated[key]!.writing_method,
                        pronounciation: generated[key]!.pronounciation,
                        translation: generated[key]!.translation,
                        count: generated[key]!.count,
                        color: Color.random()
                    )
                }
            }
        }
        .onAppear {
            if let items = modelData.getSelectedNoteGeneratedItems() {
                generated = items
            }
        }
        .onChange(of: modelData.selected) { _ in
            if let items = modelData.getSelectedNoteGeneratedItems() {
                generated = items
            }
        }
        //.onChange(of: modelData., perform: <#T##(Equatable) -> Void##(Equatable) -> Void##(_ newValue: Equatable) -> Void#>)
    }
}

struct Generator_Previews: PreviewProvider {
    static var previews: some View {
        Generator()
            .environmentObject(ModelData())
    }
}

//
//  GeneratorItem.swift
//  xiezi
//
//  Created by Marc Intha on 30/09/2022.
//

import SwiftUI

struct GeneratorItem: View {
    var character: String
    var pronounciation: String
    var translation: String
    var count: Int
    var level: String?
    var color: Color

    var body: some View {
        HStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(color)
                .frame(width: 25, height: 25)

            VStack {
                HStack {
                    Text(character)
                        .font(.title2)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    if let wordLevel = level {
                        Text(wordLevel)
                            .font(.title3)
                            .padding(4)
                            .foregroundColor(color)
                    }
                }

                ItemList(sectionName: "Pronounciation", listString: pronounciation)

                ItemList(sectionName: "Translation", listString: translation)

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            GeneratorCounter(count: count, color: color)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .textSelection(.enabled)
    }
}

struct GeneratorItem_Previews: PreviewProvider {
    static var previews: some View {
        GeneratorItem(
            character: "去年",
            pronounciation: "Qu nian",
            translation: "Last year",
            count: 1,
            color: Color.white
        )
    }
}

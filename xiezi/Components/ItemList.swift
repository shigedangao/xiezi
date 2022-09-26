//
//  ItemList.swift
//  xiezi
//
//  Created by Marc Intha on 30/09/2022.
//

import SwiftUI

struct ItemList: View {
    var sectionName: String
    var listString: String
    
    var list: [String] {
        listString.components(separatedBy: ",")
    }
        
    var body: some View {
        VStack {
            Text(sectionName)
                .font(.title3)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ForEach(Array(list.enumerated()), id: \.offset) { offset, item in
                Text("- \(item.trimmingCharacters(in: .whitespaces))")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 10)
        
            }
        }
        .padding(.bottom, 10)
    }
}

struct ItemList_Previews: PreviewProvider {
    static var previews: some View {
        ItemList(
            sectionName: "Pronounciations",
            listString: "foo, bar"
        )
    }
}

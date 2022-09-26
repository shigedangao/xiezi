//
//  Actions.swift
//  xiezi
//
//  Created by Marc Intha on 09fdf/10/2022.
//

import SwiftUI

struct Actions: View {
    
    func deleteNote() {
        print("delete")
    }
    
    var body: some View {
        Button(action: { deleteNote() }) {
            Image(systemName: "trash")
        }
    }
}

struct Actions_Previews: PreviewProvider {
    static var previews: some View {
        Actions()
    }
}

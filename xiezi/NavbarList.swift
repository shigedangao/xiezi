//
//  NavbarList.swift
//  xiezi
//
//  Created by Marc Intha on 26/09/2022.
//

import SwiftUI

struct NavbarList: View {
    @EnvironmentObject var modelData: ModelData
    // Computed variables initialize after NavbarList is initialized
    var notes: [Note] {
        modelData.notes
    }
    
    var body: some View {
        List {
            ForEach(notes) { data in
                Text(data.title)
            }
        }
    }
}

struct NavbarList_Previews: PreviewProvider {
    static var previews: some View {
        NavbarList()
            .environmentObject(ModelData())
    }
}

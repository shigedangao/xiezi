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

    // Toggle the sidebar
    // From https://sarunw.com/posts/how-to-toggle-sidebar-in-macos/
    private func toggleSidebar() {
        #if os(iOS)
        #else
        NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
        #endif
    }

    var body: some View {
        List {
            ForEach(Array(notes.enumerated()), id: \.element) { index, data in
                NavbarItem(
                    isSelect: .constant(index == modelData.selected ? true : false),
                    title: data.title,
                    resume: data.resume,
                    date: data.date,
                    lang: data.lang
                )
                .onTapGesture {
                    modelData.setSelectedIndex(index: index)
                }
            }
        }
        .toolbar {
            ToolbarItem {
                Button(action: toggleSidebar, label: {Image(systemName: "sidebar.leading")})
            }

            ToolbarItem {
                Button(action: modelData.createNewNote, label: {Image(systemName: "square.and.pencil")})
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

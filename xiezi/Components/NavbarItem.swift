//
//  NavbarButton.swift
//  xiezi
//
//  Created by Marc Intha on 26/09/2022.
//

import SwiftUI

struct NavbarItem: View {
    @Binding var isSelect: Bool
    var title: String
    var resume: String
    var date: String?
    var lang: Language

    let selectedBackground = Color(red: 255 / 255, green: 213 / 255, blue: 46 / 255, opacity: 0.6)

    var body: some View {
        VStack {
            Text(title)
                .bold()
                .padding(.top, 10.0)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)

            Text(resume)
                .frame(maxWidth: .infinity, alignment: .leading)

            if let dateUnwrap = date {
                Text(dateUnwrap)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }

            Spacer()
                .frame(maxHeight: 8.0)

            Text(lang.as_str(s: lang))
                .padding(.horizontal)
                .background(Color.secondaryBackground)
                .cornerRadius(40)
                .frame(maxWidth: .infinity, alignment: .leading)

            Divider()
        }
        .padding(.leading, 10)
        .background(isSelect ? selectedBackground : .clear)
        .contentShape(Rectangle())
        .clipShape(RoundedRectangle(cornerRadius: 8.0, style: .continuous))
        .frame(maxWidth: .infinity)
    }
}

struct NavbarItem_Previews: PreviewProvider {
    static var previews: some View {
        NavbarItem(
            isSelect: .constant(true),
            title: "Foo",
            resume: "foo",
            date: "",
            lang: Language.laotian
        )
    }
}

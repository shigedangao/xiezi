//
//  GeneratorCounter.swift
//  xiezi
//
//  Created by Marc Intha on 30/09/2022.
//

import SwiftUI

struct GeneratorCounter: View {
    var count: Int
    var color: Color
    
    var body: some View {
        HStack {
            Text("Founded")
            ZStack {
                Circle()
                    .stroke(color, lineWidth: 3.0)
                    .frame(width: 25, height: 25)
                
                Text(String(count))
                    .foregroundColor(color)
            }
        }
    }
}

struct GeneratorCounter_Previews: PreviewProvider {
    static var previews: some View {
        GeneratorCounter(
            count: 2,
            color: .blue
        )
    }
}

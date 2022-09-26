//
//  ModelData.swift
//  xiezi
//
//  Created by Marc Intha on 25/09/2022.
//

import Foundation

final class ModelData: ObservableObject {
    @Published var notes: [Note] = load("note.json")
}

// Just a test method to load some stuff
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    print(Bundle.main.bundleURL)
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

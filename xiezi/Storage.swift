//
//  Storage.swift
//  xiezi
//
//  Created by Marc Intha on 16/10/2022.
//

import Foundation

// storage key
let KEY = "xiexie"

// Storage shared among every components
let storage = UserDefaults.standard

// create a storage handle for our notes.
// If nothing exists then return a single instance of a single note
var jsonStorage = storage.string(forKey: KEY)

// Save the store in UserDefault to persist the note that has been created
func SaveStore(notes: [Note]) {
    // conver the notes array into a json file
    do {
        let jsonData = try JSONEncoder().encode(notes)
        let jsonString = String(data: jsonData, encoding: .utf8)
        // store the data in the notes
        storage.set(jsonString, forKey: KEY)
    } catch {
        // maybe show that an error appeared
        print(error)
    }
}

func LoadNotes() -> [Note] {
    let json = storage.string(forKey: KEY)?.data(using: .utf8)
    
    if let data = json {
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([Note].self, from: data)
        } catch {
            print(error)
        }
    }
    
    return [Note.as_default()]
}

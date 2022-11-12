//
//  Note.swift
//  xiezi
//
//  Created by Marc Intha on 25/09/2022.
//
// swiftlint:disable identifier_name
import Foundation

enum Language: String, Codable {
    case traditionalChinese
    case simplifiedChinese
    case laotian

    // As Str give a string representation of the enum
    func as_str(s: Self) -> String {
        switch s {
        case .traditionalChinese:
            return "Traditional chinese"
        case .simplifiedChinese:
            return "Simplified chinese"
        case .laotian:
            return "Laotian"
        }
    }
}

struct Note: Hashable, Codable, Identifiable {
    var id: Int
    var title: String
    var content: String
    var resume: String
    var lang: Language
    var date: String?
    var generated: [String: XuexiGenerate]

    static func as_default(id: Int = 0) -> Note {
        Note(
            id: id,
            title: "新 Note",
            content: "今天我學了...",
            resume: "今天我學",
            lang: Language.traditionalChinese,
            date: Date().formatted(),
            generated: Dictionary()
        )
    }
}

struct XuexiGenerate: Hashable, Codable {
    var writing_method: String
    var second_writing_method: String?
    var pronounciation: String
    var translation: String
    var count: Int
    var color: CColor?

    static func fromJSONDictionary(content: String) -> [String: XuexiGenerate] {
        let decoder = JSONDecoder()
        let formatted = content.data(using: .utf8)

        if let data = formatted {
            do {
                return try decoder.decode([String: XuexiGenerate].self, from: data)
            } catch {
                print(error)
            }
        }

        return Dictionary()
    }
}

struct CColor: Hashable, Codable {
    var red: Double
    var green: Double
    var blue: Double

    static func random() -> CColor {
        return CColor(
            red: Double.random(in: 0.5...1),
            green: Double.random(in: 0.5...1),
            blue: Double.random(in: 0.5...1)
        )
    }
}

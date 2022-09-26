//
//  Note.swift
//  xiezi
//
//  Created by Marc Intha on 25/09/2022.
//

import Foundation

enum Language: String, Codable {
    case TraditionalChinese
    case SimplifiedChinese
    case Laotian
}

struct Note: Hashable, Codable, Identifiable {
    var id: Int
    var title: String
    var content: String
    var lang: Language
    var generated: Dictionary<String, XuexiGenerate>
}

struct XuexiGenerate: Hashable, Codable {
    var writing_method: String
    var second_writing_method: String?
    var pronounciation: String
    var translation: String
    var count: Int
}

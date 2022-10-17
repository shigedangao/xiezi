//
//  XuexiDecorator.swift
//  xiezi
//
//  Created by Marc Intha on 16/10/2022.
//

import Foundation
import XuexiPackage

// Create a handle of the dictionaries globaly
let xuexiDic = XuexiDictionary.new()

struct XuexiDictionary {
    var dictionary: DictionaryWrapper
    
    static func new() -> XuexiDictionary {
        return XuexiDictionary(
            dictionary: DictionaryWrapper.init()
        )
    }
    
    // Load the dictionaries within a task group
    // This allow to load the dictionaries concurrently (a bit like task group in Go)
    func loadDictionaries() async throws -> [String] {
        async let tw: () = await dictionary.load_chinese_dictionary(XuexiCNVersion.Traditional)
        async let cn: () = await dictionary.load_chinese_dictionary(XuexiCNVersion.Simplified)
        async let la: () = await dictionary.load_laotian_dictionary()

        let _ = await [tw, cn, la]
        
        var errors = [String]()
        
        for err in dictionary.has_errors() {
            errors.append(err.as_str().toString())
        }
        
        return errors
    }
}

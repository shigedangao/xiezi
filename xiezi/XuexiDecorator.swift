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
        try await withThrowingTaskGroup(of: (String).self) { group in
            group.addTask {
                let res = await dictionary.load_chinese_dictionary(CNVersion.Traditional)
                return res.toString()
            }
            
            group.addTask {
                let res = await dictionary.load_chinese_dictionary(CNVersion.Simplified)
                return res.toString()
            }
            
            group.addTask {
                let res = await dictionary.load_laotian_dictionary()
                return res.toString()
            }
            
            var errors = [String]()
            
            for try await (msg) in group {
                errors.append(msg)
            }
            
            return errors
        }
    }
}

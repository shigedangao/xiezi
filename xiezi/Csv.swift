//
//  Csv.swift
//  xiezi
//
//  Created by Marc Intha on 18/10/2022.
//

import Foundation
import XuexiPackage

func exportToCsv(lang: XuexiLibLanguage, sentence: String, path: URL) {
    let res = xuexiDic.dictionary.search_and_export(lang, sentence)
    if let csv = res {
        let fm = FileManager.default
        let data = csv.toString().data(using: .utf8)
        
        let created = fm.createFile(atPath: path.relativePath, contents: data)
        if !created {
            print("file not created")
        }
    }
}

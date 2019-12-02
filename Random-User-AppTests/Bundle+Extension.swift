//
//  Bundle+Extension.swift
//  Random-User-App
//
//  Created by Oscar Victoria Gonzalez  on 12/2/19.
//  Copyright © 2019 Oscar Victoria Gonzalez . All rights reserved.
//

import Foundation

extension Bundle {
    static func readRawJSONData(fileName: String, ext: String) -> Data {
        guard let fileURL = Bundle.main.url(forResource: fileName, withExtension: ext) else {
            fatalError("resource with filename \(fileName) not found")
        }
        var data: Data!
        do {
        data = try Data.init(contentsOf: fileURL)
        } catch {
            fatalError("contents not found error: \(error)")
        }
        return data
    }
}

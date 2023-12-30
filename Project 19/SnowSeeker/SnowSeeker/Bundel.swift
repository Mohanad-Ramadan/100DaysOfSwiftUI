//
//  Bundel.swift
//  SnowSeeker
//
//  Created by Mohanad Ramdan on 26/09/2023.
//

import Foundation

extension Bundle{
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil)else{
            fatalError("Could not locate \(file) in the bundle")
        }
        
        guard let data = try? Data(contentsOf: url)else{
            fatalError("Failed to load \(file) from the bundle")
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode(T.self, from: data)else{
            fatalError("Could not decode the data \(file) from the bundle")
        }
        
        return loaded
    }
}

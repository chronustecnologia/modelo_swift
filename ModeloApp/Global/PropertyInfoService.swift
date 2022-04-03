//
//  PropertyInfoService.swift
//  ModeloApp
//
//  Created by José Júlio on 03/04/22.
//

import Foundation

final class PropertyInfoService {
    
    private let fileNamePlist = "Configs"
    
    static let shared = PropertyInfoService()
    
    private var infos: [String: Any] = [:]
    
    private init() {
        if let infoPlistPath = Bundle.main.url(forResource: fileNamePlist, withExtension: "plist") {
            do {
                let infoPlistData = try Data(contentsOf: infoPlistPath)
                
                if let dict = try PropertyListSerialization.propertyList(from: infoPlistData, options: [], format: nil) as? [String: Any] {
                    infos = dict
                }
            } catch {
                print (error)
            }
        }
    }
    
    func string(key forKey: String) -> String {
        return infos[forKey] as! String
    }
    
    func bool(key forKey: String) -> Bool {
        return infos[forKey] as! Bool
    }
    
    func int(key forKey: String) -> Int {
        return infos[forKey] as! Int
    }
    
    func double(key forKey: String) -> Double {
        return infos[forKey] as! Double
    }
}

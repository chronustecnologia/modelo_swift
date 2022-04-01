//
//  String+Extension.swift
//  ModeloVIP
//
//  Created by José Júlio Júnior on 24/03/22.
//

import Foundation

extension String {
    
    func localized(tableName: String, arguments: [CVarArg] = []) -> String {
        String(format: NSLocalizedString(self, tableName: tableName, bundle: .main, comment: ""), arguments: arguments)
    }

    func localized(tableName: String, arguments: CVarArg...) -> String {
        String(format: NSLocalizedString(self, tableName: tableName, bundle: .main, comment: ""), arguments: arguments)
    }
}

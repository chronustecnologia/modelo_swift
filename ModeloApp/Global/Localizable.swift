//
//  Localizable.swift
//  ModeloVIP
//
//  Created by José Júlio Júnior on 11/02/22.
//

import Foundation

protocol Localizable {
    var tableName: String { get }

    func string(_ arguments: [CVarArg]) -> String
    func string(_ arguments: CVarArg...) -> String
}

extension Localizable where Self: RawRepresentable, Self.RawValue == String {
    func string(_ arguments: [CVarArg] = []) -> String {
        rawValue.localized(tableName: tableName, arguments: arguments)
    }

    func string(_ arguments: CVarArg...) -> String {
        rawValue.localized(tableName: tableName, arguments: arguments)
    }
}

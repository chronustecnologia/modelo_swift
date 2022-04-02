//
//  SkeletonModels.swift
//  ModeloApp
//
//  Created by José Júlio on 02/04/22.
//

import UIKit

enum Skeleton {
    enum Model {
        struct Request {}
        struct Response {
            let title: String
            let subtitle: String
            let image: String
        }
        struct ViewModel {
            let title: String
            let dados: [Response]
        }
    }
}

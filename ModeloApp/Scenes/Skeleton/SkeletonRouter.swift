//
//  SkeletonRouter.swift
//  ModeloApp
//
//  Created by José Júlio on 02/04/22.
//

import UIKit

@objc protocol SkeletonRoutingLogic {
    func routeToSomewhere()
}

protocol SkeletonDataPassing {
    var dataStore: SkeletonDataStore? { get }
}

final class SkeletonRouter: NSObject, SkeletonRoutingLogic, SkeletonDataPassing {
    
    // MARK: - Archtecture Objects
    
    weak var viewController: SkeletonViewController?
    var dataStore: SkeletonDataStore?
    
    // MARK: - Routing Logic
    
    func routeToSomewhere() {
        //let nextController = NextViewController()
        //var destinationDS = nextController.router?.dataStore
        //passDataToSomewhere(source: dataStore, destination: &destinationDS)
        //viewController?.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    // MARK: - Passing data
    
    //func passDataToSomewhere(source: SkeletonDataStore, destination: inout SomewhereDataStore) {
        //destination.name = source.name
    //}
}

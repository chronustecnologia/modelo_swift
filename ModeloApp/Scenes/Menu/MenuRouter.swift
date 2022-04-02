//
//  MenuRouter.swift
//  ModeloApp
//
//  Created by José Júlio Júnior on 01/04/22.
//

import UIKit

@objc protocol MenuRoutingLogic {
    func routeToSkeletonView()
}

protocol MenuDataPassing {
    var dataStore: MenuDataStore? { get }
}

final class MenuRouter: NSObject, MenuRoutingLogic, MenuDataPassing {
    
    // MARK: - Archtecture Objects
    
    weak var viewController: MenuViewController?
    var dataStore: MenuDataStore?
    
    // MARK: - Routing Logic
    
    func routeToSkeletonView() {
        let nextViewController = SkeletonViewController()
        //var destinationDS = nextController.router?.dataStore
        //passDataToSomewhere(source: dataStore, destination: &destinationDS)
        viewController?.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    // MARK: - Passing data
    
    //func passDataToSomewhere(source: MenuDataStore, destination: inout SomewhereDataStore) {
        //destination.name = source.name
    //}
}

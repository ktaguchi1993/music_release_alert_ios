//
//  HomeWireframe.swift
//  MusicRelease
//
//  Created by ktaguchi on 2023/10/23.
//

protocol HomeWireframeProtocol {
    func showNewRelease()
}

class HomeWireframe: HomeWireframeProtocol {
    
    weak private var viewController: ViewController!
    
    init(viewController: ViewController) {
        self.viewController = viewController
    }
    
    func showNewRelease() {
        let vc = NewReleaseBuilder().build()
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
}

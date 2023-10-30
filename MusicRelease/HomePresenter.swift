//
//  HomePresenter.swift
//  MusicRelease
//
//  Created by ktaguchi on 2023/10/23.
//

protocol HomePresenterProtocol: AnyObject {
    func showNewRelease()
}

class HomePresenter: HomePresenterProtocol {
    
    var wireframe: HomeWireframeProtocol!
    
    init(wireframe: HomeWireframeProtocol) {
        self.wireframe = wireframe
    }
    
    func showNewRelease() {
        wireframe.showNewRelease()
    }
}


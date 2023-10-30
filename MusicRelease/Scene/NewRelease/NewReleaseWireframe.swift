//
//  NewReleaseWireframe.swift
//  MusicRelease
//
//  Created by ktaguchi on 2023/10/20.
//

protocol NewReleaseWireframeProtocol {
    
}

class NewReleaseWireframe: NewReleaseWireframeProtocol {
    weak private var viewController: NewReleaseViewController!
    
    init(viewController: NewReleaseViewController) {
        self.viewController = viewController
    }
}


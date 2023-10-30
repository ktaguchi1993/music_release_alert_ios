//
//  NewReleaseBuilder.swift
//  MusicRelease
//
//  Created by ktaguchi on 2023/10/20.
//

import UIKit

struct NewReleaseBuilder {
    func build() -> UIViewController {
        let viewController = NewReleaseViewController.make()
        let wireframe = NewReleaseWireframe(viewController: viewController)
        let useCase = NewReleaseUseCase(repository: NewReleaseRepository())
        let presenter = NewReleasePresenter(useCase: useCase, wireframe: wireframe)
        viewController.inject(presenter: presenter)
        
        return viewController
    }
}

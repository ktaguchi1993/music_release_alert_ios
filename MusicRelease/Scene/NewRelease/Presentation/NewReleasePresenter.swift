//
//  NewReleasePresenter.swift
//  MusicRelease
//
//  Created by ktaguchi on 2023/10/22.
//

import RxSwift

protocol NewReleasePresenterProtocol: AnyObject {
    var viewReloadData: PublishSubject<[NewReleaseModel]> { get }
    var startActivityIndicator: PublishSubject<Bool> { get }
    
    func load()
}

final class NewReleasePresenter: NewReleasePresenterProtocol {
    
    var wireframe: NewReleaseWireframeProtocol!
    var useCase: NewReleaseUseCaseProtocol!
    
    private(set) var viewReloadData = PublishSubject<[NewReleaseModel]>()
    private(set) var startActivityIndicator = PublishSubject<Bool>()
    
    private let disposeBag = DisposeBag()
    
    init(useCase: NewReleaseUseCaseProtocol, wireframe: NewReleaseWireframeProtocol) {
        self.wireframe = wireframe
        self.useCase = useCase
    }
}

extension NewReleasePresenter {
    func load() {
        startActivityIndicator.onNext(true)
        useCase.load()
            .subscribe(
                onNext: { [weak self] model in
                    guard let self = self else { return }
                    self.startActivityIndicator.onNext(false)
                    self.viewReloadData.onNext(model)
                },
                onError: { error in
                    self.startActivityIndicator.onNext(false)
                    print("Error: \(error)")
                }
            )
            .disposed(by: disposeBag)
    }
}


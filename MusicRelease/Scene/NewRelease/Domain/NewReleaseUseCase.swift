//
//  NewReleaseUseCase.swift
//  MusicRelease
//
//  Created by ktaguchi on 2023/10/20.
//

import RxSwift

protocol NewReleaseUseCaseProtocol {
    func load() -> Observable<[NewReleaseModel]>
}

final class NewReleaseUseCase: NewReleaseUseCaseProtocol {
    private let newReleaseRepository: NewReleaseRepositoryProtocol!
    
    func load() -> Observable<[NewReleaseModel]> {
        newReleaseRepository.fetchNewRelease()
            .asObservable()
            .map{ NewReleaseTranslator.generate(entities: $0) }
    }
    
    init(repository: NewReleaseRepositoryProtocol!) {
        self.newReleaseRepository = repository
    }
}


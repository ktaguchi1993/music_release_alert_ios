//
//  NewReleaseRepository.swift
//  MusicRelease
//
//  Created by ktaguchi on 2023/10/20.
//

import RxSwift

protocol NewReleaseRepositoryProtocol {
    func fetchNewRelease() -> Single<[NewReleaseEntity]>
}

final class NewReleaseRepository: NewReleaseRepositoryProtocol {
    lazy var newReleaseDataStore = NewReleaseDataStoreFactory.createNewReleaseDataStore()
}

extension NewReleaseRepository {
    func fetchNewRelease() -> Single<[NewReleaseEntity]> {
        newReleaseDataStore.fetchNewRelease()
    }
}


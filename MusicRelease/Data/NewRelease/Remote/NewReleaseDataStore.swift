//
//  NewReleaseDataStore.swift
//  MusicRelease
//
//  Created by ktaguchi on 2023/10/20.
//

import RxSwift
import Alamofire

protocol NewReleaseDataStoreProtocol {
    func fetchNewRelease() -> Single<[NewReleaseEntity]>
}

final class NewReleaseDataStoreRequest: NewReleaseDataStoreProtocol {
    func fetchNewRelease() -> Single<[NewReleaseEntity]> {
        return Single<[NewReleaseEntity]>.create { single in
            let url = "http://localhost:8888/v1/new_release/"
            
            let request = AF.request(url).responseDecodable(of: [NewReleaseEntity].self) { response in
                switch response.result {
                case .success(let newReleaseEntities):
                    single(.success(newReleaseEntities))
                    
                case .failure(let error):
                    single(.failure(error))
                }
            }
            
            return Disposables.create {
                request.cancel()
            }
        }
    }

}

struct NewReleaseDataStoreFactory {
    static func createNewReleaseDataStore() -> NewReleaseDataStoreProtocol {
        NewReleaseDataStoreRequest()
    }
}

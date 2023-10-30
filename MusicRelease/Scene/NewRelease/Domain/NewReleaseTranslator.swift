//
//  NewReleaseTranslator.swift
//  MusicRelease
//
//  Created by ktaguchi on 2023/10/20.
//

final class NewReleaseTranslator {
    static func generate(entities: [NewReleaseEntity]) -> [NewReleaseModel] {
        entities.map { entity in
            NewReleaseModel(
                title: entity.title,
                artist: entity.artist,
                releaseDate: entity.releaseDate,
                url: entity.url
            )
        }
    }
}

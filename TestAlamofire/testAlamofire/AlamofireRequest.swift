//
//  AlamofireRequest.swift
//  TestAlamofire
//
//  Created by mac on 2022/11/22.
//

import Foundation

struct JHSJAlamofire: Codable {
    let totalArticles: Int
    let articles: [Article]

    enum CodingKeys: String, CodingKey {
        case totalArticles = "totalArticles"
        case articles = "articles"
    }
}

// MARK: - Article
struct Article: Codable {
    let title: String
    let articleDescription: String
    let content: String
    let url: String
    let image: String
    let publishedAt: String
    let source: Source

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case articleDescription = "description"
        case content = "content"
        case url = "url"
        case image = "image"
        case publishedAt = "publishedAt"
        case source = "source"
    }
}

// MARK: - Source
struct Source: Codable {
    let name: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
    }
}





struct AlamofireRequest: Codable {
    let id: String
    let releasedAt: Int
    let title: String
    let smallPosterURL: String
    let collection: String
    let number: Int
    let synopsis: String
    let url: String
    let posterURL: String
    let mediaDuration: Int
    let subscriptionOnly: Bool
    let hlsURL: String?
    let previewURL: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case releasedAt = "released_at"
        case title = "title"
        case smallPosterURL = "small_poster_url"
        case collection = "collection"
        case number = "number"
        case synopsis = "synopsis"
        case url = "url"
        case posterURL = "poster_url"
        case mediaDuration = "media_duration"
        case subscriptionOnly = "subscription_only"
        case hlsURL = "hls_url"
        case previewURL = "preview_url"
    }
    
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        id = try values.decodeIfPresent(String.self, forKey: .id)!
//        releasedAt = try values.decodeIfPresent(Int.self, forKey: .releasedAt)!
//        title = try values.decodeIfPresent(String.self, forKey: .title)!
//        smallPosterURL = try values.decodeIfPresent(String.self, forKey: .smallPosterURL)!
//        collection = try values.decodeIfPresent(String.self, forKey: .collection)!
//        number = try values.decodeIfPresent(Int.self, forKey: .number)!
//        synopsis = try values.decodeIfPresent(String.self, forKey: .synopsis)!
//        url = try values.decodeIfPresent(String.self, forKey: .url)!
//        posterURL = try values.decodeIfPresent(String.self, forKey: .posterURL)!
//        mediaDuration = try values.decodeIfPresent(Int.self, forKey: .mediaDuration)!
//        subscriptionOnly = try values.decodeIfPresent(Bool.self, forKey: .subscriptionOnly)!
//        hlsURL = try values.decodeIfPresent(String.self, forKey: .hlsURL)
//        previewURL = try values.decodeIfPresent(String.self, forKey: .previewURL)
//
//    }
    
}

//
//  NewsViewModel.swift
//  PTNews
//
//  Created by Luiz Durães on 05/02/2020.
//  Copyright © 2020 Luiz Durães. All rights reserved.
//

import Foundation

struct CustomImage {
    var url: String
    var title: String?
}

extension CustomImage: Codable {
    enum CodingKeys: String, CodingKey {
        case url
        case title = "legenda"
    }
    
    init(decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        url = try values.decode(String.self, forKey: .url)
        title = try values.decode(String.self, forKey: .title)
    }
}

struct NewsViewModel: Identifiable {
    var id: Int
    var title: String
    var body: String?
    var url: String?
    var shareUrl: String?
    var images: [CustomImage]?
}

extension NewsViewModel: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case title = "cleanTitle"
        case body = "descricao"
        case url = "fullUrl"
        case shareUrl
        case images = "imagens"
    }
    
    init(decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        title = try values.decode(String.self, forKey: .title)
        body = try values.decode(String.self, forKey: .body)
        url = try values.decode(String.self, forKey: .url)
        shareUrl = try values.decode(String.self, forKey: .shareUrl)
        images = [try values.decode(CustomImage.self, forKey: .images)]
    }
}

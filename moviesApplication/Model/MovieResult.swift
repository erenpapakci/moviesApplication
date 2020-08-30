//
//  MovieResult.swift
//  moviesApplication
//
//  Created by Eren Papakçı on 30.08.2020.
//  Copyright © 2020 Eren Papakçı. All rights reserved.
//

import Foundation

public struct MovieResult: Codable {
    let page: Int
    let total_results: Int
    let total_pages: Int
    var results: [Movie] = [Movie]()
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        page = try values.decodeIfPresent(Int.self, forKey: .page) ?? 1
        total_results = try values.decodeIfPresent(Int.self, forKey: .total_results) ?? 1
        total_pages = try values.decodeIfPresent(Int.self, forKey: .total_pages) ?? 1
        //optional olanları otional yap limit dışına çıktığında kontrol et data bitti dersin tekrar yüklemezsin
        results = try values.decodeIfPresent([Movie].self, forKey: .results)!
    }
    
}

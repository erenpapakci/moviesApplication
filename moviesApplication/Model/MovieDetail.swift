//
//  MovieDetail.swift
//  moviesApplication
//
//  Created by Eren Papakçı on 30.08.2020.
//  Copyright © 2020 Eren Papakçı. All rights reserved.
//

import Foundation

public struct MovieDetail: Codable {
    let original_title: String?
    let overview: String?
    let poster_path: String?
    let vote_count: Int?
    let backdrop_path: String?
    
    public init(from decoder: Decoder) throws {
      let values = try decoder.container(keyedBy: CodingKeys.self)
      original_title = try values.decodeIfPresent(String.self, forKey: .original_title)
      overview = try values.decodeIfPresent(String.self, forKey: .overview)
      poster_path = try values.decodeIfPresent(String.self, forKey: .poster_path)
      vote_count = try values.decodeIfPresent(Int.self, forKey: .vote_count)
      backdrop_path = try values.decodeIfPresent(String.self, forKey: .backdrop_path)
    }
}

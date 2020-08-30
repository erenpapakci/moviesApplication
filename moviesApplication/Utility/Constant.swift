//
//  Constant.swift
//  moviesApplication
//
//  Created by Eren Papakçı on 30.08.2020.
//  Copyright © 2020 Eren Papakçı. All rights reserved.
//

import Foundation

public final class Constant {
    
    private static let appKey = "fd2b04342048fa2d5f728561866ad52a"
    
    public static let baseUrl = "https://api.themoviedb.org/3/search/movie?api_key=\(appKey)"
    
    public static let baseUrlDetail = "https://api.themoviedb.org/3/movie/"
    
    public static let pageKey = "&page="
    
    public static let queryKey = "&query="
    
    public static let imageBaseUrl = "https://image.tmdb.org/t/p/w185/"
    
    public static let movieApiKey = "?api_key=\(appKey)"
    
}

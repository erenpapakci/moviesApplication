//
//  HomeViewModel.swift
//  moviesApplication
//
//  Created by Eren Papakçı on 30.08.2020.
//  Copyright © 2020 Eren Papakçı. All rights reserved.
//

import Foundation

public final class HomeViewModel: BaseViewModel, HomeViewModelProtocol {
    
    public lazy var movieResult = Observable<MovieResult>()
    
    private var hasResult: Bool = true
    
    public func searchMovies(searchText: String, page: Int = 1) {
        if !hasResult { return }
        guard let escaepedString = searchText.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        
        let query = Constant.baseUrl + Constant.queryKey + escaepedString + Constant.pageKey + "\(page)"
        
        Services.shared.execute(query: query, type: MovieResult.self, completion: { [weak self] result in
            self?.configureResults(result: result)
        })
    }
    
    public func clear() {
        hasResult = true
        movieResult.data = nil
    }
    
    private func configureResults(result: MovieResult) {
        if result.results.count == 0 {
            hasResult = false
            return
        }
        
        var tmpResult = result
        if var tmpMovies = movieResult.data?.results {
            for movie in result.results {
                tmpMovies.append(movie)
            }
            tmpResult.results = tmpMovies
            movieResult.data = tmpResult
        } else {
            movieResult.data = result
        }
    }
}


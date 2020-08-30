//
//  DetailViewModel.swift
//  moviesApplication
//
//  Created by Eren Papakçı on 30.08.2020.
//  Copyright © 2020 Eren Papakçı. All rights reserved.
//

import Foundation

public final class DetailViewModel: BaseViewModel, DetailViewModelProtocol {
    
    public lazy var movieResult = Observable<MovieDetail>()
    
    public func detailMovies(movieId: Int) {
        let movieId = String(movieId)
        let query = Constant.baseUrlDetail + movieId + Constant.movieApiKey
        Services.shared.execute(query: query, type: MovieDetail.self, completion: { [weak self] result in
            self?.movieResult.data = result
        })
    }
}

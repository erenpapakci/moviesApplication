//
//  DetailViewModelProtocol.swift
//  moviesApplication
//
//  Created by Eren Papakçı on 30.08.2020.
//  Copyright © 2020 Eren Papakçı. All rights reserved.
//


import Foundation

public protocol DetailViewModelProtocol where Self : BaseViewModel {
    
    var movieResult: Observable<MovieDetail> { get set }
    
    func detailMovies(movieId: Int)
}

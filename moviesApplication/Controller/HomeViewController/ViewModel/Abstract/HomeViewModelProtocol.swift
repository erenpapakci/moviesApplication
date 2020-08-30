//
//  HomeViewModelProtocol.swift
//  moviesApplication
//
//  Created by Eren Papakçı on 30.08.2020.
//  Copyright © 2020 Eren Papakçı. All rights reserved.
//

import Foundation

public protocol HomeViewModelProtocol where Self: BaseViewModel {
    
    var movieResult: Observable<MovieResult> { get set }
    
    func searchMovies(searchText: String, page: Int)
    
    func clear()
}

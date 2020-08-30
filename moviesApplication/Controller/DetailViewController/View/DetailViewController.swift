//
//  DetailViewController.swift
//  moviesApplication
//
//  Created by Eren Papakçı on 30.08.2020.
//  Copyright © 2020 Eren Papakçı. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: BaseViewController<DetailViewModel> {
    
    @IBOutlet weak var detailPoster: UIImageView!
    @IBOutlet weak var detailName: UILabel!
    @IBOutlet weak var detailDescription: UILabel!
    
    var movieId: Int? {
        didSet{
            guard let movieId = movieId else { return }
            getDetails(movieId)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observeViewModel()
    }

    
    func getDetails(_ movieId : Int) {
        viewModel.detailMovies(movieId: movieId)
    }
    
    //???
    private func observeViewModel() {
        viewModel.movieResult.addObserver(observer: { [weak self] _ in
            self?.setUI(UIdata: self!.viewModel.movieResult.data!)
        })
    }
    
    func setUI(UIdata: MovieDetail){
        self.detailName.text = UIdata.original_title
        self.detailDescription.numberOfLines = 0;
        self.detailDescription.text = UIdata.overview
        if let path = UIdata.poster_path, let url = URL(string: Constant.imageBaseUrl + path) {
            if let data = try? Data(contentsOf:url) {
                  self.detailPoster.image = UIImage(data: data)
              }
        }
    }
    
}

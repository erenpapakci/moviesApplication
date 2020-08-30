//
//  MovieTableViewCell.swift
//  moviesApplication
//
//  Created by Eren Papakçı on 30.08.2020.
//  Copyright © 2020 Eren Papakçı. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {


    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet var moviePosterImageView: UIImageView!
    @IBOutlet weak var movieYearLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with model: Movie){
        self.movieTitleLabel.text = model.title
        self.movieYearLabel.text = model.release_date
        if let path = model.poster_path, let url = URL(string: Constant.imageBaseUrl + path) {
            if let data = try? Data(contentsOf:url) {
                  self.moviePosterImageView.image = UIImage(data: data)
              }
        }
    }
}

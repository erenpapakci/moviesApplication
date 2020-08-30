//
//  HomeViewController.swift
//  moviesApplication
//
//  Created by Eren Papakçı on 30.08.2020.
//  Copyright © 2020 Eren Papakçı. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: BaseViewController<HomeViewModel>,UITextFieldDelegate{
    
    @IBOutlet weak var txtField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    private var searchText: String?
    private var intPage: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
        observeViewModel()
        txtField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        clear()
        self.search()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
      if string.isEmpty {
        clear()
      }
      return true
    }
    
    private func search() {
        txtField.resignFirstResponder()
        guard let text = txtField.text, !text.isEmpty else {
            return
        }
        let query = text.replacingOccurrences(of: " ", with: "%20")
        viewModel.searchMovies(searchText: query, page: intPage)
        intPage += 1
        
    }
    
    //textfield silindikten sonra çağırılacak.
    public func clear() {
        viewModel.clear()
        tableView.reloadData()
        searchText = nil
        intPage = 1
    }
    
    private func observeViewModel() {
        viewModel.movieResult.addObserver(observer: { [weak self] _ in
            self?.tableView.reloadData()
        })
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                if let results = viewModel.movieResult.data?.results {
                    let movie = results[indexPath.row]
                    let controller = segue.destination as? DetailViewController
                    controller?.movieId = movie.id
                }
            }
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    private func initTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView()
        self.tableView.register(MovieTableViewCell.nib(), forCellReuseIdentifier: MovieTableViewCell.identifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movieResult.data?.results.count ??  0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as? MovieTableViewCell {
            if let results = viewModel.movieResult.data?.results {
                cell.configure(with: results[indexPath.row])
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let result = viewModel.movieResult.data else { return }
        
        if indexPath.row >= result.results.count - 1 {
            search()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: nil)
    }
}

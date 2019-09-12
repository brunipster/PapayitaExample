//
//  HomeViewController.swift
//  PapayitaExample
//
//  Created by Bruno Reyes on 9/11/19.
//  Copyright © 2019 Bruno Reyes. All rights reserved.
//

import UIKit
import Kingfisher
import PaginatedTableView

class HomeViewController: UIViewController, HomeViewDelegate{
    var page: Int = 0
    
    
    @IBOutlet weak var tablePeliculas: PaginatedTableView!
    
    var listMovies = [Movie]()
    var presenter: HomePresenterDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib.init(nibName: "PeliculaCell", bundle: nil)
        self.tablePeliculas.register(nib, forCellReuseIdentifier: "PeliculaCell")
        tablePeliculas.paginatedDataSource = self
        tablePeliculas.paginatedDelegate = self
        tablePeliculas.loadData(refresh: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func configView(){
    }
    
    func reloadTableViewListMovie(_ moviesList: [Movie]) {
        self.listMovies.append(contentsOf: moviesList)
    }
}

extension HomeViewController: PaginatedTableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}

extension HomeViewController:PaginatedTableViewDelegate{
    func loadMore(_ pageNumber: Int, _ pageSize: Int, onSuccess: ((Bool) -> Void)?, onError: ((Error) -> Void)?) {
        
        if pageNumber == 1 { self.listMovies = [Movie]() }
        presenter?.updateView(page: pageNumber, respose: ({
            onSuccess?(true)
        }))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PeliculaCell", for: indexPath) as! PeliculaCell
        let item:Movie =  self.listMovies[indexPath.row]
        cell.lblTitulo.text = item.title
        cell.lblDirector.text = item.originalTitle
        let url = URL(string: "http://image.tmdb.org/t/p/w500\(item.posterPath)")
        cell.imgView.kf.setImage(with: url, placeholder: UIImage(named: "notFound"), options: nil, progressBlock: nil, completionHandler: { (image, error, cacheType, URL) in
        })
        cell.vwRating.rating = item.popularity*0.1/5
        cell.lblDirector.text = Array(item.genres).map({"\($0)"}).joined(separator:" , ")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

//
//  File.swift
//  PapayitaExample
//
//  Created by Bruno Reyes on 9/10/19.
//  Copyright © 2019 Bruno Reyes. All rights reserved.
//

import Foundation


protocol ListaInteractorDelegate: class {
    func receivePopularMovies(popularMovies: [Pelicula.Popular])
    
    func receiveViewController(viewController: ListViewController)
    
    func load()
}


class ListInteractor {
    
    var peliculasPopulares: [Pelicula.Popular]?
    var peliculasEstreno: [Pelicula.Estreno]?
    var detallePelicula: Pelicula.Detalle?
    
    var listaServicio: ListaServicio = ListaServicio()
    var listaPresenter: ListaPresenterDelegate?// = ListPresenter()
    var listViewController: ListaViewController?
    
    init(presenterDelegate: ListPresenterDelegate?) {
        //        listPresenter?.
        let listPresenter = ListPresenter()
        listPresenter.delegate = presenterDelegate
        self.listPresenter = listPresenter
    }
    
    func receiveDetallePelicula(pelicula: Pelicula.Detalle) {
        detallePelicula = pelicula
    }
    
    func receivePopulares(pelis: [Pelicula.Popular]) {
        self.peliculasPopulares = pelis
    }
    
    func receiveEstrenos(pelicula: [Pelicula.Estreno]) {
        self.peliculasEstreno = pelicula
    }
    
}

extension ListInteractor: ListaServicioDelegate {
    func obtenerPopulares(didFinishGettingPopularMovies movies: [Pelicula.Popular]) {
        receivePopulares(pelis: movies)
    }
    
    func obtenerEstrenos(didFinishGettingPlayingNowMovies movies: [Pelicula.Estreno]) {
        receiveEstrenos(pelicula: movies)
    }
    
    func obtenerDetalle(didFinishGettingMovieDetails pelicula: Pelicula.Detalle) {
        receiveDetallePelicula(pelicula: pelicula)
    }
    
}

extension ListInteractor: ListaInteractorDelegate {
    func receiveViewController(viewController: ListaViewController) {
        self.listViewController = viewController
    }
    
    func receivePopularMovies(popularMovies: [Pelicula.Popular]) {
        print(popularMovies)
    }
    
    func load() {
        listaServicio.delegate = self
        listaServicio.getPopularMoviesRequest() { (data, error) in
            // Receiving asynchronous information
            self.listPresenter?.receiveViewController(viewController: self.listViewController ?? ListViewController())
            self.listPresenter?.receivePopularMovies(movies: self.popularMovies ?? [])
        }
        
        listaServicio.getPlayingNowRequest() { (data, error) in
            self.listPresenter?.receiveViewController(viewController: self.listViewController ?? ListViewController())
            self.listPresenter?.receivePlayingNowMovies(movies: self.playingNowMovies ?? [])
        }
    }
}

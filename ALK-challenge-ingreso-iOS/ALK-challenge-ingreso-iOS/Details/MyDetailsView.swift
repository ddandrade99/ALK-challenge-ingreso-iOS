//
//  myScrollView.swift
//  ALK-challenge-ingreso-iOS
//
//  Created by Daniel De Andrade Souza on 14/09/22.
//

import UIKit

class MyDetailsView: UIView {

    lazy var meliYellow: UIView = {
        let meli = UIView()
        meli.backgroundColor = .systemYellow
        meli.translatesAutoresizingMaskIntoConstraints = false
        return meli
    }()
    
//    let favoritesButton
    
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = .white
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    lazy var productView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var title: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 16.0)
        title.textAlignment = .left
        title.numberOfLines = 0
        title.textColor = .black
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy var productImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .white
        image.clipsToBounds = true
        image.layer.cornerRadius = 6
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    lazy var price: UILabel = {
        let price = UILabel()
        price.font = UIFont.boldSystemFont(ofSize: 32.0)
        price.textAlignment = .left
        price.numberOfLines = 0
        price.textColor = .black
        price.translatesAutoresizingMaskIntoConstraints = false
        return price
    }()
    
    func setupDetailsView(){
        setupHierarchy()
        setupConstraints()
    }
    
    func setupHierarchy(){
        addSubview(meliYellow)
        addSubview(scrollView)
        scrollView.addSubview(productView)
        productView.addSubview(title)
        productView.addSubview(productImageView)
        productView.addSubview(price)
        
    }
    
    func setupConstraints(){
        let constraints = [
            meliYellow.leadingAnchor.constraint(equalTo: leadingAnchor),
            meliYellow.trailingAnchor.constraint(equalTo: trailingAnchor),
            meliYellow.topAnchor.constraint(equalTo: topAnchor),
            meliYellow.heightAnchor.constraint(equalToConstant: 124),
            
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: meliYellow.bottomAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            productView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            productView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            productView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            productView.heightAnchor.constraint(equalToConstant: 1500),
            productView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            title.topAnchor.constraint(equalTo: productView.topAnchor, constant: 24),
            title.leadingAnchor.constraint(equalTo: productView.leadingAnchor, constant: 16),
            title.trailingAnchor.constraint(equalTo: productView.trailingAnchor, constant: -16),
            
            productImageView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 24),
            productImageView.leadingAnchor.constraint(equalTo: productView.leadingAnchor, constant: 16),
            productImageView.trailingAnchor.constraint(equalTo: productView.trailingAnchor, constant: -16),
            productImageView.centerXAnchor.constraint(equalTo: productView.centerXAnchor),
            productImageView.heightAnchor.constraint(equalToConstant: 275),
            
            price.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 24),
            price.leadingAnchor.constraint(equalTo: productView.leadingAnchor, constant: 16),
            price.trailingAnchor.constraint(equalTo: productView.trailingAnchor, constant: -16),
            
            
        ]
        NSLayoutConstraint.activate(constraints)
        
        
    }
}

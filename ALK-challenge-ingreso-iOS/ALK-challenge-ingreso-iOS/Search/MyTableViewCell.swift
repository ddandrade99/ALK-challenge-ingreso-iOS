//
//  MyTableViewCell.swift
//  ALK-challenge-ingreso-iOS
//
//  Created by Daniel De Andrade Souza on 14/09/22.
//

import UIKit
import Kingfisher

class MyTableViewCell: UITableViewCell {

    let productImage: UIImageView = {
        let imagem:UIImageView = UIImageView()
        imagem.translatesAutoresizingMaskIntoConstraints = false
        imagem.backgroundColor = .white
        imagem.clipsToBounds = true
        imagem.layer.cornerRadius = 6
        imagem.contentMode = .scaleAspectFit
        return imagem
    }()
    
    let title: UILabel = {
        let title: UILabel = UILabel()
        title.font = UIFont.systemFont(ofSize: 14.0)
        title.textAlignment = .left
        title.numberOfLines = 0
        title.textColor = .black
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    let price: UILabel = {
        let price: UILabel = UILabel()
        price.font = UIFont.boldSystemFont(ofSize: 24.0)
        price.textAlignment = .left
        price.numberOfLines = 0
        price.textColor = .black
        price.translatesAutoresizingMaskIntoConstraints = false
        return price
    }()
    
    func setupCell(title: String, price: Double, imageURL: String){
        self.title.text = title
        self.price.text = String(format: "R$ %.2f", price)
        let processor = RoundCornerImageProcessor(cornerRadius: 10)
        let url = URL.init(string: imageURL)
        self.productImage.kf.indicatorType = .activity
        self.productImage.kf.setImage(with: url, options: [.processor(processor)])
        
        setupViewHierarchy()
        setupConstraints()
    }
    
    func setupViewHierarchy(){
        addSubview(productImage)
        addSubview(title)
        addSubview(price)
    }
    
    func setupConstraints(){
        let constraints = [
            productImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            productImage.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            productImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            productImage.widthAnchor.constraint(equalToConstant: 100),
            
            title.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            title.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 16),
            title.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            price.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 8),
            price.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 16),
            price.trailingAnchor.constraint(equalTo: trailingAnchor)
            
        ]
        NSLayoutConstraint.activate(constraints)
    }

}

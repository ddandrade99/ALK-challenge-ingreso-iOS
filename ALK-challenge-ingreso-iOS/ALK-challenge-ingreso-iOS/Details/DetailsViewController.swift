//
//  DetailsViewController.swift
//  ALK-challenge-ingreso-iOS
//
//  Created by Daniel De Andrade Souza on 14/09/22.
//

import UIKit
import Kingfisher

class DetailsViewController: UIViewController {

    var product: ItemFromCategory
    let myDetailsView = MyDetailsView()
    
    init(_ product: ItemFromCategory) {
        self.product = product
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myDetailsView.backgroundColor = .white
        view.addSubview(myDetailsView)
        setupConstraints()
        myDetailsView.setupDetailsView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupView()
    }
    
    func setupView(){
        myDetailsView.productImageView.kf.setImage(with: URL(string: product.pictures[0].secureUrl)!)
        myDetailsView.title.text = product.title
        myDetailsView.price.text = String(format: "R$ %.2f", product.price)
    }
    
    func setupConstraints(){
        myDetailsView.translatesAutoresizingMaskIntoConstraints = false
        myDetailsView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        myDetailsView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        myDetailsView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        myDetailsView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

}

//
//  SearchViewController.swift
//  ALK-challenge-ingreso-iOS
//
//  Created by Daniel De Andrade Souza on 12/09/22.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var mySearchBar: UISearchBar!
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mySearchBar.delegate = self
        myTableView.delegate = self
        myTableView.dataSource = self
        
        
    }


}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("⚠️")
    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

extension SearchViewController: UITableViewDelegate {
    
}

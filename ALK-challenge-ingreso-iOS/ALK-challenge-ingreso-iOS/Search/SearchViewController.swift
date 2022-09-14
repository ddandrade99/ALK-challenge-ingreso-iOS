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
    let service = Service()
    var items: [MultiGetResponse] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mySearchBar.delegate = self
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.register(MyTableViewCell.self, forCellReuseIdentifier: "cell")
        myTableView.rowHeight = 160
        service.multiGetDelegate = self
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(searchBar.text!)
        service.fetchCategorySearched(category: searchBar.text!)
    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MyTableViewCell else { return UITableViewCell() }
        let item = items[indexPath.row]
        cell.setupCell(title: item.body.title, price: item.body.price, imageURL: item.body.pictures[0].secure_url)
        
        return cell
    }
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//        navigationController?.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: true)
    }
}

extension SearchViewController: MultiGetDelegate {
    func updateHighlightedItems(_ service: Service, content: [MultiGetResponse]) {
        DispatchQueue.main.async {
            self.items = content
            self.myTableView.reloadData()
        }
    }
}

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
        service.multiGetDelegate = self
        setupTableView()
    }
    
    func setupTableView(){
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.register(MyTableViewCell.self, forCellReuseIdentifier: "cell")
        myTableView.rowHeight = 160
        for subView in mySearchBar.subviews
        {
            for subView1 in subView.subviews
            {

                if subView1.isKind(of: UITextField.self)
                {
                    subView1.backgroundColor = .blue
                }
            }

        }
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let search = searchBar.text else { return }
        print("🟢DEBUG🟢 text Input: \(search)")
        if search.isEmpty {
            return
        }
        service.fetchCategorySearched(category: search)
    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MyTableViewCell else { return UITableViewCell() }
        let item = items[indexPath.row]
        cell.setupCell(title: item.body.title, price: item.body.price, imageURL: item.body.secureThumbnail)
        
        return cell
    }
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = items[indexPath.row].body
        let detailsVC = DetailsViewController(item)
        self.navigationController?.pushViewController(detailsVC, animated: true)
        print("🟢DEBUG🟢 item \(indexPath.row) selected: \(item.title)")
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

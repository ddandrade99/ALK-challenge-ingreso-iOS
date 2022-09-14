//
//  Service.swift
//  ALK-challenge-ingreso-iOS
//
//  Created by Daniel De Andrade Souza on 13/09/22.
//

import Foundation

protocol MultiGetDelegate {
    func updateHighlightedItems(_ service: Service, content: [MultiGetResponse])
}
 
final class Service {
    
    let url_base = "https://api.mercadolibre.com"
    let api_token = "APP_USR-1782731037846423-091414-8b6c8a8967874e22dad765710856b61f-1168864359"
    var multiGetDelegate: MultiGetDelegate?
    
    func fetchCategorySearched(category: String) {
        let session = URLSession.shared
        let url = URL(string: "\(url_base)/sites/MLB/domain_discovery/search?limit=1&q=\(category)")
        var request = URLRequest(url: url!)
        request.setValue(self.api_token, forHTTPHeaderField: "Authorization")
        let task = session.dataTask(with: request) { data, response, error in
            if error == nil {
                guard let data = data else { return }
                do {
                    let category = try JSONDecoder().decode([Category].self, from: data)
                    self.getHighlightsCategory(categoryID: category[0].categoryID)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        task.resume()
    }
    
    func getHighlightsCategory(categoryID: String) {
        
        let url = URL(string: "\(url_base)/highlights/MLB/category/\(categoryID)")
        var request = URLRequest(url: url!)
        request.setValue("Bearer \(self.api_token)", forHTTPHeaderField: "Authentication")
        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.httpAdditionalHeaders = ["Authorization": "Bearer \(self.api_token)"]
        let session = URLSession(configuration: sessionConfiguration)
        let task = session.dataTask(with: request) { data, response, error in
            if error == nil {
                guard let result = data else { return }
                do {
                    let content = try JSONDecoder().decode(Content.self, from: result)
                    let itemIDs = self.getItemIDs(content)
                    self.getItemsFromContent(ContentID: itemIDs)
                } catch {
                    print(error.localizedDescription)
                    print("⚠️")
                }
            }
        }
        task.resume()
    }
    
    func getItemsFromContent(ContentID: String) {

        let url = URL(string: "\(url_base)/items?ids=\(ContentID)")
        var request = URLRequest(url: url!)
        request.setValue("Bearer \(self.api_token)", forHTTPHeaderField: "Authentication")
        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.httpAdditionalHeaders = ["Authorization": "Bearer \(self.api_token)"]
        let session = URLSession(configuration: sessionConfiguration)
        let task = session.dataTask(with: request) { data, response, error in
            if error == nil {
                guard let result = data else { return }
                do {
                    let item = try JSONDecoder().decode([MultiGetResponse].self, from: result)
                    self.multiGetDelegate?.updateHighlightedItems(self, content: item)
                } catch {
                    print(error.localizedDescription)
                    print("⚠️⚠️")
                }
            }
        }
        task.resume()
    }

    func getItemIDs(_ content: Content) -> String {
        var ids: String = ""
        for item in content.content {
            ids.append("\(item.id),")
        }
        return ids
    }
}


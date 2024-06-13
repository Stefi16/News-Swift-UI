//
//  NetworkManager.swift
//  news
//
//  Created by Stefka Krachunova on 13.06.24.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData() {
        let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page")
        
        if let safeUrl = url {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: safeUrl) { (data, response, error) in
                if let err = error {
                    print(err)
                } else {
                    let decoder = JSONDecoder()
                    
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(PostData.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
                
            }
            task.resume()
        }
    }
}

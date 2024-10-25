//
//  NetworkManagerNews.swift
//
//  Created by Beymamat Rakhmatov on 20/09/24.
//

import Foundation
import UIKit

class NetworkManagerNews {
    let endpoint: String = "https://newsapi.org/v2/everything"
    
    func getNews(completion: @escaping (Result<NewsModel, any Error>) -> Void) {
        var urlComponents = URLComponents(string: endpoint)!
        
        urlComponents.queryItems = [
            URLQueryItem(name: "q", value: "bitcoin"),
            URLQueryItem(name: "apiKey", value: "3f8d6d443b2f447faa829aa793523570"),
            URLQueryItem(name: "language", value: "ru")
        ]
        
        guard let url = urlComponents.url else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0)))
            return
        }
        
        let request = URLRequest(url: url)
        let _: Void = URLSession.shared.dataTask(with: request) { data, response, error in

            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let data = data, let newsData = try? JSONDecoder().decode(NewsModel.self, from: data) {
                completion(.success(newsData))
            }
            
        }.resume()
        
    }
    
    func fetchIcon(iconUrl: String, completion: @escaping (UIImage)->(Void)) {
        guard let url = URL(string: iconUrl) else {return}
        let requst = URLRequest(url: url)
        URLSession.shared.dataTask(with: requst) {data, response, error in
            if let imageData = data, let icon = UIImage(data: imageData) {
                completion(icon)
            } else {
                return
            }
        }.resume()
    }
}

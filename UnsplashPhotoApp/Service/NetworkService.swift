//
//  NetworkService.swift
//  UnsplashPhotoApp
//
//  Created by Jafar on 02.02.2022.
//

import Foundation

class NetworkService {
 
    func request(searhTerm: String, completion: (Data?, Error?) -> Void) {
        
        let parameters = self.prepareParaments(searchTerm: searhTerm)
        let url = self.url(params: parameters)
        print(url)
    }
    
    private func prepareParaments(searchTerm: String?) -> [String: String]{
        var parameters = [String: String]()
        parameters["query"] = searchTerm
        parameters["page"] = String(1)
        parameters["per_page"] = String(30)
        
        return parameters
    }
    
    
    private func url(params: [String: String]) -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.unsplash.com"
        components.path = "/search/photos"
        components.queryItems = params.map { URLQueryItem(name: $0, value: $1)}
        
        return components.url!
        
    }
    
}
 

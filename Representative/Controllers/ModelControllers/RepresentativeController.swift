//
//  RepresentativeController.swift
//  Representative
//
//  Created by XMS_JZhan on 2/7/19.
//  Copyright © 2019 DevMtnStudent. All rights reserved.
//

import Foundation

class RepresentativeController {
    
    static let baseURL = URL(string: "https://whoismyrepresentative.com")
    
    static func searchRepresentatives(forState state: String, completion: @escaping (([Representative]) -> Void)) {
        guard var url = baseURL else { completion([]); return }
        url.appendPathComponent("getall_reps_bystate.php")
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        let searchTermQueryItem = URLQueryItem(name: "state", value: state)
        let jsonOutputQueryItem = URLQueryItem(name: "output", value: "json")
        components?.queryItems = [searchTermQueryItem, jsonOutputQueryItem]
        
        guard let componentsURL = components?.url else { completion([]); return }
        print(componentsURL)
        //let request = URLRequest(url: componentsURL)
        
        let dataTask = URLSession.shared.dataTask(with: componentsURL) { (data, _, error) in
            if let error = error {
                print("Error \(error.localizedDescription)")
                completion([])
                return
            }
            
            guard let data = data else {
                print("Errro getting data")
                completion([])
                return
            }
            
            let decodedData = String(data: data, encoding: .ascii)
            let encodedData = decodedData?.data(using: .utf8)
            guard let correctlyEncodedData = encodedData else {
                print("Errro encoding data")
                completion([])
                return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                let topLevel = try jsonDecoder.decode([String: [Representative]].self, from: correctlyEncodedData)
                completion(topLevel["results"] ?? [])
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
                completion([])
            }
        }
        dataTask.resume()
    }
    
    
    
}

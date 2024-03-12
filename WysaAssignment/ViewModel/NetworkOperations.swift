//
//  NetworkOperations.swift
//  WysaAssignment
//
//  Created by Palak on 11/03/24.
//

import Foundation

class NetworkOperations : ObservableObject {
    
    static public var shared : NetworkOperations = NetworkOperations()
    
    private init() {}
    
    func fetchAPI(completion : @escaping(APIModel) -> Void ) {
        guard let url = URL(string: "https://opentdb.com/api.php?amount=10&amp;category=18&amp;difficulty=easy&amp;type=multiple") else { return }
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _ ,error) in
            if let error = error { print("No data \(error.localizedDescription)")}
            
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            
            do {
                let decodedData = try decoder.decode(APIModel.self, from: data)
                completion(decodedData)
            } catch {
                print("error \(error.localizedDescription)")
            }
            
        }
        dataTask.resume()
    }
}

//
//  ApiServers.swift
//  Mallikharjun
//
//  Created by Apple on 20/01/24.
//

import Foundation


class ApiServers {

    static let shared = ApiServers()
    
   private init() {
        
    }
    // Get Method //
    
    func getFetchDate(apiString:String,complition:@escaping(Result<[UserInfo],Error>)->Void) {
        
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            fatalError("Invalid Error")
        }
        let task =  URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                complition(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,httpResponse.statusCode == 200 else {
                complition(.failure(NSError(domain: "Invalid Response ", code: 0,userInfo: nil)))
             return
            }
            
            guard let data =  data else{
                complition(.failure(NSError(domain: "No Data received", code: 0,userInfo: nil)))
                return
            }
            
            do{
                let posts = try JSONDecoder().decode([UserInfo].self,from: data)
                complition(.success(posts))
                
                
                
            }catch{
                complition(.failure(error))
            }
        
        }
        task.resume()
    }
    
}

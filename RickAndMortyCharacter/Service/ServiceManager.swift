//
//  ServiceManager.swift
//  RickAndMortyCharacter
//
//  Created by Sabrina on 19/05/23.
//
import UIKit
import Foundation
import Alamofire
import AlamofireImage

class ServiceManager: NSObject {
    
    typealias completion <T> = (_ result: T, _ failure: Error?) -> Void
    
    func fetchCharacters(url: String, completion: @escaping completion<Recipes?>) {
        
        AF.request(url, method: .get).validate(statusCode: 200...299).responseDecodable(of: Recipes.self){ response in
            print(#function)
            debugPrint(response)
            
            switch response.result {
            case .success(let success):
                print("SUCESSO ->\(#function)")
                completion(success, nil)
            case .failure(let error):
                print("ERROR -> \(#function)")
                completion(nil, error)
                
            }
        }
        
    }
    
    func fetchImage(url: String, completion: @escaping (UIImage?) -> Void) {
        AF.request(url).responseImage { response in
            switch response.result {
            case .success(let image):
                completion(image)
            case .failure(let error):
                print(error)
                
            }
        }
    }
    
}

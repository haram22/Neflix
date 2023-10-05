//
//  APICaller.swift
//  Neflix
//
//  Created by 김하람 on 2023/10/05.
//

import UIKit

struct Constants {
    static let API_KEY = "eea7311a015644f23e44424d36044e5b"
    static let baseURL = "https://api.themoviedb.org"
}

class APICaller {
    static let shared = APICaller()
    
    // 외부에서 전달된 completion 클로저를 저장하고 비동기 작업이 완료되면 해당 클로저를 호출해 결과를 반환한다.
    func getTrendingMovies(completion: @escaping (String)-> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/all/day?api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {return}
            do{
                let result = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                print(result)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}

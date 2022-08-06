//
//  PostViewModel.swift
//  NewsApp
//
//  Created by саргашкаева on 21.07.2022.
//

import Foundation
import UIKit

protocol PostViewModelProtocol {
    var callBack: (()->())? { get set }
    var articlesModel: Articles {get set}
    func getData()
}

class PostViewModel: PostViewModelProtocol {
    var callBack: (() -> ())?
    var articlesModel = Articles()
    private var networkManager = NetworkManager()
    
    func getData() {
        guard let postURL =  URL(string: "https://newsapi.org/v2/everything?q=bitcoin&apiKey=39dc9dc6a2204f258237b8506623850e") else {
            print("Invalid URL")
            return}
        let postRequest = URLRequest(url: postURL)
        networkManager.decodeDataP(ofType: Articles.self, urlRequest: postRequest) { [weak self] data in
            self?.articlesModel = data
            self?.callBack?()
        }
    }
}
    
   
    
    




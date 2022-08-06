//
//  CommentsViewModel.swift
//  NewsApp
//
//  Created by саргашкаева on 22.07.2022.
//

import Foundation

protocol CommentsViewModelProtocol {
    var commentModel: [Comments?] {get}
    var postId: String {get set}
    var callBack: (()->())? {get set}
    func getData()
}

class CommentsViewModel: CommentsViewModelProtocol {
    var callBack: (() -> ())?
    private(set) var commentModel: [Comments?] = []
    var postId = "1"
    private var networkManager = NetworkManager()
    
    func getData () {
        guard let commentsURL =  URL(string: "https://jsonplaceholder.typicode.com/posts/\(postId)/comments")
                
        else {
            print("Invalid URL")
            return
        }
        let commentsRequest = URLRequest(url: commentsURL)
        networkManager.decodeData(ofType: Comments.self, urlRequest: commentsRequest) { [weak self] data in
            self?.commentModel = data
            self?.callBack?()
        }
        
    }
}


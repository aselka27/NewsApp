//
//  UserViewModel.swift
//  NewsApp
//
//  Created by саргашкаева on 24.07.2022.
//

import Foundation

protocol UserViewModelProtocol {
    var userModel: [User?] { get }
    func getData()
    var callBack: (()->())? { get set }
}

class UserViewModel: UserViewModelProtocol {
    private(set) var userModel: [User?] = []
    private var networkManager = NetworkManager()
    var callBack: (()->())?
    
    func getData() {
        guard let userInfoURL =  URL(string: "https://jsonplaceholder.typicode.com/users") else {
            print("Invalid URL")
            return}
        let userInfoRequest = URLRequest(url: userInfoURL)
        networkManager.decodeData(ofType: User.self, urlRequest: userInfoRequest) { [weak self] data in
            self?.userModel = data
            self?.callBack?()
        }
    }
}

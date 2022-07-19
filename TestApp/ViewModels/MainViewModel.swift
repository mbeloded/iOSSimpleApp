//
//  MainViewModel.swift
//  TestApp
//
//  Created by Michael Beloded on 14.07.2022.
//

import Foundation
import Alamofire
import SimpleTwoWayBinding

class MainViewModel {
    
    private(set) var mainItems: Observable<[MainItem]> = Observable()
    private(set) var topItems: Observable<[TopCell]> = Observable()
    private(set) var feedItems: Observable<[MainCell]> = Observable()
    
    private(set) var error: Observable<[Error]> = Observable()
    
    private var baseUrl = ""
    
    init(url: String) {
        baseUrl = url
        fetchTopItems(from: baseUrl)
    }
    
    func feedItem(at indexPath: IndexPath) -> MainViewCell {
        let cell = MainViewCell()
        cell.data = feedItems.value?[indexPath.row]
        return cell
    }
    
    // for the main feed, UITableView delegate
    func numberOfItems(_ inSection: Int) -> Int {
        return feedItems.value?.count ?? 0
    }
    
    private func fetchTopItems(from urlString: String) {
        
        AF.request(urlString).responseData { [weak self] response in
            guard let self = self else { return }
            switch response.result {
            case .success(_):
                
                let mainResponse = try? JSONDecoder().decode(MainItems.self, from: response.data!)
                
                self.mainItems.value = mainResponse?.results
                self.topItems.value = mainResponse?.results.map({ item in
                    TopCell(name: item.name.title, picture: item.picture, status: true)})
                
                self.feedItems.value = mainResponse?.results.map({ item in
                    MainCell(name: item.name, picture: item.picture, location: item.location)})
                
            case .failure(let error):
                self.error.value = [error]
            }
        }
    }
    
}

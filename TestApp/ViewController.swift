//
//  ViewController.swift
//  TestApp
//
//  Created by Michael Beloded on 14.07.2022.
//

import UIKit
import SimpleTwoWayBinding
import Alamofire

class ViewController: UIViewController {

    struct Constants {
        let url = "https://randomuser.me/api/?results=10"
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: MainViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupUI()
        
        viewModel = MainViewModel(url: Constants().url)
        setupBindings()
        
    }
    
    func setupUI() {
        
        tableView.registerCell(MainViewCell.self)
        tableView.registerHeaderFooterView(HeaderView.self)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = MainViewCell.Constants().height
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorColor = .clear
        tableView.separatorStyle = .none
    }
    
    func setupBindings() {
        self.observe(for: viewModel.topItems) { _ in
           //TODO:
        }
        
        self.observe(for: viewModel.mainItems) { [weak self] (feedItems) in
            guard let self = self else {
                return
            }
            
            self.tableView.reloadData()
        }
    }

}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return MainViewCell.Constants().height
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return HeaderView.Constants().viewHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = tableView.dequeueReusableHeaderView(with: HeaderView.self)
        
        headerView.data = viewModel.topItems.value
        
        return headerView
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(with: MainViewCell.self, for: indexPath)
        
        cell.data = viewModel.feedItems.value?[indexPath.row]
        
        return cell
    }
    
}


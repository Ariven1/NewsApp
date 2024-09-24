//
//  NewsListViewController.swift
//  NewsApp
//
//  Created by Ariven on 12/09/24.
//

import UIKit

class NewsListViewController: UIViewController {
    let categoryButton = UIButton()
    let barButtonItem = UIBarButtonItem()
    var news: [Article] = []
    private var newsViewModel = NewsListViewModel()
    let manager: BookmarkManager = BookmarkManager()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewSetup()
        setup()
        barButtonItemSetup()
        menuItemSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func tableViewSetup() {
        tableView.register(UINib(nibName: TableViewCellName.newsTableViewCell, bundle: nil), forCellReuseIdentifier: TableViewCellIdentifier.newsCell)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
    }
    
    func setup() {
        newsViewModel.delegate = self
        newsViewModel.getNews(category: Categories.business.rawValue)
    }
    
    func barButtonItemSetup() {
        categoryButton.frame = CGRectMake(0, 0, 95, 30)
        categoryButton.layer.shadowRadius = 5
        categoryButton.layer.shadowOpacity = 0.8
        categoryButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        categoryButton.backgroundColor = UIColor.orange
        categoryButton.layer.cornerRadius = 10
        categoryButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        barButtonItem.customView = categoryButton
        navigationItem.setRightBarButton(barButtonItem, animated: true)
    }
    
    func categorySelection(action: UIAction) {
        newsViewModel.getNews(category: action.title)
    }
    
    func menuItemSetup() {
        var menuChildren: [UIMenuElement] = []
        for category in Categories.allCases {
            menuChildren.append(UIAction(title: category.rawValue, handler: { [weak self] action in
                self?.categorySelection(action: action)
            }))
        }
        categoryButton.menu = UIMenu(title: StringConstant.category, image: nil, identifier: nil, options: [], children: menuChildren)
        categoryButton.showsMenuAsPrimaryAction = true
        categoryButton.changesSelectionAsPrimaryAction = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let newsDetail = segue.destination as? NewsDetailViewController {
            if let selectedIndex = tableView.indexPathForSelectedRow?.row {
                newsDetail.article = news[selectedIndex]
            }
        }
    }
}

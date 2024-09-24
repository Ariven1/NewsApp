//
//  NewsDetailViewController.swift
//  NewsApp
//
//  Created by Ariven on 14/09/24.
//

import UIKit

class NewsDetailViewController: UIViewController {
    var article: Article?
    let bookmarkButton = UIButton()
    let barButtonItem = UIBarButtonItem()
    private let manager: BookmarkManager = BookmarkManager()
    @IBOutlet weak var imageView: LazyImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        if let urlString = article?.urlToImage, let url = URL(string: urlString) {
            imageView.loadImage(fromURL: url, placeHolderImage: ImageName.placeholderImage)
        }
        titleLabel.text = article?.title
        descriptionLabel.text = article?.description
        title = article?.source?.name
        addBookmarkButton()
    }
    
    func addBookmarkButton() {
        if let url = article?.url, let publishedAt = article?.publishedAt, manager.isBookmarked(bookmarkId: url + publishedAt) {
            bookmarkButton.setBackgroundImage(UIImage(systemName: ImageName.bookmarkFill), for: .normal)
        } else {
            bookmarkButton.setBackgroundImage(UIImage(systemName: ImageName.bookmark), for: .normal)
        }
        bookmarkButton.frame = CGRectMake(0, 0, 30, 30)
        bookmarkButton.addTarget(self, action: #selector(self.bookmarkAction), for: .touchUpInside)
        barButtonItem.customView = bookmarkButton
        navigationItem.setRightBarButton(barButtonItem, animated: true)
    }
    
    @objc func bookmarkAction() {
        if let url = article?.url, let publishedAt = article?.publishedAt, manager.isBookmarked(bookmarkId: url + publishedAt) {
            bookmarkButton.setBackgroundImage(UIImage(systemName: ImageName.bookmark), for: .normal)
            _ = manager.delete(bookmarkId: url + publishedAt)
        } else {
            bookmarkButton.setBackgroundImage(UIImage(systemName: ImageName.bookmarkFill), for: .normal)
            if let url = article?.url, let publishedAt = article?.publishedAt {
                manager.add(bookmarkId: url + publishedAt)
            }
        }
    }
}

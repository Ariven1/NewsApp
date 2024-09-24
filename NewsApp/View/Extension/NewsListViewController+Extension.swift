//
//  NewsListViewController+Extension.swift
//  NewsApp
//
//  Created by Ariven on 16/09/24.
//

import UIKit

extension NewsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.newsCell, for: indexPath) as? NewsTableViewCell {
            cell.titleLabel.text = news[indexPath.row].title
            cell.descriptionLabel.text = news[indexPath.row].description
            if let urlString = news[indexPath.row].urlToImage, let url = URL(string: urlString) {
                cell.newsImage.loadImage(fromURL: url, placeHolderImage: ImageName.placeholderImage)
            } else {
                cell.newsImage.image = UIImage(named: ImageName.placeholderImage)
            }
            if let url = news[indexPath.row].url, let publishedAt = news[indexPath.row].publishedAt, manager.isBookmarked(bookmarkId: url + publishedAt) {
                cell.bookMarkImage.image = UIImage(systemName: ImageName.bookmarkFill)
            } else {
                cell.bookMarkImage.image = UIImage(systemName: ImageName.bookmark)
            }
            return cell
        }
        return UITableViewCell()
    }
}

extension NewsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: SegueName.newsDetail, sender: nil)
    }
}

extension NewsListViewController: NewsListViewModelDelegate {
    func news(response: NewsResponse?) {
        DispatchQueue.main.async {
            if response == nil {
                self.presentAlert(withTitle: StringConstant.error, message: StringConstant.somethingWentWrong)
            } else {
                if let articles = response?.articles {
                    self.news = articles
                    self.tableView.setContentOffset(.zero, animated: false)
                    self.tableView.reloadData()
                    if articles.count == 0 {
                        self.presentAlert(withTitle: StringConstant.alert, message: StringConstant.noDataFound)
                    }
                }
            }
        }
    }
}

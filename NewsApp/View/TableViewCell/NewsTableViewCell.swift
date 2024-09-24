//
//  NewsTableViewCell.swift
//  NewsApp
//
//  Created by Ariven on 12/09/24.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    @IBOutlet weak var newsImage: LazyImageView!
    @IBOutlet weak var bookMarkImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        newsImage.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

//
//  NewsTableViewCell.swift
//
//  Created by Beymamat Rakhmatov on 21/09/24.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    static let identifier: String = "NewsTableViewCell"

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setViews()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    private func setViews() {
        bgView.setShadow()
        bgView.layer.cornerRadius = 10
        
        newsImageView.layer.cornerRadius = 10
        newsImageView.contentMode = .scaleAspectFill
        
        newsLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        newsLabel.adjustsFontSizeToFitWidth = true
    }
    
}

extension UIView {
    func setShadow(){
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 7.0
        layer.shadowOpacity = 0.6
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.masksToBounds = false
    }
}

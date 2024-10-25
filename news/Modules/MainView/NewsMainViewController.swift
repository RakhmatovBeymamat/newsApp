//
//  MainViewController.swift
//
//  Created by Beymamat Rakhmatov on 31/08/24.
//

import UIKit

class NewsMainViewController: UIViewController {
    
    weak var newsMainViewControllerCoordinator: NewsMainViewControllerCoordinator?
    
    private var newsManager: NetworkManagerNews = NetworkManagerNews()
    
    private var newsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: NewsTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    var news: NewsModel = NewsModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "News"
        
        newsTableView.dataSource = self
        newsTableView.delegate = self
        newsTableView.separatorStyle = .none
        
        setView()
        getAllNews()
        
        
    }
    
    private func getAllNews() {
        newsManager.getNews(completion: {[weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let news):
                    self.news = news
                    self.newsTableView.reloadData()
                case .failure(_): break
                }
            }
        })
    }
    
    private func setView() {
        view.addSubview(newsTableView)
        
        newsTableView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
    }
}

extension NewsMainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = news.articles else {return 1}
        return count.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier, for: indexPath) as? NewsTableViewCell else {return UITableViewCell()}
        let newsItem = news.articles?[indexPath.row]
        cell.newsLabel.text = newsItem?.title
        
        if let imageUrl = newsItem?.urlToImage {
            newsManager.fetchIcon(iconUrl: imageUrl) { image in
                DispatchQueue.main.async {
                    cell.newsImageView.image = image
                }
            }
        } else {
            cell.newsImageView.image = UIImage(systemName: "lock.fill")
            cell.newsImageView.contentMode = .scaleAspectFit
        }
        
        return cell
    }
    
}

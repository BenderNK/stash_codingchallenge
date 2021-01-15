//
//  AchievementsView.swift
//  coach
//
//  Created by Turker Nessa on 1/13/21.
//

import UIKit
import RxSwift

class AchievementsView: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!

    var achievementsPresenter: AchievementsPresenterProtocol?
    
    private let disposeBag = DisposeBag()
    private var achievements = [AchievementModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureAchievementsTable() //configure table
        configureRxBindings() //setup Rx piping
        configureNavbar() //navigation bar configuration
        
        achievementsPresenter?.viewDidLoad()
    }
    
    private func configureRxBindings() {
        //controls to show or hide loading indicator
        achievementsPresenter?.shouldShowLoadingIndicator
        .observe(on: MainScheduler.asyncInstance)
        .subscribe(onNext: { [weak self] shouldShow in
            self?.tableView.isHidden = shouldShow
            self?.activityIndicator.isHidden = !shouldShow
        }).disposed(by: disposeBag)
        
        //displays error messages when necessary
        achievementsPresenter?.displayError
        .observe(on: MainScheduler.asyncInstance)
        .subscribe(onNext: { [weak self] errorInfo in
            let alertController = UIAlertController(title: errorInfo.title,
                                      message: errorInfo.message,
                                      preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: errorInfo.acknowledgementButtonText,
                                                    style: .default,
                                                    handler: nil))
            self?.present(alertController, animated: true, completion: nil)
        }).disposed(by: disposeBag)
        
        achievementsPresenter?.displayAchievements
        .observe(on: MainScheduler.asyncInstance)
        .subscribe(onNext: { [weak self] achievements in
            self?.achievements = achievements
            self?.tableView.isHidden = false //make sure tableview is not hiddent
            self?.tableView.reloadData()
        }).disposed(by: disposeBag)
    }
    
    private func configureAchievementsTable() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView() //so that you don't see empty cells
        tableView.separatorStyle = .none //removes the cell separators
        tableView.register(AchievementCell.nib, forCellReuseIdentifier: AchievementCell.nibName) //register the cell with its nib
        tableView.estimatedRowHeight = 192 //make the cells auto height
        tableView.rowHeight = UITableView.automaticDimension //make the cells auto height
        tableView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 48, right: 0) //there appears to be some content insets
    }
    
    private func configureNavbar() {
        let titleLabel = UILabel()
        titleLabel.text = "smart_investing_title".localized()
        titleLabel.textColor = .white
        navigationItem.titleView = titleLabel
        
        let infoImage = UIImage(systemName: "info.circle")
        let barButton = UIBarButtonItem(image: infoImage, style: .plain, target: self, action: #selector(didTapInfoCircle(_:)))
        barButton.tintColor = .white
        navigationItem.rightBarButtonItem = barButton
        
        navigationController?.navigationBar.barTintColor = UIColor(red: 105.0/255.0, green: 55.0/255.0, blue: 206.0/255.0, alpha: 1.0)
    }
    
    @objc private func didTapInfoCircle(_ sender: Any) {
        print("user just tapped on the info circle - gotta do something about it")
    }
}

extension AchievementsView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return achievements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AchievementCell.nibName, for: indexPath) as! AchievementCell
        let achievement = achievements[indexPath.row]
        cell.configure(with: achievement)
        
        return cell
    }
}

extension AchievementsView: UITableViewDelegate {
    //only let the accessible achievements be interactable
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        let achievement = achievements[indexPath.row]
        return achievement.accessible
    }
}


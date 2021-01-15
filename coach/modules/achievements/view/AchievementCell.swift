//
//  AchievementCell.swift
//  coach
//
//  Created by Turker Nessa on 1/13/21.
//

import UIKit
import SDWebImage

class AchievementCell: UITableViewCell, NibLoadable {

    @IBOutlet private weak var cardBackground: UIView!
    @IBOutlet private weak var cellBackgroundImage: UIImageView!
    @IBOutlet private weak var levelInfoContainer: UIView!
    @IBOutlet private weak var levelTitle: UILabel!
    @IBOutlet private weak var currentLevel: UILabel!
    @IBOutlet private weak var currentProgress: UIProgressView!
    @IBOutlet private weak var currentPoints: UILabel!
    @IBOutlet private weak var nextLevelPoints: UILabel!
    private var disabledContentView: UIView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        cardBackground.roundCorners(cornerRadius: 8)
        levelInfoContainer.roundCorners(cornerRadius: 40)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        cellBackgroundImage.image = nil
        levelTitle.text = nil
        currentLevel.text = nil
        currentProgress.progress = 0.0
        currentPoints.text = nil
        nextLevelPoints.text = nil
        disabledContentView?.removeFromSuperview()
    }

    func configure(with achievement: AchievementModel) {
        cellBackgroundImage?.sd_setImage(with: achievement.backgroundImageUrl, completed: nil)
        levelTitle.text = "level_title".localized()
        currentLevel.text = achievement.level
        currentProgress.progress = Float(achievement.progress) / Float(achievement.total)
        currentPoints.text = "progress_with_points".localized(parameters: achievement.progress)
        nextLevelPoints.text = "progress_with_points".localized(parameters: achievement.total)
        
        if !achievement.accessible {
            let disabledEffect = UIView()
            disabledEffect.translatesAutoresizingMaskIntoConstraints = false
            disabledEffect.backgroundColor = UIColor(white: 1.0, alpha: 0.5) //makes it look like it is disabled
            cardBackground.addSubview(disabledEffect)
            NSLayoutConstraint.activate([
                disabledEffect.topAnchor.constraint(equalTo: cardBackground.topAnchor),
                disabledEffect.rightAnchor.constraint(equalTo: cardBackground.rightAnchor),
                disabledEffect.bottomAnchor.constraint(equalTo: cardBackground.bottomAnchor),
                disabledEffect.leftAnchor.constraint(equalTo: cardBackground.leftAnchor)
            ])
            disabledContentView = disabledEffect
        }
    }
}

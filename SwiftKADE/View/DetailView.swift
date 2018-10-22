//
//  DetailView.swift
//  SwiftKADE2
//
//  Created by Aji Saputra Raka Siwi on 21/10/18.
//  Copyright © 2018 Aji Saputra Raka Siwi. All rights reserved.
//

import UIKit
import Kingfisher

class DetailView: UIView {
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var homeImageView: UIImageView!
    
    @IBOutlet weak var homeTeamLabel: UILabel!
    @IBOutlet weak var homeScoreLabel: UILabel!
    @IBOutlet weak var awayScoreLabel: UILabel!
    @IBOutlet weak var awayTeamLabel: UILabel!
    
    @IBOutlet weak var awayImageView: UIImageView!
    
    @IBOutlet weak var homeGoalScorerLabel: UILabel!
    @IBOutlet weak var awayGoalScorerLabel: UILabel!
    
    @IBOutlet weak var homeGoalKeeperLabel: UILabel!
    @IBOutlet weak var awayGoalKeeperLabel: UILabel!
    
    @IBOutlet weak var homeDefenseLabel: UILabel!
    @IBOutlet weak var awayDefenseLabel: UILabel!
    
    @IBOutlet weak var homeMidFielderLabel: UILabel!
    @IBOutlet weak var awayMidFielderLabel: UILabel!
    
    @IBOutlet weak var homeForwardLabel: UILabel!
    @IBOutlet weak var awayForwardLabel: UILabel!
    
    @IBOutlet weak var homeSubstitutesLabel: UILabel!
    @IBOutlet weak var awaySubstitutesLabel: UILabel!
    
    @IBOutlet weak var homeBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var awayBottomConstraint: NSLayoutConstraint!
    
    func configure(event: Event){
        self.dateLabel.text = event.dateEvent
        self.homeTeamLabel.text = event.strHomeTeam
        self.homeScoreLabel.text = event.intHomeScore
        self.awayScoreLabel.text = event.intAwayScore
        self.awayTeamLabel.text = event.strAwayTeam
        
        self.homeGoalScorerLabel.text = event.strHomeGoalDetails.replacingOccurrences(of: ";", with: "\n", options: .literal, range: nil)
        self.awayGoalScorerLabel.text = event.strAwayGoalDetails.replacingOccurrences(of: ";", with: "\n", options: .literal, range: nil)
        
        self.homeGoalKeeperLabel.text = event.strHomeLineupGoalkeeper.replacingOccurrences(of: "; ", with: "\n", options: .literal, range: nil)
        self.awayGoalKeeperLabel.text = event.strAwayLineupGoalkeeper.replacingOccurrences(of: "; ", with: "\n", options: .literal, range: nil)
        
        self.homeDefenseLabel.text = event.strHomeLineupDefense.replacingOccurrences(of: "; ", with: "\n", options: .literal, range: nil)
        self.awayDefenseLabel.text = event.strAwayLineupDefense.replacingOccurrences(of: "; ", with: "\n", options: .literal, range: nil)
        
        self.homeMidFielderLabel.text = event.strHomeLineupMidfield.replacingOccurrences(of: "; ", with: "\n", options: .literal, range: nil)
        self.awayMidFielderLabel.text = event.strAwayLineupMidfield.replacingOccurrences(of: "; ", with: "\n", options: .literal, range: nil)
        
        self.homeForwardLabel.text = event.strHomeLineupForward.replacingOccurrences(of: "; ", with: "\n", options: .literal, range: nil)
        self.awayForwardLabel.text = event.strAwayLineupForward.replacingOccurrences(of: "; ", with: "\n", options: .literal, range: nil)
        
        self.homeSubstitutesLabel.text = event.strHomeLineupSubstitutes.replacingOccurrences(of: "; ", with: "\n", options: .literal, range: nil)
        self.awaySubstitutesLabel.text = event.strAwayLineupSubstitutes.replacingOccurrences(of: "; ", with: "\n", options: .literal, range: nil)
    }
    
    func configureHomeBadge(url: String){
        self.homeImageView.kf.setImage(with: URL(string: url))
    }
    
    func configureAwayBadge(url: String){
        self.awayImageView.kf.setImage(with: URL(string: url))
    }
}

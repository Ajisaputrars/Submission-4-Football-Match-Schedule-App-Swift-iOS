//
//  EventCell.swift
//  SwiftKADE2
//
//  Created by Aji Saputra Raka Siwi on 20/10/18.
//  Copyright © 2018 Aji Saputra Raka Siwi. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {
    @IBOutlet weak var dateEventLabel: UILabel!
    @IBOutlet weak var homeTeamLabel: UILabel!
    @IBOutlet weak var awayTeamLabel: UILabel!
    @IBOutlet weak var homeTeamScoreLabel: UILabel!
    @IBOutlet weak var awayTeamScore: UILabel!
    @IBOutlet weak var viewContentView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(event: Event){
        dateEventLabel.text = event.dateEvent
        homeTeamLabel.text = event.strHomeTeam
        awayTeamLabel.text = event.strAwayTeam
        homeTeamScoreLabel.text = event.intHomeScore
        awayTeamScore.text = event.intAwayScore
    }
}

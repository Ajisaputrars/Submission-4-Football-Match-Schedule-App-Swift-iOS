//
//  DetailController.swift
//  SwiftKADE2
//
//  Created by Aji Saputra Raka Siwi on 21/10/18.
//  Copyright © 2018 Aji Saputra Raka Siwi. All rights reserved.
//

import UIKit

class DetailController: UIViewController {
    
    var event: Event!
    private var homeTeamLookupUrl: String!
    private var awayTeamLookupUrl: String!
    
    private var teamBadgePresenter = TeamPresenter()
    
    private var detailView: DetailView! {
        guard isViewLoaded else { return nil }
        return view as! DetailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        detailView.configure(event: event)
        setGoalLabelConstraint()
        self.title = "Detail Match"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        setTeamLookupUrl()
        
        teamBadgePresenter.getTeams(url: homeTeamLookupUrl!, view: self, service: TeamService(), isHome: true)
        teamBadgePresenter.getTeams(url: awayTeamLookupUrl!, view: self, service: TeamService(), isHome: false)
    }
    
    func setGoalLabelConstraint(){
        if detailView.homeGoalScorerLabel.bounds.size.height > detailView.awayGoalScorerLabel.bounds.size.height {
            detailView.homeBottomConstraint.constant = 0
        } else if detailView.homeGoalScorerLabel.bounds.size.height < detailView.awayGoalScorerLabel.bounds.size.height {
            detailView.awayBottomConstraint.constant = 0
        } else {
            detailView.homeBottomConstraint.constant = 0
        }
    }
    
    func setTeamLookupUrl(){
        homeTeamLookupUrl = TEAM_LOOKUP_URL + event.idHomeTeam
        awayTeamLookupUrl = TEAM_LOOKUP_URL + event.idAwayTeam
        
        print("HOME URL = \(homeTeamLookupUrl!)")
        print("AWAY URL = \(awayTeamLookupUrl!)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension DetailController: TeamBadgeView {
    func setHomeBadge(teams: [Team]) {
//        print(teams.count)
        let teamBadgeUrl = teams[0].strTeamBadge
        detailView.configureHomeBadge(url: teamBadgeUrl)
    }
    
    func setAwayBadge(teams: [Team]) {
        let teamBadgeUrl = teams[0].strTeamBadge
        detailView.configureAwayBadge(url: teamBadgeUrl)
    }
}

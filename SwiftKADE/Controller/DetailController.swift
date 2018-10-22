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
    
    private var actionButton:UIBarButtonItem!
    private var button: UIButton!
    private var saveBarButton: UIBarButtonItem!
    
    private var isSaved:Bool = true
    
    private var detailView: DetailView! {
        guard isViewLoaded else { return nil }
        return view as! DetailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Detail Match"
        
        detailView.configure(event: event)
        setGoalLabelConstraint()
        
        inflateBarButton()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        homeTeamLookupUrl = TEAM_LOOKUP_URL + event.idHomeTeam
        awayTeamLookupUrl = TEAM_LOOKUP_URL + event.idAwayTeam
        
        teamBadgePresenter.getTeams(url: homeTeamLookupUrl!, view: self, service: TeamService(), isHome: true)
        teamBadgePresenter.getTeams(url: awayTeamLookupUrl!, view: self, service: TeamService(), isHome: false)
    }
    
    private func inflateBarButton(){
        actionButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: nil)
        
        button = UIButton(type: .custom)
        if isSaved {
            button.setImage(UIImage(named: "StarSaved"), for: .normal)
        } else {
            button.setImage(UIImage(named: "StarUnsaved"), for: .normal)
        }
        
        button.addTarget(self, action: #selector(saveBarButtonAction), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        
        saveBarButton = UIBarButtonItem(customView: button)
        let currWidth = saveBarButton.customView?.widthAnchor.constraint(equalToConstant: 24)
        currWidth?.isActive = true
        let currHeight = saveBarButton.customView?.heightAnchor.constraint(equalToConstant: 24)
        currHeight?.isActive = true
        
        self.navigationItem.setRightBarButtonItems([actionButton, saveBarButton], animated: true)
    }
    
    @objc private func saveBarButtonAction(){
        self.isSaved = !self.isSaved
        if self.isSaved {
            //Set Saving
            print("Saving")
        } else {
            //Set Deleting
            print("Deleting")
        }
        changeSaveBarButtonImage(isSaved: self.isSaved)
    }
    
    @objc private func changeSaveBarButtonImage(isSaved: Bool){
        self.navigationItem.rightBarButtonItems?.remove(at: 1)
        button = UIButton(type: .custom)
        
        if isSaved {
            button.setImage(UIImage(named: "StarSaved"), for: .normal)
        } else {
            button.setImage(UIImage(named: "StarUnsaved"), for: .normal)
        }
        button.addTarget(self, action: #selector(saveBarButtonAction), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        
        saveBarButton = UIBarButtonItem(customView: button)
        let currWidth = saveBarButton.customView?.widthAnchor.constraint(equalToConstant: 24)
        currWidth?.isActive = true
        let currHeight = saveBarButton.customView?.heightAnchor.constraint(equalToConstant: 24)
        currHeight?.isActive = true
        
        self.navigationItem.rightBarButtonItems?.insert(saveBarButton, at: 1)
    }
    
    private func setGoalLabelConstraint(){
        if detailView.homeGoalScorerLabel.bounds.size.height > detailView.awayGoalScorerLabel.bounds.size.height {
            detailView.homeBottomConstraint.constant = 0
        } else if detailView.homeGoalScorerLabel.bounds.size.height < detailView.awayGoalScorerLabel.bounds.size.height {
            detailView.awayBottomConstraint.constant = 0
        } else {
            detailView.homeBottomConstraint.constant = 0
        }
    }
}

extension DetailController: TeamBadgeView {
    func setHomeBadge(teams: [Team]) {
        let teamBadgeUrl = teams[0].strTeamBadge
        detailView.configureHomeBadge(url: teamBadgeUrl)
    }
    
    func setAwayBadge(teams: [Team]) {
        let teamBadgeUrl = teams[0].strTeamBadge
        detailView.configureAwayBadge(url: teamBadgeUrl)
    }
}

extension DetailController{
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

//
//  DetailController.swift
//  SwiftKADE2
//
//  Created by Aji Saputra Raka Siwi on 21/10/18.
//  Copyright © 2018 Aji Saputra Raka Siwi. All rights reserved.
//

import UIKit
import CoreData

class DetailController: UIViewController {
    
    var event: Event!
    private var homeTeamLookupUrl: String!
    private var awayTeamLookupUrl: String!
    
    var context: NSManagedObjectContext!
    var eventsObject = [Events]()
    
    private var teamBadgePresenter = TeamPresenter()
    
    private var actionButton:UIBarButtonItem!
    private var button: UIButton!
    private var saveBarButton: UIBarButtonItem!
    
    private var isSaved:Bool = false
    
    private var detailView: DetailView! {
        guard isViewLoaded else { return nil }
        return view as! DetailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Detail Match"
        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        detailView.configure(event: event)
        setGoalLabelConstraint()
        
        checkIsSavedStatusFromCoreData()
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
            saveToCoreData()
        } else {
            deleteFromCoreData()
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
    
    func saveToCoreData(){
        let event = Events(context: context)
        event.dateEvent = self.event.dateEvent
        event.idAwayTeam = self.event.idAwayTeam
        event.idHomeTeam = self.event.idHomeTeam
        event.idLeague = self.event.idLeague
        event.intAwayScore = self.event.intAwayScore
        event.intHomeScore = self.event.intHomeScore
        event.strAwayGoalDetails = self.event.strAwayGoalDetails
        event.strAwayLineupDefense = self.event.strAwayLineupDefense
        event.strAwayLineupForward = self.event.strAwayLineupForward
        event.strAwayLineupGoalkeeper = self.event.strAwayLineupGoalkeeper
        event.strAwayLineupMidfield = self.event.strAwayLineupMidfield
        event.strAwayLineupSubstitutes = self.event.strAwayLineupSubstitutes
        event.strAwayTeam = self.event.strAwayTeam
        event.strDate = self.event.strDate
        event.strEvent = self.event.strEvent
        event.strHomeGoalDetails = self.event.strHomeGoalDetails
        event.strHomeLineupDefense = self.event.strHomeLineupDefense
        event.strHomeLineupForward = self.event.strHomeLineupForward
        event.strHomeLineupGoalkeeper = self.event.strHomeLineupGoalkeeper
        event.strHomeLineupMidfield = self.event.strHomeLineupMidfield
        event.strHomeLineupSubstitutes = self.event.strHomeLineupSubstitutes
        event.strHomeTeam = self.event.strHomeTeam
        event.strLeague = self.event.strLeague
        event.strSport = self.event.strSport
        event.strTime = self.event.strTime
        event.idEvent = self.event.idEvent
        
        do {
            try context.save()
        } catch let err as NSError{
            print ("Error \(err) with detail \(err.localizedDescription)")
        }
    }
    
    func deleteFromCoreData(){
        let fetchRequest: NSFetchRequest<Events> = Events.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "idEvent==\(self.event.idEvent)")
        
        do {
            let objects = try context.fetch(fetchRequest)
            for object in objects {
                context.delete(object)
            }
            try context.save()
        } catch _ {
            print("Error deleting")
        }
    }
    
    func checkIsSavedStatusFromCoreData(){
        let fetchRequest:NSFetchRequest<Events> = Events.fetchRequest()
        
        do {
            eventsObject = try context.fetch(fetchRequest)
        }catch{
            print(error)
        }
        
        for event in eventsObject {
            print(event.strHomeTeam! + " VS " + event.strAwayTeam!)
            if event.idEvent == self.event.idEvent {
                self.isSaved = true
            }
        }
        print("")
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

//
//  MainController.swift
//  SwiftKADE2
//
//  Created by Aji Saputra Raka Siwi on 20/10/18.
//  Copyright © 2018 Aji Saputra Raka Siwi. All rights reserved.
//

import UIKit
import CoreData

class MainController: UIViewController {
    
    private var events = [Event]()
    private var eventPresenter = EventPresenter()
    
    var context: NSManagedObjectContext!
    var eventsObject = [Events]()
    
    private var mainView: MainView! {
        guard isViewLoaded else { return nil }
        return view as! MainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Football Match Schedule"
        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let nib = UINib(nibName: "EventCell", bundle: nil)
        mainView.eventTableView.register(nib, forCellReuseIdentifier: "eventCell")
        
        mainView.eventTableView.delegate = self
        mainView.eventTableView.dataSource = self
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)

        eventPresenter.getEvents(view: self, service: EventService(), url: LAST_EVENT_URL)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if mainView.segmentedControl.selectedSegmentIndex == 2 {
            fetchDataFromCoreData()
        }
    }
    
    @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex
        {
        case 0:
            eventPresenter.getEvents(view: self, service: EventService(), url: LAST_EVENT_URL)
        case 1:
            eventPresenter.getEvents(view: self, service: EventService(), url: NEXT_EVENT_URL)
        case 2:
            fetchDataFromCoreData()
        default:
            break
        }
    }
    
    func fetchDataFromCoreData(){
        self.events.removeAll()

        let fetchRequest:NSFetchRequest<Events> = Events.fetchRequest()
        do {
            eventsObject = try context.fetch(fetchRequest)
        } catch{
            print(error)
        }
        for event in eventsObject {
            let dateEvent = event.dateEvent!
            let idAwayTeam = event.idAwayTeam!
            let idHomeTeam = event.idHomeTeam!
            let idLeague = event.idLeague!
            let intAwayScore = event.intAwayScore!
            let intHomeScore = event.intHomeScore!
            let strAwayGoalDetails = event.strAwayGoalDetails!
            let strAwayLineupDefense = event.strAwayLineupDefense!
            let strAwayLineupForward = event.strAwayLineupForward!
            let strAwayLineupGoalkeeper = event.strAwayLineupGoalkeeper!
            
            let strAwayLineupMidfield = event.strAwayLineupMidfield!
            let strAwayLineupSubstitutes = event.strAwayLineupSubstitutes!
            let strAwayTeam = event.strAwayTeam!
            let strDate = event.strDate!
            let strEvent = event.strEvent!
            let strHomeGoalDetails = event.strHomeGoalDetails!
            let strHomeLineupDefense = event.strHomeLineupDefense!
            let strHomeLineupForward = event.strHomeLineupForward!
            let strHomeLineupGoalkeeper = event.strHomeLineupGoalkeeper!
            let strHomeLineupMidfield = event.strHomeLineupMidfield!
            
            let strHomeLineupSubstitutes = event.strHomeLineupSubstitutes!
            let strHomeTeam = event.strHomeTeam!
            let strLeague = event.strLeague!
            let strSport = event.strSport!
            let strTime = event.strTime!
            let idEvent = event.idEvent!
            
            let event = Event(strEvent: strEvent, strSport: strSport, idLeague: idLeague, strLeague: strLeague, strHomeTeam: strHomeTeam, strAwayTeam: strAwayTeam, intHomeScore: intHomeScore, intAwayScore: intAwayScore, strHomeGoalDetails: strHomeGoalDetails, strHomeLineupGoalkeeper: strHomeLineupGoalkeeper, strHomeLineupDefense: strHomeLineupDefense, strHomeLineupMidfield: strHomeLineupMidfield, strHomeLineupForward: strHomeLineupForward, strHomeLineupSubstitutes: strHomeLineupSubstitutes, strAwayGoalDetails: strAwayGoalDetails, strAwayLineupGoalkeeper: strAwayLineupGoalkeeper, strAwayLineupDefense: strAwayLineupDefense, strAwayLineupMidfield: strAwayLineupMidfield, strAwayLineupForward: strAwayLineupForward, strAwayLineupSubstitutes: strAwayLineupSubstitutes, dateEvent: dateEvent, strDate: strDate, strTime: strTime, idHomeTeam:idHomeTeam, idAwayTeam: idAwayTeam, idEvent: idEvent)
            events.append(event)
        }
        mainView.eventTableView.reloadData()
    }
}

extension MainController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell") as! EventCell
        cell.configure(event: events[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DetailController(nibName: "DetailView", bundle: nil)
        controller.event = self.events[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension MainController: EventView{
    func startLoading() {
        mainView.loadingIndicator.isHidden = false
        mainView.loadingIndicator.startAnimating()
        mainView.eventTableView.isHidden = true
        mainView.errorLabel.isHidden = true
    }
    
    func stopLoading() {
        mainView.loadingIndicator.stopAnimating()
        mainView.loadingIndicator.isHidden = true
    }
    
    func setEmptyEvents() {
        mainView.eventTableView.isHidden = true
        mainView.errorLabel.isHidden = false
    }
    
    func getEvents(events: [Event]) {
        self.events.removeAll()
        mainView.eventTableView.isHidden = false
        mainView.errorLabel.isHidden = true
        self.events = events
        mainView.eventTableView.reloadData()
    }
}

extension MainController{
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

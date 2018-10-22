//
//  MainController.swift
//  SwiftKADE2
//
//  Created by Aji Saputra Raka Siwi on 20/10/18.
//  Copyright © 2018 Aji Saputra Raka Siwi. All rights reserved.
//

import UIKit

class MainController: UIViewController {
    
    private var events = [Event]()
    private var eventPresenter = EventPresenter()
    
    private var mainView: MainView! {
        guard isViewLoaded else { return nil }
        return view as! MainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Football Match Schedule"
        
        let nib = UINib(nibName: "EventCell", bundle: nil)
        mainView.eventTableView.register(nib, forCellReuseIdentifier: "eventCell")
        
        mainView.eventTableView.delegate = self
        mainView.eventTableView.dataSource = self
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)

        eventPresenter.getEvents(view: self, service: EventService(), url: LAST_EVENT_URL)
    }
    
    @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex
        {
        case 0:
            eventPresenter.getEvents(view: self, service: EventService(), url: LAST_EVENT_URL)
        case 1:
            eventPresenter.getEvents(view: self, service: EventService(), url: NEXT_EVENT_URL)
        default:
            break
        }
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

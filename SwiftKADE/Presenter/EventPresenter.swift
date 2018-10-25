//
//  EventPresenter.swift
//  SwiftKADE2
//
//  Created by Aji Saputra Raka Siwi on 20/10/18.
//  Copyright © 2018 Aji Saputra Raka Siwi. All rights reserved.
//

import Foundation

class EventPresenter{
    func getEvents(view:EventProtocol, service: EventService, url: String){
        view.startLoading()
        service.getEvents(url: url) { (events) in
            view.stopLoading()
            if events.count <= 0 {
                view.setEmptyEvents()
            } else {
                view.getEvents(events: events)
            }
        }
    }
}

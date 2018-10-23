//
//  EventService.swift
//  SwiftKADE2
//
//  Created by Aji Saputra Raka Siwi on 20/10/18.
//  Copyright © 2018 Aji Saputra Raka Siwi. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class EventService{
    func getEvents(url: String, _ completion:@escaping ([Event]) -> Void){
        var events = [Event]()
        Alamofire.request(url).responseJSON { (respons) in
            if respons.result.isSuccess {
                let eventsJSON: JSON = JSON(respons.result.value)
                for item in eventsJSON["events"].arrayValue {
                    let strEvent = item["strEvent"].stringValue
                    let strSport = item["strSport"].stringValue
                    let idLeague = item["idLeague"].stringValue
                    let strLeague = item["strLeague"].stringValue
                    let strHomeTeam = item["strHomeTeam"].stringValue
                    
                    let strAwayTeam = item["strAwayTeam"].stringValue
                    let intHomeScore = item["intHomeScore"].stringValue
                    let intAwayScore = item["intAwayScore"].stringValue
                    let strHomeGoalDetails = item["strHomeGoalDetails"].stringValue
                    let strHomeLineupGoalkeeper = item["strHomeLineupGoalkeeper"].stringValue
                    
                    let strHomeLineupDefense = item["strHomeLineupDefense"].stringValue
                    let strHomeLineupMidfield = item["strHomeLineupMidfield"].stringValue
                    let strHomeLineupForward = item["strHomeLineupForward"].stringValue
                    let strHomeLineupSubstitutes = item["strHomeLineupSubstitutes"].stringValue
                    let strAwayGoalDetails = item["strAwayGoalDetails"].stringValue
                    
                    let strAwayLineupGoalkeeper = item["strAwayLineupGoalkeeper"].stringValue
                    let strAwayLineupDefense = item["strAwayLineupDefense"].stringValue
                    let strAwayLineupMidfield = item["strAwayLineupMidfield"].stringValue
                    let strAwayLineupForward = item["strAwayLineupForward"].stringValue
                    let strAwayLineupSubstitutes = item["strAwayLineupSubstitutes"].stringValue
                    
                    let dateEvent = item["dateEvent"].stringValue
                    let strDate = item["strDate"].stringValue
                    let strTime = item["strTime"].stringValue
                    let idHomeTeam = item["idHomeTeam"].stringValue
                    let idAwayTeam = item["idAwayTeam"].stringValue
                    let idEvent = item["idEvent"].stringValue
                    
                    let event = Event(strEvent: strEvent, strSport: strSport, idLeague: idLeague, strLeague: strLeague, strHomeTeam: strHomeTeam, strAwayTeam: strAwayTeam, intHomeScore: intHomeScore, intAwayScore: intAwayScore, strHomeGoalDetails: strHomeGoalDetails, strHomeLineupGoalkeeper: strHomeLineupGoalkeeper, strHomeLineupDefense: strHomeLineupDefense, strHomeLineupMidfield: strHomeLineupMidfield, strHomeLineupForward: strHomeLineupForward, strHomeLineupSubstitutes: strHomeLineupSubstitutes, strAwayGoalDetails: strAwayGoalDetails, strAwayLineupGoalkeeper: strAwayLineupGoalkeeper, strAwayLineupDefense: strAwayLineupDefense, strAwayLineupMidfield: strAwayLineupMidfield, strAwayLineupForward: strAwayLineupForward, strAwayLineupSubstitutes: strAwayLineupSubstitutes, dateEvent: dateEvent, strDate: strDate, strTime: strTime, idHomeTeam:idHomeTeam, idAwayTeam: idAwayTeam, idEvent: idEvent)
                    events.append(event)
                }
            } else if respons.result.isFailure {
                print("EventService class : Failed")
            }
            completion(events)
        }
    }
}

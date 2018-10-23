//
//  TeamService.swift
//  SwiftKADE2
//
//  Created by Aji Saputra Raka Siwi on 21/10/18.
//  Copyright © 2018 Aji Saputra Raka Siwi. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class TeamService{
    func getTeamBadge(url: String, _ completion:@escaping ([Team]) -> Void) {
        var teams = [Team]()
        Alamofire.request(url).responseJSON { (respons) in
            if respons.result.isSuccess {
                let teamJSON: JSON = JSON(respons.result.value)
                for i in teamJSON["teams"].arrayValue {
                    let strTeamBadge = i["strTeamBadge"].stringValue
                    let team = Team(strTeamBadge: strTeamBadge)
                    teams.append(team)
                }
            } else if respons.result.isFailure {
                print("TeamService class : Failed")
            }
            completion(teams)
        }
    }
}

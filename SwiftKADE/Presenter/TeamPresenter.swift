//
//  TeamPresenter.swift
//  SwiftKADE2
//
//  Created by Aji Saputra Raka Siwi on 21/10/18.
//  Copyright © 2018 Aji Saputra Raka Siwi. All rights reserved.
//

import Foundation

class TeamPresenter{
    func getTeams(url: String, view:TeamBadgeProtocol, service: TeamService, isHome: Bool){
        service.getTeamBadge(url: url) { (teams) in
            if isHome {
                view.setHomeBadge(teams: teams)
            } else {
                view.setAwayBadge(teams: teams)
            }
        }
    }
}

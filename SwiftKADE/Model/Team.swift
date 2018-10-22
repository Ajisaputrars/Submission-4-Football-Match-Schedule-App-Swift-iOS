//
//  Team.swift
//  SwiftKADE2
//
//  Created by Aji Saputra Raka Siwi on 21/10/18.
//  Copyright © 2018 Aji Saputra Raka Siwi. All rights reserved.
//

import Foundation

class Team {
    private var _strTeamBadge:String!
    
    public var strTeamBadge: String {
        return _strTeamBadge
    }
    
    init(strTeamBadge: String) {
        self._strTeamBadge = strTeamBadge
    }
}

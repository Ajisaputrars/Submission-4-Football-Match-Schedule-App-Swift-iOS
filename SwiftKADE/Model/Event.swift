//
//  Event.swift
//  SwiftKADE2
//
//  Created by Aji Saputra Raka Siwi on 20/10/18.
//  Copyright © 2018 Aji Saputra Raka Siwi. All rights reserved.
//

import Foundation

class Event{
    private var _strEvent:String!
    private var _strSport:String!
    private var _idLeague:String!
    private var _strLeague:String!
    private var _strHomeTeam:String!
    private var _strAwayTeam:String!
    private var _intHomeScore:String!
    private var _intAwayScore:String!
    private var _strHomeGoalDetails:String!
    private var _strHomeLineupGoalkeeper:String!
    private var _strHomeLineupDefense:String!
    private var _strHomeLineupMidfield:String!
    private var _strHomeLineupForward:String!
    private var _strHomeLineupSubstitutes:String!
    private var _strAwayGoalDetails:String!
    private var _strAwayLineupGoalkeeper:String!
    private var _strAwayLineupDefense:String!
    private var _strAwayLineupMidfield:String!
    private var _strAwayLineupForward:String!
    private var _strAwayLineupSubstitutes:String!
    private var _dateEvent:String!
    private var _strDate:String!
    private var _strTime:String!
    private var _idHomeTeam:String!
    private var _idAwayTeam:String!
    private var _idEvent: String!
    
    public var idEvent:String {
        if let i = _idEvent {
            if i == "" {
                return "null"
            }
            return i
        }
        return "null"
    }
    
    public var strEvent:String {
        if let i = _strEvent {
            if i == "" {
                return "null"
            }
            return i
        }
        return "null"
    }
    
    public var strSport:String {
        if let i = _strSport{
            if i == "" {
                return "null"
            }
            return i
        }
        return "null"
    }
    public var idLeague:String{
        if let i = _idLeague {
            if i == "" {
                return "null"
            }
            return i
        }
        return "null"

    }
    public var strLeague:String {
        if let i = _strLeague {
            if i == "" {
                return "null"
            }
            return i
        }
        return "null"

    }
    public var strHomeTeam:String{
        if let i = _strHomeTeam {
            if i == "" {
                return "null"
            }
            return i
        }
        return "null"

    }
    public var strAwayTeam:String{
        if let i = _strAwayTeam{
            if i == "" {
                return "null"
            }
            return i
        }
        return "null"

    }
    
    public var intHomeScore:String{
        if let i = _intHomeScore{
            if i == "" {
                return ""
            }
            return i
        }
        return "null"

    }
    public var intAwayScore:String{
        if let i = _intAwayScore{
            if i == "" {
                return ""
            }
            return i
        }
        return "null"

    }
    public var strHomeGoalDetails:String{
        if let i = _strHomeGoalDetails{
            if i == "" {
                return "-"
            }
            return i
        }
        return "null"

    }
    public var strHomeLineupGoalkeeper:String{
        if let i = _strHomeLineupGoalkeeper{
            if i == "" {
                return "null"
            }
            return i
        }
        return "null"

    }
    public var strHomeLineupDefense:String{
        if let i = _strHomeLineupDefense{
            if i == "" {
                return "null"
            }
            return i
        }
        return "null"

    }
    public var strHomeLineupMidfield:String{
        if let i = _strHomeLineupMidfield{
            if i == "" {
                return "null"
            }
            return i
        }
        return "null"

    }
    public var strHomeLineupForward:String{
        if let i = _strHomeLineupForward{
            if i == "" {
                return "null"
            }
            return i
        }
        return "null"

    }
    public var strHomeLineupSubstitutes:String{
        if let i = _strHomeLineupSubstitutes{
            if i == "" {
                return "null"
            }
            return i
        }
        return "null"

    }
    public var strAwayGoalDetails:String{
        if let i = _strAwayGoalDetails{
            if i == "" {
                return "-"
            }
            return i
        }
        return "null"

    }
    
    public var strAwayLineupGoalkeeper:String{
        if let i = _strAwayLineupGoalkeeper{
            if i == "" {
                return "null"
            }
            return i
        }
        return "null"

    }
    public var strAwayLineupDefense:String{
        if let i = _strAwayLineupDefense{
            if i == "" {
                return "null"
            }
            return i
        }
        return "null"

    }
    public var strAwayLineupMidfield:String{
        if let i = _strAwayLineupMidfield{
            if i == "" {
                return "null"
            }
            return i
        }
        return "null"

    }
    public var strAwayLineupForward:String{
        if let i = _strAwayLineupForward{
            if i == "" {
                return "null"
            }
            return i
        }
        return "null"

    }
    public var strAwayLineupSubstitutes:String{
        if let i = _strAwayLineupSubstitutes{
            if i == "" {
                return "null"
            }
            return i
        }
        return "null"

    }
    public var dateEvent:String{
        if let i = _dateEvent{
            if i == "" {
                return "null"
            }
            return i
        }
        return "null"

    }
    public var strDate:String{
        if let i = _strDate{
            if i == "" {
                return "null"
            }
            return i
        }
        return "null"

    }
    public var strTime:String{
        if let i = _strTime{
            if i == "" {
                return "null"
            }
            return i
        }
        return "null"

    }
    public var idHomeTeam:String{
        if let i = _idHomeTeam{
            if i == "" {
                return "null"
            }
            return i
        }
        return "null"

    }
    public var idAwayTeam:String{
        if let i = _idAwayTeam{
            if i == "" {
                return "null"
            }
            return i
        }
        return "null"
    }
    
    init(strEvent:String, strSport:String, idLeague:String, strLeague:String,
         strHomeTeam:String, strAwayTeam:String, intHomeScore:String, intAwayScore:String,
         strHomeGoalDetails:String, strHomeLineupGoalkeeper:String, strHomeLineupDefense:String,
         strHomeLineupMidfield:String,strHomeLineupForward:String, strHomeLineupSubstitutes:String,
         strAwayGoalDetails:String, strAwayLineupGoalkeeper:String, strAwayLineupDefense:String,
         strAwayLineupMidfield:String, strAwayLineupForward:String, strAwayLineupSubstitutes:String,
         dateEvent:String, strDate:String, strTime:String, idHomeTeam:String, idAwayTeam:String, idEvent: String ) {
        
        self._strEvent = strEvent
        self._strSport = strSport
        self._idLeague = idLeague
        self._strLeague = strLeague
        self._strHomeTeam = strHomeTeam
        self._strAwayTeam = strAwayTeam
        self._intHomeScore = intHomeScore
        self._intAwayScore = intAwayScore
        self._strHomeGoalDetails = strHomeGoalDetails
        self._strHomeLineupGoalkeeper = strHomeLineupGoalkeeper
        self._strHomeLineupDefense = strHomeLineupDefense
        self._strHomeLineupMidfield = strHomeLineupMidfield
        self._strHomeLineupForward = strHomeLineupForward
        self._strHomeLineupSubstitutes = strHomeLineupSubstitutes
        self._strAwayGoalDetails = strAwayGoalDetails
        self._strAwayLineupGoalkeeper = strAwayLineupGoalkeeper
        self._strAwayLineupDefense = strAwayLineupDefense
        self._strAwayLineupMidfield = strAwayLineupMidfield
        self._strAwayLineupForward = strAwayLineupForward
        self._strAwayLineupSubstitutes = strAwayLineupSubstitutes
        self._dateEvent = dateEvent
        self._strDate = strDate
        self._strTime = strTime
        self._idHomeTeam = idHomeTeam
        self._idAwayTeam = idAwayTeam
        self._idEvent = idEvent
    }
}

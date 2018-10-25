//
//  EventView.swift
//  SwiftKADE2
//
//  Created by Aji Saputra Raka Siwi on 20/10/18.
//  Copyright © 2018 Aji Saputra Raka Siwi. All rights reserved.
//

import Foundation

protocol EventProtocol {
    func startLoading()
    func stopLoading()
    func setEmptyEvents()
    func getEvents(events: [Event])
}

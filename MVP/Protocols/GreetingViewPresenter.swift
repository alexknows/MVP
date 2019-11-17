//
//  GreetingViewPresenter.swift
//  MVP
//
//  Created by Alex Cruz on 11/16/19.
//  Copyright © 2019 Alex Cruz. All rights reserved.
//

import UIKit

protocol GreetingViewPresenter {
    init(view: GreetingView, person: Person)
    func showGreeting()
}

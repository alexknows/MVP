//
//  GreetingPresenter.swift
//  MVP
//
//  Created by Alex Cruz on 11/16/19.
//  Copyright © 2019 Alex Cruz. All rights reserved.
//

import UIKit

class GreetingPresenter : GreetingViewPresenter {
    
    unowned let view: GreetingView
    let person: Person
    
    required init(view: GreetingView, person: Person) {
        self.view = view
        self.person = person
    }
    
    func showGreeting() {
        let greeting = "Hello" + " " + self.person.firstName + " " + self.person.lastName
        self.view.setGreeting(greeting: greeting)
    }
    
}


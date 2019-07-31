//
//  Option.swift
//  Parentale
//
//  Created by Justin Lim on 24/6/19.
//  Copyright © 2019 Justin Lim. All rights reserved.
//

import Foundation

class Option {
    var name: String
    var completed: Bool
    init(name: String, completed: Bool) {
        self.name = name
        self.completed = completed
    }
    func getName() -> String {
        return name
    }
    func getCompleted() -> Bool {
        return completed
    }
    func switchCompleted() {
        completed = !completed
    }
    func changeName(name: String) {
        self.name = name
    }
}

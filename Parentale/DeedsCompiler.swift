//
//  DeedsCompiler.swift
//  Parentale
//
//  Created by Justin Lim on 30/6/19.
//  Copyright © 2019 Justin Lim. All rights reserved.
//

import Foundation

class DeedsCompiler {
    
    var deedArray = [Deed]()
    
    init (deedArray : [Deed]) {
        self.deedArray = deedArray
    }
    
    convenience init () {
        let defaultDeedArray = [Deed]()
        self.init(deedArray: defaultDeedArray)
    }
    
    func addDeed(newDeed: Deed) {
        deedArray.append(newDeed)
    }
    
    func size() -> Int {
        return deedArray.count
    }
    
    // Sort deed according to date
    private func sortDeeds() {
        deedArray.sort(by: {$0.date > $1.date})
    }
    
    func getDeed(index: Int) -> Deed {
        sortDeeds()
        return deedArray[index]
    }
    
    // removes and replaces deedArray with one without similar uuid
    func removeDeed(uuid: String) {
        deedArray = deedArray.filter {$0.id != uuid}
    }
    
    
}

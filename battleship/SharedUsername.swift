//
//  SharedUsername.swift
//  battleship
//
//  Created by Walid Lamrini on 31/12/2021.
//

import Foundation

class SharedUsername {
    static var sharedInstance = SharedUsername()
    private init() {}
    var usr: String?
}

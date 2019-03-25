//
//  Result.swift
//  fsm
//
//  Created by Adrian Kaczmarek on 25/03/2019.
//  Copyright © 2019 Adrian Kaczmarek. All rights reserved.
//

import Foundation

enum Result<Value, Error: Swift.Error> {
    case success(Value)
    case failure(Error)
}

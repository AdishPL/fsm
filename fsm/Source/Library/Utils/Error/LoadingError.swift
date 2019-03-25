//
//  LoadingError.swift
//  fsm
//
//  Created by Adrian Kaczmarek on 25/03/2019.
//  Copyright © 2019 Adrian Kaczmarek. All rights reserved.
//

import Foundation

enum LoadingError: Error {
    case networkUnavailable
    case timedOut
    case invalidStatusCode(Int)
}

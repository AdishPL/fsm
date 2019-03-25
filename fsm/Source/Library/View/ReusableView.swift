//
//  ReusableView.swift
//  fsm
//
//  Created by Adrian Kaczmarek on 24/03/2019.
//  Copyright © 2019 Adrian Kaczmarek. All rights reserved.
//

import Foundation

protocol ReusableView {
    static var reuseIdentifier: String { get }
}

extension ReusableView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

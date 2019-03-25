//
//  EmptyState.swift
//  fsm
//
//  Created by Adrian Kaczmarek on 25/03/2019.
//  Copyright © 2019 Adrian Kaczmarek. All rights reserved.
//

import Foundation

final class EmptyState: State {
    override func enter() {
        super.enter()
        viewController.emptyStateLabel.isHidden = false
    }
}

//
//  ErrorState.swift
//  fsm
//
//  Created by Adrian Kaczmarek on 25/03/2019.
//  Copyright © 2019 Adrian Kaczmarek. All rights reserved.
//

import Foundation

final class ErrorState: State {
    let error: Error

    init(error: Error, viewController: MasterViewController) {
        self.error = error
        super.init(viewController: viewController)
    }

    override func enter() {
        super.enter()
        viewController.errorLabel.isHidden = false
        viewController.errorLabel.text = error.localizedDescription
    }
}

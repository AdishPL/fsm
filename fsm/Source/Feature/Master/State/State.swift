//
//  State.swift
//  fsm
//
//  Created by Adrian Kaczmarek on 23/03/2019.
//  Copyright © 2019 Adrian Kaczmarek. All rights reserved.
//

import UIKit

extension State {
    enum Kind {
        case loading
        case showingData([Item])
        case empty
        case error(Error)
    }
}

class State {
    weak var viewController: MasterViewController!

    init(viewController: MasterViewController) {
        self.viewController = viewController
    }

    static func state(_ state: Kind, viewController: MasterViewController) -> State {
        switch state {
        case .showingData(let items):
            return ShowingDataState(items: items, viewController: viewController)
        case .loading:
            return LoadingState(viewController: viewController)
        case .empty:
            return EmptyState(viewController: viewController)
        case .error(let error):
            return ErrorState(error: error, viewController: viewController)
        }
    }

    func enter() {
        self.viewController.tableView.isHidden = true
        self.viewController.errorLabel.isHidden = true
        self.viewController.activityIndicator.isHidden = true
        self.viewController.activityIndicator.stopAnimating()
        self.viewController.emptyStateLabel.isHidden = true
    }
}

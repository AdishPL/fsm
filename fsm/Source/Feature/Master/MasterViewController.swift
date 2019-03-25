//
//  MasterViewController.swift
//  fsm
//
//  Created by Adrian Kaczmarek on 23/03/2019.
//  Copyright © 2019 Adrian Kaczmarek. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {
    // showing or not showing data
    @IBOutlet weak var tableView: UITableView!

    // shown or hidden
    @IBOutlet weak var errorLabel: UILabel!

    // shown or hidden
    @IBOutlet weak var emptyStateLabel: UILabel!

    // shown and animating or hidden and stopped
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    // We also need to keep a strong reference to the data source,
    // since UITableView only uses a weak reference for it.
    var dataSource: UITableViewDataSource?

    //this should be injected but for demo purposes its defaulted
    var itemService: ItemService! = ItemServiceMock()

    lazy var state = State.state(.empty, viewController: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }

    private func loadData() {
        state = .state(.loading, viewController: self)
        state.enter()

        itemService.loadItems { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let items) where items.isEmpty:
                self.state = .state(.empty, viewController: self)
            case .success(let items):
                self.state = .state(.showingData(items), viewController: self)
            case .failure(let error):
                self.state = .state(.error(error), viewController: self)
            }

            DispatchQueue.main.async {
                self.state.enter()
            }
        }
    }
}

//
//  ShowingDataState.swift
//  fsm
//
//  Created by Adrian Kaczmarek on 25/03/2019.
//  Copyright © 2019 Adrian Kaczmarek. All rights reserved.
//

import Foundation

final class ShowingDataState: State {
    let items: [Item]

    init(items: [Item], viewController: MasterViewController) {
        self.items = items
        super.init(viewController: viewController)
    }

    override func enter() {
        super.enter()

        let dataSource = TableViewDataSource(
            models: items,
            reuseIdentifier: ItemCell.reuseIdentifier
        ) { item, cell in
            cell.textLabel?.text = item.name
        }

        viewController.dataSource = dataSource
        viewController.tableView.dataSource = dataSource
        viewController.tableView.isHidden = false
        viewController.tableView.reloadData()
    }
}

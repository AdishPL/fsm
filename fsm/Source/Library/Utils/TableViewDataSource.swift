//
//  TableViewDataSource.swift
//  fsm
//
//  Created by Adrian Kaczmarek on 24/03/2019.
//  Copyright © 2019 Adrian Kaczmarek. All rights reserved.
//

import UIKit

class TableViewDataSource<Model>: NSObject, UITableViewDataSource {
    typealias CellConfigurator = (Model, UITableViewCell) -> Void

    var models: [Model]

    private let reuseIdentifier: String
    private let cellConfigurator: CellConfigurator

    init(models: [Model],
         reuseIdentifier: String,
         cellConfigurator: @escaping CellConfigurator) {
        self.models = models
        self.reuseIdentifier = reuseIdentifier
        self.cellConfigurator = cellConfigurator
    }

    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return models.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(
            withIdentifier: reuseIdentifier,
            for: indexPath
        )

        cellConfigurator(model, cell)

        return cell
    }
}

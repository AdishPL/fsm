//
//  ItemService.swift
//  fsm
//
//  Created by Adrian Kaczmarek on 23/03/2019.
//  Copyright © 2019 Adrian Kaczmarek. All rights reserved.
//

import Foundation

protocol ItemService {
    func loadItems(then handler: @escaping (Result<[Item], LoadingError>) -> Void)
}

class ItemServiceMock: ItemService {
    typealias Handler = (Result<[Item], LoadingError>) -> Void

    func loadItems(then handler: @escaping Handler) {
        delay(2.0) {
            handler(.success(Item.mockedItems))
        }
    }

    func delay(_ delay: Double,
               closure: @escaping ()->()) {
        let when = DispatchTime.now() + delay
        DispatchQueue.global(qos: .background).asyncAfter(deadline: when, execute: closure)
    }
}

fileprivate extension Item {
    static var mockedItems: [Item] {
        return [
            Item(name: "First"),
            Item(name: "Second"),
            Item(name: "Third")
        ]
    }
}

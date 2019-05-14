//
//  StorageService.swift
//  themoviedb
//
//  Created by Alexander Lisovik on 14.05.19.
//  Copyright © 2019 Alexander Lisovik. All rights reserved.
//

import Foundation
import RealmSwift

final class ProductionStorageService: StorageService {
    static let shared = ProductionStorageService()
    private var storage: Realm

    init() {
        self.storage = try! Realm()
    }

    func objectExists<T: Object>(id: Int, type: T.Type) -> Bool {
        return storage.object(ofType: type, forPrimaryKey: id) != nil
    }

    func getData<T: Object>(for type: T.Type) -> Results<T> {
        return storage.objects(T.self)
    }

    func addData(object: Object) {
        if !object.isInvalidated {
            try? storage.write { storage.create(type(of: object).self, value: object, update: true) }
        }
    }

    func removeObject<T: Object>(id: Int, type: T.Type) {
        guard let objectToDelete = storage.object(ofType: type, forPrimaryKey: id) else {
            return
        }
        try? storage.write { storage.delete(objectToDelete) }
    }
}

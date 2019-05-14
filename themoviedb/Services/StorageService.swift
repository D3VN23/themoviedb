//
//  StorageService.swift
//  themoviedb
//
//  Created by Alexander Lisovik on 5/13/19.
//  Copyright © 2019 Alexander Lisovik. All rights reserved.
//

import Foundation
import RealmSwift

protocol StorageService {
    func objectExists<T: Object>(id: Int, type: T.Type) -> Bool
    func getData<T: Object>(for type: T.Type) -> Results<T>
    func addData(object: Object)
    func removeObject<T: Object>(id: Int, type: T.Type)
}

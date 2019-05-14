//
//  Presenter.swift
//  themoviedb
//
//  Created by Alexander Lisovik on 5/13/19.
//  Copyright © 2019 Alexander Lisovik. All rights reserved.
//

import Foundation

protocol Presenter {
    func didBindController()
    func viewWillAppear()
}

extension Presenter {
    func viewWillAppear() {}
}

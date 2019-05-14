//
//  XibLoadable.swift
//  themoviedb
//
//  Created by Alexander Lisovik on 5/13/19.
//  Copyright © 2019 Alexander Lisovik. All rights reserved.
//

import UIKit
import Foundation

// MARK: - XibLoadable
public protocol XibLoadable {
    static var xibName: String { get }
}

public extension XibLoadable {
    static func nib(bundle: Bundle? = nil) -> UINib {
        return UINib(nibName: xibName, bundle: bundle)
    }
}

public extension XibLoadable where Self: UIView {
    static var xibName: String {
        return String(describing: self)
    }
    
    static func loadViewFromXib() -> Self {
        let nib = self.nib(bundle: Bundle(for: Self.self))
        guard let view = nib.instantiate(withOwner: nil, options: nil).first as? Self else {
            fatalError("The nib \(nib) expected its root view to be of type \(self)")
        }
        return view
    }
}

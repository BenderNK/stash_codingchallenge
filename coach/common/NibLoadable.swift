//
//  NibLoadable.swift
//  coach
//
//  Created by Turker Nessa Kucuk on 1/14/21.
//

import UIKit

/// quick way to load nib resources
protocol NibLoadable: class {
    /// You use nibName as a cell identifier. Class name becomes the cell identifier.
    static var nibName: String { get }
    
    /// You use nibBundle to locate the bundle for the confirming class
    static var nibBundle: Bundle { get }
    
    /// You use nib to quickly register nib resources for UITableViews and UICollectionViews
    static var nib: UINib { get }
}

extension NibLoadable {
    static var nibName: String {
        return String(describing: self.self)
    }
    
    static var nibBundle: Bundle {
        return Bundle(for: self.self)
    }
    
    static var nib: UINib {
        return UINib(nibName: nibName, bundle: nibBundle)
    }
}

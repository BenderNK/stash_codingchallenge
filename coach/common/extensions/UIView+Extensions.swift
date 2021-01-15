//
//  UIView+Extensions.swift
//  coach
//
//  Created by Turker Nessa on 1/13/21.
//

import UIKit

extension UIView {
    func roundCorners(cornerRadius: CGFloat) {
        self.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
    }
}

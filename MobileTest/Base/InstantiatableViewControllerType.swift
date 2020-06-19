//
//  InstantiatableViewControllerType.swift
//  MobileTest
//
//  Created by macbook on 3/29/1399 AP.
//  Copyright © 1399 Yahya. All rights reserved.
//

import Foundation
import UIKit

protocol InstantiatableViewControllerType: IdentifiableType {
    static var storyboardName: StoryBoardName { get }
      static func instantiate() -> Self
      static func instantiateNC() -> UINavigationController
}

extension InstantiatableViewControllerType {

static func instantiate() -> Self {
    return self.storyboardName.storyboard.instantiateViewController(withIdentifier: self.identifier) as! Self
}

static func instantiateNC() -> UINavigationController {
    return self.storyboardName.storyboard.instantiateViewController(withIdentifier: self.navigationIdentifier) as! UINavigationController
}
}
protocol IdentifiableType {
    static var identifier: String { get }
    static var navigationIdentifier: String { get }
}
extension IdentifiableType {
    static var identifier: String {
        return String(describing: self)
    }
    
    static var navigationIdentifier: String {
        return "\(self.identifier)NC"
    }
}

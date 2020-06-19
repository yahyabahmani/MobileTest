//
//  StoryBoardName.swift
//  MobileTest
//
//  Created by macbook on 3/29/1399 AP.
//  Copyright © 1399 Yahya. All rights reserved.
//

import Foundation
import UIKit

enum StoryBoardName:String {
    case Main = "Main"
    case Login = "Login"
    case List = "List"
    
    var storyboard:UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: nil)
    }
}

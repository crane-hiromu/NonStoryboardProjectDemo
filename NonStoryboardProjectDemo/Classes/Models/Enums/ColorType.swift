//
//  ColorType.swift
//  NonStoryboardProject
//
//  Created by T.H on 2017/07/01.
//  Copyright © 2017年 T.H. All rights reserved.
//

import UIKit

enum ColorType {
    case main

    var display: UIColor {
        switch self {
        case .main: return UIColor(hex: 0xF7941E)
        }
    }
}

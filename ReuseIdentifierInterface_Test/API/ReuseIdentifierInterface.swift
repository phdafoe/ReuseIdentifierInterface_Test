//
//  ReuseIdentifierInterface.swift
//  ReuseIdentifierInterface_Test
//
//  Created by Andres Felipe Ocampo Eljaiesk on 2/2/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import Foundation
import UIKit

public protocol ReuseIdentifierInterface : class{
    static var defaultReuseIdentifier : String { get }
}

public extension ReuseIdentifierInterface where Self : UIView{
    static var defaultReuseIdentifier : String{
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}

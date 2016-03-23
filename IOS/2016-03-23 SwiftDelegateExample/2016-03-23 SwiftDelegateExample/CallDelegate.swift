//
//  CallDelegate.swift
//  2016-03-23 SwiftDelegateExample
//
//  Created by woong on 2016. 3. 23..
//  Copyright © 2016년 handstudio. All rights reserved.
//

import UIKit

protocol ViewDelegate: class {
    func didFinishTask()
}

class CallDelegate: NSObject {

    weak var delegate : ViewDelegate?
    
    /**
     * ViewDelegate call
     */
    func call() {
        delegate?.didFinishTask()
    }
    
}

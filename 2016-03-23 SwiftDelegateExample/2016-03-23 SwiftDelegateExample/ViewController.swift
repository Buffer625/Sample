//
//  ViewController.swift
//  2016-03-23 SwiftDelegateExample
//
//  Created by woong on 2016. 3. 23..
//  Copyright © 2016년 handstudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController , ViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        initData();
    }
    
    
    /**
     * 데이터 초기화
     */
    func initData() {
        
        let callDelegate = CallDelegate()
        callDelegate.delegate = self
        callDelegate.call()
    }
    
    
    /**
     * delegate call
     */
    func didFinishTask() {
        print(">>> didFinishTask")
    }

}


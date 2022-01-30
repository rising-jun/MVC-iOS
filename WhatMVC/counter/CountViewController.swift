//
//  CountViewController.swift
//  WhatMVC
//
//  Created by 김동준 on 2022/01/30.
//

import Foundation
import UIKit

class CountViewController: UIViewController{
    lazy var countView = CountView(frame: view.frame)
    lazy var countValue = CountValue(){
        didSet{
            countView.updateCountText(value: "\(countValue.value)")
        }
    }
    
    public private(set) var value: Int = 0{
        didSet{
            countView.updateCountText(value: "\(value)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = countView
        countView.setAction(action: self)
        
    }
}
extension CountViewController: CountViewAction{
    func touchedPlus() {
        value += 1
    }
    
    func touchedMinus() {
        value -= 1
    }
    
}

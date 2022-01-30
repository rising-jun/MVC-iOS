//
//  CountView.swift
//  WhatMVC
//
//  Created by 김동준 on 2022/01/30.
//

import Foundation
import UIKit
import SnapKit
import Then

class CountView: UIView{
    
    private var action: CountViewAction?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    lazy var countText = UILabel().then {
        $0.text = "0"
        $0.textAlignment = .center
        $0.textColor = .black
        $0.font = UIFont.boldSystemFont(ofSize: 32)
    }
    lazy var plusBtn = UIButton().then {
        $0.setTitle("+", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        $0.addTarget(self, action: #selector(tapPlusBtn), for: .touchUpInside)
    }
    lazy var minusBtn = UIButton().then {
        $0.setTitle("-", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        $0.addTarget(self, action: #selector(tapMinusBtn), for: .touchUpInside)
    }
    
    private func setup(){
        backgroundColor = .white
        setViewFactors()
        
        
    }
    
}

extension CountView{
    func setViewFactors(){
        addSubview(countText)
        addSubview(plusBtn)
        addSubview(minusBtn)
        
        countText.snp.makeConstraints { make in
            make.center.equalTo(self)
            make.height.equalTo(70)
            make.width.equalTo(90)
        }
        
        minusBtn.snp.makeConstraints { make in
            make.trailing.equalTo(countText.snp.leading).offset(-15)
            make.centerY.equalTo(self)
            make.height.width.equalTo(80)
        }
        
        plusBtn.snp.makeConstraints { make in
            make.leading.equalTo(countText.snp.trailing).offset(15)
            make.centerY.equalTo(self)
            make.height.width.equalTo(80)
        }
    }
    
    func setAction(action: CountViewAction){
        self.action = action
    }
    
    func updateCountText(value: String){
        countText.text = value
    }
    
    @objc func tapPlusBtn(){
        action?.touchedPlus()
    }
    
    @objc func tapMinusBtn(){
        action?.touchedMinus()
    }
    
    
}

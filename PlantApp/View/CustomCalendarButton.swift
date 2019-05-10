//
//  CustomCalendarButton.swift
//  PlantApp
//
//  Created by MacOS on 8/5/19.
//  Copyright © 2019 MacOS. All rights reserved.
//

import UIKit

class CustomCalendarButton: UIButton {
    
    let CreatePC = CreatePlantController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    
    func setupButton() {
        setShadow()
        
        setTitleColor(.white, for: .normal)
        
        backgroundColor      = .lightGray
        layer.cornerRadius   = 18
        layer.borderWidth    = 1
        layer.borderColor    = UIColor.darkGray.cgColor
        
        addTarget(self, action: #selector(activateButton), for: .touchUpInside)
        
    }
    
    @objc func activateButton(sender: CustomCalendarButton) {

        toggleButton[sender.tag] = !toggleButton[sender.tag]
    
        let buttonToChangeColor = sender.viewWithTag(sender.tag) as? UIButton
        let color = toggleButton[sender.tag] ? UIColor.red : .lightGray
        buttonToChangeColor?.backgroundColor = color
    }
        
        

    
    private func setShadow() {
        layer.shadowColor   = UIColor.black.cgColor
        layer.shadowOffset  = CGSize(width: 0.0, height: 6.0)
        layer.shadowRadius  = 3
        layer.shadowOpacity = 0.5
        clipsToBounds       = true
        layer.masksToBounds = false
    }
    
    
    func shake() {
        let shake           = CABasicAnimation(keyPath: "position")
        shake.duration      = 0.1
        shake.repeatCount   = 2
        shake.autoreverses  = true
        
        let fromPoint       = CGPoint(x: center.x - 8, y: center.y)
        let fromValue       = NSValue(cgPoint: fromPoint)
        
        let toPoint         = CGPoint(x: center.x + 8, y: center.y)
        let toValue         = NSValue(cgPoint: toPoint)
        
        shake.fromValue     = fromValue
        shake.toValue       = toValue
        
        layer.add(shake, forKey: "position")
    }
    
}

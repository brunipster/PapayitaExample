//
//  File.swift
//  PapayitaExample
//
//  Created by Bruno Reyes on 9/6/19.
//  Copyright © 2019 Bruno Reyes. All rights reserved.
//

import Foundation
import UIKit

class LaunchAnimation: UIView {
    
    private var _labelFont: UIFont? = UIFont.systemFont(ofSize: 80)
    private var _title: String? = "ANIMATION"
    private var _titleColor: UIColor? = UIColor(white: 2, alpha: 1)
    private var _backgroundColor: UIColor? = .black
    private var _colorsGradients: [CGColor] = [UIColor.clear.cgColor, UIColor.white.cgColor, UIColor.white.cgColor]
    private var _duration: CFTimeInterval = 3
    private var _repeat: Bool = true
    
    private let label = UILabel()
    private let gradientLabel = CAGradientLayer()
    private let animation = CABasicAnimation(keyPath: "transform.translation.x")
    
    @objc open var isRepeat: Bool {
        get{ return _repeat }
        set{ _repeat = newValue; setNeedsDisplay() }
    }
    
    @objc open var duration: CFTimeInterval {
        get{ return _duration }
        set{ _duration = newValue; setNeedsDisplay() }
    }
    
    @objc open var colorGradient: [CGColor] {
        get{ return _colorsGradients }
        set{ _colorsGradients = newValue; setNeedsDisplay() }
    }
    
    override var backgroundColor: UIColor? {
        get{ return _backgroundColor }
        set{ _backgroundColor = newValue; setNeedsDisplay() }
    }
    
    @objc open var titleColor: UIColor? {
        get{ return _titleColor }
        set{ _titleColor = newValue; setNeedsDisplay() }
    }
    
    @objc open var title: String? {
        get{ return _title }
        set{ _title = newValue; setNeedsDisplay() }
    }
    
    @objc open var labelFont: UIFont? {
        get { return _labelFont }
        set{ _labelFont = newValue; setNeedsDisplay() }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }

}

private extension LaunchAnimation{
    
    private func initialize(){
        
        label.text = _title
        label.textColor = _titleColor
        label.font = _labelFont
        label.frame = self.frame
        label.textAlignment = .center
        label.center.x = self.center.x
        label.center.y = self.center.y
        self.addSubview(label)
        
        gradientLabel.colors = _colorsGradients
        gradientLabel.locations = [0,0.6,1]
        gradientLabel.frame = CGRect(x: 0, y: 0, width: self.frame.height, height: self.frame.height)
        gradientLabel.transform = CATransform3DMakeRotation(45, 0, 0, 1)
        
        animation.duration = _duration
        animation.timingFunction = CAMediaTimingFunction(controlPoints: 0.86, 0, 0.07, 1.0)
        animation.fromValue = self.frame.width + 100
        animation.toValue = -self.frame.width
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        if _repeat {
            animation.repeatCount = Float.infinity
        }
        
        label.layer.mask = gradientLabel
        gradientLabel.add(animation, forKey: "transform.translation.x")
    }
    
    func stopAnimation(){
        animation.duration = _duration
        animation.timingFunction = CAMediaTimingFunction(controlPoints: 0.86, 0, 0.07, 1.0)
        animation.fromValue = self.frame.width
        animation.toValue = -self.frame.width
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = true
        
        label.layer.mask = gradientLabel
        
        gradientLabel.add(animation, forKey: "transform.translation.x")
        
        self.removeFromSuperview()
    }
    
}

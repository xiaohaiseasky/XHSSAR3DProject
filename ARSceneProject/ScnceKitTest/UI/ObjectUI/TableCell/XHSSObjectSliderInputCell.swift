//
//  XHSSObjectSliderInputCell.swift
//  ScnceKitTest
//
//  Created by Apple on 2017/12/28.
//  Copyright © 2017年 XiaoHai. All rights reserved.
//

import UIKit

extension Selector {
    static let sliderValueChanged = #selector(XHSSObjectSliderInputCell.sliderValueChanged(slider:));
}


class XHSSObjectSliderInputCell: XHSSObjectBaseTVCell {

    // MARK: - varibles
    var minInputBox: UITextField?;
    var maxInputBox: UITextField?;
    var slider: UISlider?;
    
    
    // MARK: - UI
    override func setupUI() {
        super.setupUI();
        
        self.minInputBox = UITextField();
        self.minInputBox?.font = UIFont.systemFont(ofSize: 17);
        self.minInputBox?.textColor = UIColor.white;
        self.minInputBox?.textAlignment = .center;
        self.minInputBox?.placeholder = "input value";
        self.contentView.addSubview(self.minInputBox!);
        
        self.maxInputBox = UITextField();
        self.maxInputBox?.font = UIFont.systemFont(ofSize: 17);
        self.maxInputBox?.textColor = UIColor.white;
        self.maxInputBox?.textAlignment = .center;
        self.maxInputBox?.placeholder = "input value";
        self.contentView.addSubview(self.maxInputBox!);
        
        self.slider = UISlider();
        self.slider?.minimumValue = 0;
        self.slider?.maximumValue = 100;
        self.slider?.value = 50;
        self.slider?.isContinuous = true;
        self.slider?.addTarget(self, action: .sliderValueChanged, for: .valueChanged);
        self.contentView.addSubview(self.slider!);
        
        
//        self.minInputBox?.backgroundColor = UIColor.magenta;
//        self.maxInputBox?.backgroundColor = UIColor.magenta;
    }
    
    override var cellModel: XHXXObjectCellModel? {
        didSet {
            self.tipLabel?.text = cellModel?.title;
            
            switch cellModel?.value {
            case let cgFloatValue as CGFloat:
                self.minInputBox?.text = "\(0.0)";
                self.maxInputBox?.text = "\(cgFloatValue)";
                
                self.slider?.minimumValue = 0.0;
                self.slider?.maximumValue = Float(cgFloatValue*2.0);
                self.slider?.value = Float(cgFloatValue);
            default:
                print("error value type")
            }
        }
    }
}

extension XHSSObjectSliderInputCell {
    override func layoutSubviews() {
        super.layoutSubviews();
        
//        self.tipLabel?
//            .heightEqualToNum(30)
//            .centerEqualToViewCenterPoint(self.contentView)
//            .widthEqualToNum(70)
//            .leftAligmentToNum(10)
//            .clearWarning();
        
        self.minInputBox?
            .widthEqualToNum(35)
            .heightEqualToNum(30)
            .centerEqualToViewCenterPoint(self.contentView)
            .leftAligmentToViewRight(self.tipLabel!)
            .moveRightByNum(10)
            .clearWarning();
        
        self.maxInputBox?
            .widthEqualToNum(35)
            .heightEqualToNum(30)
            .centerEqualToViewCenterPoint(self.contentView)
            .rightAligmentToNum(10)
            .clearWarning();
        
        self.slider?
            .heightEqualToNum(30)
            .centerEqualToViewCenterPoint(self.contentView)
            .leftDistance(10).toLeftRefView(self.minInputBox!)
            .rightDistance(10).toRightRefView(self.maxInputBox!)
            .clearWarning();
    }
}

extension XHSSObjectSliderInputCell {
    @objc func sliderValueChanged(slider: UISlider) {
        self.cellModel?.objectModel?.setValue(slider.value, forKey: (self.cellModel?.valueKey)!);
    }
}

extension XHSSObjectSliderInputCell {
    func setSliderValue(value: CGFloat) {
//        self.slider?.value = value > CGFloat();
    }
}

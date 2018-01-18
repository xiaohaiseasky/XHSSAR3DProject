//
//  XHSSObjectSwitchBtnTVCell.swift
//  ScnceKitTest
//
//  Created by Apple on 2017/12/29.
//  Copyright © 2017年 XiaoHai. All rights reserved.
//

import UIKit

class XHSSObjectSwitchBtnTVCell: XHSSObjectBaseTVCell {

    // MARK: - varibles
    var switchBtn: UISwitch?;
    
    // MARK: - UI
    override func setupUI() {
        super.setupUI();
        
        self.switchBtn = UISwitch();
        self.contentView.addSubview(self.switchBtn!);
    }
    
    override var cellModel: XHXXObjectCellModel? {
        didSet {
            self.tipLabel?.text = cellModel?.title;
            
            switch cellModel?.value {
            case let boolValue as Bool:
                self.switchBtn?.isOn = boolValue;
            default:
                print("error value type")
            }
        }
    }
}

extension XHSSObjectSwitchBtnTVCell {
    override func layoutSubviews() {
        super.layoutSubviews();
        
//        self.tipLabel?
//            .widthEqualToNum(self.contentView.xhssWidth/2.0)
//            .heightEqualToNum(30)
//            .centerEqualToViewCenterPoint(self.contentView)
//            .leftEqualToNum(10)
//            .clearWarning();
        
        self.switchBtn?
            .heightEqualToView(self.tipLabel!)
            .centerEqualToViewCenterPoint(self.contentView)
            .leftDistance(10).toLeftRefView(self.tipLabel!)
            .rightAligmentToNum(10)
            .clearWarning();
    }
}


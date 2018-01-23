//
//  XHSSObjectInputOnlyCell.swift
//  ScnceKitTest
//
//  Created by Apple on 2017/12/28.
//  Copyright © 2017年 XiaoHai. All rights reserved.
//

import UIKit

class XHSSObjectInputOnlyCell: XHSSObjectBaseTVCell {

    // MARK: - varibles
    var inputBox: UITextField?;
    
    // MARK: - UI
    override func setupUI() {
        super.setupUI();
        
        self.inputBox = UITextField();
        self.inputBox?.font = UIFont.systemFont(ofSize: 17);
        self.inputBox?.textColor = UIColor.white;
        self.inputBox?.textAlignment = .center;
        self.inputBox?.placeholder = "input value";
        self.contentView.addSubview(self.inputBox!);
    }

    override var cellModel: XHXXObjectCellModel? {
        didSet {
            self.tipLabel?.text = cellModel?.title;
            
            switch cellModel?.value {
            case let nsIntegerValue as NSInteger:
                self.inputBox?.text = "\(nsIntegerValue)";
            case let uiFontValue as UIFont:
                print("\(uiFontValue)");
            case let nsStringValue as NSString:
                print("\(nsStringValue)");
            default:
                print("error value type")
            }
        }
    }
}

extension XHSSObjectInputOnlyCell {
    override func layoutSubviews() {
        super.layoutSubviews();
        
//        self.tipLabel?
//            .widthEqualToNum(self.contentView.xhssWidth/2.0)
//            .heightEqualToNum(30)
//            .centerEqualToViewCenterPoint(self.contentView)
//            .leftEqualToNum(10)
//            .clearWarning();
        
        self.inputBox?
            .heightEqualToView(self.tipLabel!)
            .centerEqualToViewCenterPoint(self.contentView)
            .leftDistance(10).toLeftRefView(self.tipLabel!)
            .rightEqualToNum(10)
            .clearWarning();
    }
}

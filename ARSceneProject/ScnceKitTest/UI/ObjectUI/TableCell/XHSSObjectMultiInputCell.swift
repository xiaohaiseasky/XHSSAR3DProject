//
//  XHSSObjectMultiInputCell.swift
//  ScnceKitTest
//
//  Created by Apple on 2017/12/29.
//  Copyright © 2017年 XiaoHai. All rights reserved.
//

import UIKit

class XHSSObjectMultiInputCell: XHSSObjectBaseTVCell {

    // MARK: - varibles
    var xInput: UITextField?;
    var yInput: UITextField?;
    var wInput: UITextField?;
    var hInput: UITextField?;
    
    // MARK: - UI
    override func setupUI() {
        super.setupUI();
        
        self.xInput = UITextField();
        self.xInput?.font = UIFont.systemFont(ofSize: 17);
        self.xInput?.textColor = UIColor.white;
        self.xInput?.textAlignment = .center;
        self.xInput?.placeholder = "input x";
        self.contentView.addSubview(self.xInput!);
        
        self.yInput = UITextField();
        self.yInput?.font = UIFont.systemFont(ofSize: 17);
        self.yInput?.textColor = UIColor.white;
        self.yInput?.textAlignment = .center;
        self.yInput?.placeholder = "input y";
        self.contentView.addSubview(self.yInput!);
        
        self.wInput = UITextField();
        self.wInput?.font = UIFont.systemFont(ofSize: 17);
        self.wInput?.textColor = UIColor.white;
        self.wInput?.textAlignment = .center;
        self.wInput?.placeholder = "input w";
        self.contentView.addSubview(self.wInput!);
        
        self.hInput = UITextField();
        self.hInput?.font = UIFont.systemFont(ofSize: 17);
        self.hInput?.textColor = UIColor.white;
        self.hInput?.textAlignment = .center;
        self.hInput?.placeholder = "input h";
        self.contentView.addSubview(self.hInput!);
    }
    
    override var cellModel: XHXXObjectCellModel? {
        didSet {
            self.tipLabel?.text = cellModel?.title;
            
            switch cellModel?.value {
            case let cgRectValue as CGRect:
                self.xInput?.text = "\(cgRectValue.origin.x)"
                self.yInput?.text = "\(cgRectValue.origin.y)"
                self.wInput?.text = "\(cgRectValue.size.width)"
                self.hInput?.text = "\(cgRectValue.size.height)"
            default:
                print("error value type")
            }
        }
    }
}

extension XHSSObjectMultiInputCell {
    override func layoutSubviews() {
        super.layoutSubviews();
        
//        self.tipLabel?
//            .widthEqualToNum(self.contentView.xhssWidth/2.0)
//            .heightEqualToNum(30)
//            .centerEqualToViewCenterPoint(self.contentView)
//            .leftEqualToNum(10)
//            .clearWarning();
        
        let space: CGFloat = 7;
        let width: CGFloat = (self.contentView.xhssWidth/2.0 - space*4 - 10*2)/4.0;
        
        self.xInput?
            .heightEqualToView(self.tipLabel!)
            .widthEqualToNum(width)
            .centerEqualToViewCenterPoint(self.contentView)
            .leftDistance(10).toLeftRefView(self.tipLabel!)
            .clearWarning();
        
        self.yInput?
            .heightEqualToView(self.tipLabel!)
            .widthEqualToNum(width)
            .centerEqualToViewCenterPoint(self.contentView)
            .leftDistance(10).toLeftRefView(self.xInput!)
            .clearWarning();
        
        self.wInput?
            .heightEqualToView(self.tipLabel!)
            .widthEqualToNum(width)
            .centerEqualToViewCenterPoint(self.contentView)
            .leftDistance(10).toLeftRefView(self.yInput!)
            .clearWarning();
        
        self.hInput?
            .heightEqualToView(self.tipLabel!)
            .widthEqualToNum(width)
            .centerEqualToViewCenterPoint(self.contentView)
            .leftDistance(10).toLeftRefView(self.wInput!)
            .clearWarning();
    }
        
}


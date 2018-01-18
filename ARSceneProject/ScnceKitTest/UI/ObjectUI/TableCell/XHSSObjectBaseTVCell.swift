//
//  XHSSObjectBaseTVCell.swift
//  ScnceKitTest
//
//  Created by Apple on 2017/12/28.
//  Copyright © 2017年 XiaoHai. All rights reserved.
//

import UIKit

class XHSSObjectBaseTVCell: UITableViewCell {

    // MARK: -
    var cellModel: XHXXObjectCellModel?;
    
    
    // MARK: - varibles
    var tipLabel: UILabel?;
    
    // MARK: - init
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        setupUI();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupUI() {
        self.backgroundColor = UIColor.clear;
        
        setupView();
    }
}

extension XHSSObjectBaseTVCell {
    func setupView() {
        self.tipLabel = UILabel();
        self.tipLabel?.font = UIFont.systemFont(ofSize: 17);
        self.tipLabel?.textColor = UIColor.white;
        self.tipLabel?.textAlignment = .left;
        self.contentView .addSubview(self.tipLabel!);
        
//        self.tipLabel?.backgroundColor = UIColor.blue;
    }
    
    override func layoutSubviews() {
//        self.tipLabel?
//            .leftEqualToNum(10)
//            .rightEqualToNum(10)
//            .heightEqualToNum(30)
//            .centerEqualToViewCenterPoint(self.contentView)
//            .clearWarning();
        
        self.tipLabel?
            .widthEqualToNum(70)
            .heightEqualToNum(30)
            .centerEqualToViewCenterPoint(self.contentView)
            .leftAligmentToNum(10)
            .clearWarning();
    }
}

extension XHSSObjectBaseTVCell {
    func setTipInfoText(text: String) {
        self.tipLabel?.text = text;
    }
}

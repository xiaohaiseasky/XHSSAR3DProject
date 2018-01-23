
//
//  XHSSObjectTipCell.swift
//  ScnceKitTest
//
//  Created by Apple on 2017/12/28.
//  Copyright © 2017年 XiaoHai. All rights reserved.
//

import UIKit

class XHSSObjectTipCell: XHSSObjectBaseTVCell {

    // MARK: - varibles
    
    // MARK: - UI
    override func setupUI() {
        super.setupUI();
    }

    override var cellModel: XHXXObjectCellModel? {
        didSet {
            self.tipLabel?.text = cellModel?.title;
        }
    }
}

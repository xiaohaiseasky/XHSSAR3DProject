//
//  XHSSObjectOprationTypePopView.swift
//  ScnceKitTest
//
//  Created by Apple on 2018/1/2.
//  Copyright © 2018年 XiaoHai. All rights reserved.
//

import UIKit


enum XHSSObjectOprationType {
    case oprate
    case create
    case edit
    case copy
    case delete
    case cancel
}

class XHSSObjectOprationTypePopView: UIView {
    
    // MARK: - DATA VARIBLE
    var colickCallBack: XHSSColickPopViewItemCallBack?
    
    
    // MARK: - VIEW VARIBLE
    var oprateLabel: UILabel?;
    var createLabel: UILabel?;
    var editLabel: UILabel?;
    var copyLabel: UILabel?;
    var deleteLabel: UILabel?;
    var cancelLabel: UILabel?;
    
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        setup();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SETUP
    func setup() {
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector.tapControlBoardView));
        setupData();
        setupUI();
    }
    
    // MARK: - DATA
    func setupData() {
    }
    
    // MARK: - UI
    func setupUI() {
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(XHSSObjectOprationTypePopView.handleTapAction(tap:))));
        
        self.backgroundColor = UIColor(white: 0, alpha: 0.7);
        
        setupLabel();
    }
}

extension XHSSObjectOprationTypePopView {
    func setupLabel() {
        self.oprateLabel = UILabel();
        self.oprateLabel?.text = "操作";
        self.oprateLabel?.font = UIFont.systemFont(ofSize: 17);
        self.oprateLabel?.textColor = UIColor.white;
        self.oprateLabel?.textAlignment = .center;
        self.addSubview(self.oprateLabel!);
        
        self.createLabel = UILabel();
        self.createLabel?.text = "创建";
        self.createLabel?.font = UIFont.systemFont(ofSize: 17);
        self.createLabel?.textColor = UIColor.white;
        self.createLabel?.textAlignment = .center;
        self.addSubview(self.createLabel!);
        
        self.editLabel = UILabel();
        self.editLabel?.text = "编辑";
        self.editLabel?.font = UIFont.systemFont(ofSize: 17);
        self.editLabel?.textColor = UIColor.white;
        self.editLabel?.textAlignment = .center;
        self.addSubview(self.editLabel!);
        
        self.copyLabel = UILabel();
        self.copyLabel?.text = "复制";
        self.copyLabel?.font = UIFont.systemFont(ofSize: 17);
        self.copyLabel?.textColor = UIColor.white;
        self.copyLabel?.textAlignment = .center;
        self.addSubview(self.copyLabel!);
        
        self.deleteLabel = UILabel();
        self.deleteLabel?.text = "删除";
        self.deleteLabel?.font = UIFont.systemFont(ofSize: 17);
        self.deleteLabel?.textColor = UIColor.white;
        self.deleteLabel?.textAlignment = .center;
        self.addSubview(self.deleteLabel!);
        
        self.cancelLabel = UILabel();
        self.cancelLabel?.text = "取消";
        self.cancelLabel?.font = UIFont.systemFont(ofSize: 17);
        self.cancelLabel?.textColor = UIColor.white;
        self.cancelLabel?.textAlignment = .center;
        self.addSubview(self.cancelLabel!);
    }
    
    override func layoutSubviews() {
        let labelCount: CGFloat = 6;
        
        self.oprateLabel?
            .topEqualToNum(0)
            .leftEqualToNum(0)
            .rightEqualToNum(0)
            .heightEqualToNum(self.xhssHeight/labelCount)
            .clearWarning();
        
        self.createLabel?
            .leftEqualToNum(0)
            .rightEqualToNum(0)
            .heightEqualToNum(self.xhssHeight/labelCount)
            .topAligmentToViewBotton(self.oprateLabel!)
            .clearWarning();
        
        self.editLabel?
            .leftEqualToNum(0)
            .rightEqualToNum(0)
            .heightEqualToNum(self.xhssHeight/labelCount)
            .topAligmentToViewBotton(self.createLabel!)
            .clearWarning();
        
        self.copyLabel?
            .leftEqualToNum(0)
            .rightEqualToNum(0)
            .heightEqualToNum(self.xhssHeight/labelCount)
            .topAligmentToViewBotton(self.editLabel!)
            .clearWarning();
        
        self.deleteLabel?
            .leftEqualToNum(0)
            .rightEqualToNum(0)
            .heightEqualToNum(self.xhssHeight/labelCount)
            .topAligmentToViewBotton(self.copyLabel!)
            .clearWarning();
        
        self.cancelLabel?
            .leftEqualToNum(0)
            .rightEqualToNum(0)
            .heightEqualToNum(self.xhssHeight/labelCount)
            .topAligmentToViewBotton(self.deleteLabel!)
            .clearWarning();
    }
}

extension XHSSObjectOprationTypePopView {
    // MARK: - ACTION
    @objc func handleTapAction(tap: UITapGestureRecognizer) {
        let point = tap.location(in: self);
        if self.oprateLabel?.frame.contains(point) == true {
            self.colickCallBack!(.oprate);
        }else if self.createLabel?.frame.contains(point) == true {
            self.colickCallBack!(.create);
        } else if self.editLabel?.frame.contains(point) == true {
            self.colickCallBack!(.edit);
        } else if self.copyLabel?.frame.contains(point) == true {
            self.colickCallBack!(.copy);
        } else if self.deleteLabel?.frame.contains(point) == true {
            self.colickCallBack!(.delete);
        } else if self.cancelLabel?.frame.contains(point) == true {
            self.colickCallBack!(.cancel);
        }
        
        self.removeFromSuperview();
    }
}


typealias XHSSColickPopViewItemCallBack = (_ oprationType: XHSSObjectOprationType) -> ();
extension XHSSObjectOprationTypePopView {
    // MARK: - PUBLIC
    static func show(inView superView: UIView, colickCallBack callBack: @escaping XHSSColickPopViewItemCallBack) {
        let width: CGFloat = 100;
        let height: CGFloat = 200;
        let popView = XHSSObjectOprationTypePopView(frame: CGRect(x: (superView.xhssWidth - width)/2.0,
                                                                  y: (superView.xhssHeight - height)/2.0,
                                                                  width: width,
                                                                  height: height));
        popView.colickCallBack = callBack;
        superView.addSubview(popView);
    }
}


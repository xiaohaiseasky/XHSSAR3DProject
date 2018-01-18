//
//  XHSSMaterialContentEditView.swift
//  ScnceKitTest
//
//  Created by Apple on 2018/1/11.
//  Copyright © 2018年 XiaoHai. All rights reserved.
//

import UIKit

class XHSSMaterialContentEditView: UIView {

    typealias XHSSMaterialContentEditViewCallBack = (Any) -> ();
    var editContentFinishCallBack:XHSSMaterialContentEditViewCallBack?;
    
    
    // MARK: - view varible
    var colorLabel: UILabel?;
    var imageLabel: UILabel?;
    var layerLabel: UILabel?;
    var SpriteKitLabel: UILabel?;
    var textureLabel: UILabel?;
    var floatingLabel: UILabel?;
    
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        setupUI();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension XHSSMaterialContentEditView {
    func setupUI() {
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(XHSSMaterialContentEditView.tapInSelf(tap:))));
        self.backgroundColor = UIColor.black;
        
        self.colorLabel = UILabel();
        self.colorLabel?.font = UIFont.systemFont(ofSize: 17);
        self.colorLabel?.textColor = UIColor.white;
        self.colorLabel?.textAlignment = .center;
        self.colorLabel?.text = "颜色";
        self.addSubview(self.colorLabel!);
        
        self.imageLabel = UILabel();
        self.imageLabel?.font = UIFont.systemFont(ofSize: 17);
        self.imageLabel?.textColor = UIColor.white;
        self.imageLabel?.textAlignment = .center;
        self.imageLabel?.text = "图片";
        self.addSubview(self.imageLabel!);
        
        self.layerLabel = UILabel();
        self.layerLabel?.font = UIFont.systemFont(ofSize: 17);
        self.layerLabel?.textColor = UIColor.white;
        self.layerLabel?.textAlignment = .center;
        self.layerLabel?.text = "图层";
        self.addSubview(self.layerLabel!);
        
        self.SpriteKitLabel = UILabel();
        self.SpriteKitLabel?.font = UIFont.systemFont(ofSize: 17);
        self.SpriteKitLabel?.textColor = UIColor.white;
        self.SpriteKitLabel?.textAlignment = .center;
        self.SpriteKitLabel?.text = "精灵";
        self.addSubview(self.SpriteKitLabel!);
        
        self.textureLabel = UILabel();
        self.textureLabel?.font = UIFont.systemFont(ofSize: 17);
        self.textureLabel?.textColor = UIColor.white;
        self.textureLabel?.textAlignment = .center;
        self.textureLabel?.text = "纹理";
        self.addSubview(self.textureLabel!);
        
        self.floatingLabel = UILabel();
        self.floatingLabel?.font = UIFont.systemFont(ofSize: 17);
        self.floatingLabel?.textColor = UIColor.white;
        self.floatingLabel?.textAlignment = .center;
        self.floatingLabel?.text = "数值 0-1";
        self.addSubview(self.floatingLabel!);
    }
    
    override func layoutSubviews() {
        let space: CGFloat = 20;
        
        self.SpriteKitLabel?
            .leftEqualToNum(0)
            .rightEqualToNum(0)
            .heightEqualToNum(30)
            .centerEqualToViewCenterPoint(self)
            .clearWarning();
        
        self.textureLabel?
            .leftEqualToNum(0)
            .rightEqualToNum(0)
            .heightEqualToNum(30)
            .topAligmentToViewBotton(self.SpriteKitLabel!)
            .moveDwonByNum(space)
            .clearWarning();
        
        self.floatingLabel?
            .leftEqualToNum(0)
            .rightEqualToNum(0)
            .heightEqualToNum(30)
            .topAligmentToViewBotton(self.textureLabel!)
            .moveDwonByNum(space)
            .clearWarning();
        
        self.layerLabel?
            .leftEqualToNum(0)
            .rightEqualToNum(0)
            .heightEqualToNum(30)
            .bottomAligmentToViewTop(self.SpriteKitLabel!)
            .moveUpByNum(space)
            .clearWarning();
        
        self.imageLabel?
            .leftEqualToNum(0)
            .rightEqualToNum(0)
            .heightEqualToNum(30)
            .bottomAligmentToViewTop(self.layerLabel!)
            .moveUpByNum(space)
            .clearWarning();
        
        self.colorLabel?
            .leftEqualToNum(0)
            .rightEqualToNum(0)
            .heightEqualToNum(30)
            .bottomAligmentToViewTop(self.imageLabel!)
            .moveUpByNum(space)
            .clearWarning();
    }
}

extension XHSSMaterialContentEditView {
    // MARK: - Action
    @objc func tapInSelf(tap: UITapGestureRecognizer) {
        let point = tap.location(in: self);
        
        if self.colorLabel?.frame.contains(point) == true {
//            self.editContentFinishCallBack?();
        } else if self.imageLabel?.frame.contains(point) == true {
            let paintView = XHSSMaterialContentImageLPaintView();
            paintView.show(inView: self.superview!, finishCallBack: { (image: UIImage) in
                print("image: \(image)");
                self.editContentFinishCallBack?(image);
            });
        } else if self.layerLabel?.frame.contains(point) == true {
            
        } else if self.SpriteKitLabel?.frame.contains(point) == true {
            
        } else if self.textureLabel?.frame.contains(point) == true {
            
        } else if self.floatingLabel?.frame.contains(point) == true {
            
        }
        
        self.removeFromSuperview();
    }
}

extension XHSSMaterialContentEditView {
    // MARK: - Action
    func show(inView superView: UIView, finishCallBack finish: @escaping XHSSMaterialContentEditViewCallBack) {
        self.frame = superView.bounds;
        superView.addSubview(self);
        self.editContentFinishCallBack = finish;
    }
}

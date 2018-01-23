//
//  XHSSControlBoardView.swift
//  ScnceKitTest
//
//  Created by Apple on 2017/12/25.
//  Copyright © 2017年 XiaoHai. All rights reserved.
//

import UIKit
import SceneKit

extension Selector {
    static let tapControlBoardView = #selector(XHSSControlBoardView.tapControlBoardView(tap:));
//    static let longPressControlBoardView = #selector(XHSSControlBoardView.longPressControlBoardView(longPress:));
}

enum XHSSOprationSubType {
    case rotateUp
    case rotateLeft
    case rotateBottom
    case rotateDown
    
    case translateUP
    case translateDown
    case translateLeft
    case translateRight
    case translateForward
    case translateBack
    
    case scaleIn
    case scaleOut
}

enum XHSSOprationType {
    case translate
    case rotate
    case scale
}



class XHSSControlBoardView: UIView {
    // MARK: - diliver param
    var geometry: SCNGeometry?;
    var geometryNode: SCNNode?;
    
    // MARK: - config data
    var oprationType: XHSSOprationType! = .translate;
    
    var ControlTipImgViewWidth: CGFloat?;
    var ControlTipImgViewHeight: CGFloat?;
    var ControlImgViewWidth: CGFloat?;
    
    let rotateSpeed: Float = 0.2;
    let translateSpeed: Float = 0.2;
    let scaleSpeed: Float = 0.2;
    
    
    // MARK: - view
    var leftControlTipImgView: UIImageView?;
    var rightControlTipImgView: UIImageView?;
    
    var leftControlTopImgView: UIImageView?;
    var leftControlLeftImgView: UIImageView?;
    var leftControlBottomImgView: UIImageView?;
    var leftControlRightImgView: UIImageView?;
    
    var leftControlleftTopImgView: UIImageView?;
    var leftControlleftBottomImgView: UIImageView?;
    
    var rightControlTopImgView: UIImageView?;
    var rightControlLeftImgView: UIImageView?;
    var rightControlBottomImgView: UIImageView?;
    var rightControlRightImgView: UIImageView?;
    
    var rightControlRightTopImgView: UIImageView?;
    var rightControlRightBottomImgView: UIImageView?;
    
    
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
        self.ControlImgViewWidth = 35.0;
        self.ControlTipImgViewWidth = self.ControlImgViewWidth!*4;
        self.ControlTipImgViewHeight = self.ControlImgViewWidth!*3;
    }
    
    // MARK: - UI
    func setupUI() {
        /// back ground
        self.leftControlTipImgView = UIImageView();
        self.leftControlTipImgView?.backgroundColor = UIColor.red;
        self.addSubview(self.leftControlTipImgView!);
        
        self.rightControlTipImgView = UIImageView();
        self.rightControlTipImgView?.backgroundColor = UIColor.red;
        self.addSubview(self.rightControlTipImgView!);
        
        
        /// left
        self.leftControlTopImgView = UIImageView();
        self.leftControlTopImgView?.backgroundColor = UIColor.blue;
        self.addSubview(self.leftControlTopImgView!);
        
        self.leftControlLeftImgView = UIImageView();
        self.leftControlLeftImgView?.backgroundColor = UIColor.blue;
//        self.addSubview(self.leftControlLeftImgView!);
        
        self.leftControlBottomImgView = UIImageView();
        self.leftControlBottomImgView?.backgroundColor = UIColor.blue;
        self.addSubview(self.leftControlBottomImgView!);
        
        self.leftControlRightImgView = UIImageView();
        self.leftControlRightImgView?.backgroundColor = UIColor.blue;
        self.addSubview(self.leftControlRightImgView!);
        
        self.leftControlleftTopImgView = UIImageView();
        self.leftControlleftTopImgView?.backgroundColor = UIColor.blue;
//        self.addSubview(self.leftControlleftTopImgView!);
        
        self.leftControlleftBottomImgView = UIImageView();
        self.leftControlleftBottomImgView?.backgroundColor = UIColor.blue;
//        self.addSubview(self.leftControlleftBottomImgView!);
        
        
        /// left
        self.rightControlTopImgView = UIImageView();
        self.rightControlTopImgView?.backgroundColor = UIColor.blue;
        self.addSubview(self.rightControlTopImgView!);
        
        self.rightControlLeftImgView = UIImageView();
        self.rightControlLeftImgView?.backgroundColor = UIColor.blue;
        self.addSubview(self.rightControlLeftImgView!);
        
        self.rightControlBottomImgView = UIImageView();
        self.rightControlBottomImgView?.backgroundColor = UIColor.blue;
        self.addSubview(self.rightControlBottomImgView!);
        
        self.rightControlRightImgView = UIImageView();
        self.rightControlRightImgView?.backgroundColor = UIColor.blue;
        self.addSubview(self.rightControlRightImgView!);
        
        self.rightControlRightTopImgView = UIImageView();
        self.rightControlRightTopImgView?.backgroundColor = UIColor.blue;
        self.addSubview(self.rightControlRightTopImgView!);
        
        self.rightControlRightBottomImgView = UIImageView();
        self.rightControlRightBottomImgView?.backgroundColor = UIColor.blue;
        self.addSubview(self.rightControlRightBottomImgView!);
    }
    
    // MARK: - layout
    override func layoutSubviews() {
        /// background
        self.leftControlTipImgView?
            .widthEqualToNum(self.ControlTipImgViewWidth!)
            .heightEqualToNum(self.ControlTipImgViewHeight!)
            .centerEqualToViewCenterPoint(self)
            .leftAligmentToNum(10)
            .clearWarning();
        self.rightControlTipImgView?
            .widthEqualToNum(self.ControlTipImgViewWidth!)
            .heightEqualToNum(self.ControlTipImgViewHeight!)
            .centerEqualToViewCenterPoint(self)
            .rightAligmentToNum(10)
            .clearWarning();
        
        /// left
        self.leftControlTopImgView?
            .widthEqualToNum(self.ControlImgViewWidth!)
            .heightEqualToNum((leftControlTopImgView?.xhssWidth)!)
            .centerEqualToView(leftControlTipImgView!)
            .moveUpToNum((leftControlTipImgView?.xhssY)!)
            .rightAligmentToViewRight(leftControlTipImgView!)
            .moveLeftByNum((leftControlTopImgView?.xhssWidth)!)
            .clearWarning();
        self.leftControlLeftImgView?
            .widthEqualToView(leftControlTopImgView!)
            .heightEqualToView(leftControlTopImgView!)
            .centerEqualToView(leftControlTipImgView!)
            //.moveLeftToNum(leftControlTipImgView!.xhssX)
            .rightAligmentToViewRight(leftControlTipImgView!)
            .moveLeftByNum((leftControlTopImgView?.xhssWidth)!*2)
            .clearWarning();
        self.leftControlBottomImgView?
            .widthEqualToView(leftControlTopImgView!)
            .heightEqualToView(leftControlTopImgView!)
            .centerEqualToView(leftControlTipImgView!)
            .moveDwonToNum(leftControlTipImgView!.xhssMaxY)
            .rightAligmentToViewRight(leftControlTipImgView!)
            .moveLeftByNum((leftControlTopImgView?.xhssWidth)!)
            .clearWarning();
        self.leftControlRightImgView?
            .widthEqualToView(leftControlTopImgView!)
            .heightEqualToView(leftControlTopImgView!)
            .centerEqualToView(leftControlTipImgView!)
            .moveRightToNum(leftControlTipImgView!.xhssMaxX)
            .clearWarning();
        
        self.leftControlleftTopImgView?
            .widthEqualToView(leftControlTopImgView!)
            .heightEqualToView(leftControlTopImgView!)
            .centerEqualToView(leftControlTipImgView!)
            .leftAligmentToNum(10)
            .topAligmentToViewTop(self.leftControlTipImgView!)
            .clearWarning();
        self.leftControlleftBottomImgView?
            .widthEqualToView(leftControlTopImgView!)
            .heightEqualToView(leftControlTopImgView!)
            .centerEqualToView(leftControlTipImgView!)
            .leftAligmentToNum(10)
            .bottomAligmentToViewBotton(self.leftControlTipImgView!)
            .clearWarning();
        
        
        /// right
        self.rightControlTopImgView?
            .widthEqualToNum(self.ControlImgViewWidth!)
            .heightEqualToNum((rightControlTopImgView?.xhssWidth)!)
            .centerEqualToView(rightControlTipImgView!)
            .moveUpToNum((rightControlTipImgView?.xhssY)!)
            //.moveRightByNum(self.ControlImgViewWidth!/2.0)
            .leftAligmentToViewLeft(rightControlTipImgView!)
            .moveRightByNum((rightControlTopImgView?.xhssWidth)!)
            .clearWarning();
        self.rightControlLeftImgView?
            .widthEqualToView(rightControlTopImgView!)
            .heightEqualToView(rightControlTopImgView!)
            .centerEqualToView(rightControlTipImgView!)
            .moveLeftToNum(rightControlTipImgView!.xhssX)
            .clearWarning();
        self.rightControlBottomImgView?
            .widthEqualToView(rightControlTopImgView!)
            .heightEqualToView(rightControlTopImgView!)
            .centerEqualToView(rightControlTipImgView!)
            .moveDwonToNum(rightControlTipImgView!.xhssMaxY)
            //.moveRightByNum(self.ControlImgViewWidth!/2.0)
            .leftAligmentToViewLeft(rightControlTipImgView!)
            .moveRightByNum((rightControlTopImgView?.xhssWidth)!)
            .clearWarning();
        self.rightControlRightImgView?
            .widthEqualToView(rightControlTopImgView!)
            .heightEqualToView(rightControlTopImgView!)
            .centerEqualToView(rightControlTipImgView!)
            //.moveRightToNum(rightControlTipImgView!.xhssMaxX)
            .leftAligmentToViewRight(rightControlTopImgView!)
            .clearWarning();
        
        self.rightControlRightTopImgView?
            .widthEqualToView(rightControlTopImgView!)
            .heightEqualToView(rightControlTopImgView!)
            .centerEqualToView(rightControlTipImgView!)
            .moveLeftToNum(rightControlTipImgView!.xhssX)
            .moveUpToNum(rightControlTipImgView!.xhssY)
            //.moveRightByNum(self.ControlImgViewWidth!)
            .rightAligmentToNum(10)
            .clearWarning();
        self.rightControlRightBottomImgView?
            .widthEqualToView(rightControlTopImgView!)
            .heightEqualToView(rightControlTopImgView!)
            .centerEqualToView(rightControlTipImgView!)
            .moveLeftToNum(rightControlTipImgView!.xhssX)
            .moveDwonToNum(rightControlTipImgView!.xhssMaxY)
            //.moveRightByNum(self.ControlImgViewWidth!)
            .rightAligmentToNum(10)
            .clearWarning();
    }
}

extension XHSSControlBoardView {
    // MARK: - ACTION
    @objc func tapControlBoardView(tap: UITapGestureRecognizer) {
        let point = tap.location(in: self);
            ///
        if self.leftControlTopImgView?.frame.contains(point) == true {
            self.oprationType = .translate;
        } else if self.leftControlLeftImgView?.frame.contains(point) == true {
            ///
        } else if self.leftControlBottomImgView?.frame.contains(point) == true {
            self.oprationType = .scale;
        } else if self.leftControlRightImgView?.frame.contains(point) == true {
            self.oprationType = .rotate;
        } else if self.leftControlleftTopImgView?.frame.contains(point) == true {
            ///
        } else if self.leftControlleftBottomImgView?.frame.contains(point) == true {
            ///
        }
        
        doOpration(type: self.oprationType, point: point);
        
        
        
        //////////////////////////////////////////////////////
//        var geometrySourceArr = self.geometryNode?.geometry?.sources;
//        var geometryElementsArr = self.geometryNode?.geometry?.elements;
//        let firstSource = geometrySourceArr?.first;
////        let lastSource = geometrySourceArr?.last;
////        let geometrySource = SCNGeometrySource(vertices:[SCNVector3(0, 3, 0)]);
////        geometrySourceArr?.append(geometrySource);
//        SCNGeometryElement(indices: [0, 1, 2], primitiveType: .triangles);
//        self.geometryNode?.geometry = SCNGeometry(sources: geometrySourceArr!, elements: geometryElementsArr!);
        
//        let shapePath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 3, height: 3), cornerRadius: 1);
//        let shape = SCNShape(path: shapePath, extrusionDepth: 10);
//        let shapeNode = SCNNode(geometry: shape);
//        shapeNode.position = SCNVector3(0, 0, 0);
//        shapeNode.name = "shape";
//        self.geometryNode?.addChildNode(shapeNode);
//        let materail = SCNMaterial();
//        materail.diffuse.contents = UIImage(named: "tiankong.jpg");
//        shape.materials = [materail];
        //////////////////////////////////////////////////////
    }
    
    
    func doOpration(type: XHSSOprationType, point: CGPoint) {
        switch type {
        case .translate:
            doTranslate(point: point);
        case .rotate:
            doRotate(point: point);
        case .scale:
            doScale(point: point);
        }
    }
    
    func doTranslate(point: CGPoint) {
        if self.rightControlTopImgView?.frame.contains(point) == true {
            self.geometryNode?.localTranslate(by: SCNVector3(x: 0, y: self.translateSpeed, z: 0));
        } else if self.rightControlLeftImgView?.frame.contains(point) == true {
            self.geometryNode?.localTranslate(by: SCNVector3(x: -self.translateSpeed, y: 0, z: 0));
        } else if self.rightControlBottomImgView?.frame.contains(point) == true {
            self.geometryNode?.localTranslate(by: SCNVector3(x: 0, y: -self.translateSpeed, z: 0));
        } else if self.rightControlRightImgView?.frame.contains(point) == true {
            self.geometryNode?.localTranslate(by: SCNVector3(x: self.translateSpeed, y: 0, z: 0));
        } else if self.rightControlRightTopImgView?.frame.contains(point) == true {
            self.geometryNode?.localTranslate(by: SCNVector3(x: 0, y: 0, z: self.translateSpeed));
        } else if self.rightControlRightBottomImgView?.frame.contains(point) == true {
            self.geometryNode?.localTranslate(by: SCNVector3(x: 0, y: 0, z: -self.translateSpeed));
        }
    }
    
    func doRotate(point: CGPoint) {
        var rotate: SCNAction = SCNAction.move(by: SCNVector3Zero, duration: 0);
        if self.rightControlTopImgView?.frame.contains(point) == true {
            rotate = SCNAction.rotateBy(x: CGFloat(self.rotateSpeed), y: 0, z: 0, duration: 0);
        } else if self.rightControlLeftImgView?.frame.contains(point) == true {
            rotate = SCNAction.rotateBy(x: 0, y: -CGFloat(self.rotateSpeed), z: 0, duration: 0);
        } else if self.rightControlBottomImgView?.frame.contains(point) == true {
            rotate = SCNAction.rotateBy(x: -CGFloat(self.rotateSpeed), y: 0, z: 0, duration: 0);
        } else if self.rightControlRightImgView?.frame.contains(point) == true {
            rotate = SCNAction.rotateBy(x: 0, y: CGFloat(self.rotateSpeed), z: 0, duration: 0);
        } else if self.rightControlRightTopImgView?.frame.contains(point) == true {
            rotate = SCNAction.rotateBy(x: 0, y: 0, z: CGFloat(self.rotateSpeed), duration: 0);
        } else if self.rightControlRightBottomImgView?.frame.contains(point) == true {
            rotate = SCNAction.rotateBy(x: 0, y: 0, z: -CGFloat(self.rotateSpeed), duration: 0);
        }
        self.geometryNode?.runAction(rotate);
    }
    
    func doScale(point: CGPoint) {
        var scale: SCNVector3 = (self.geometryNode?.scale)!;
        if self.rightControlTopImgView?.frame.contains(point) == true {
            scale.y += self.scaleSpeed;
        } else if self.rightControlLeftImgView?.frame.contains(point) == true {
            scale.x -= self.scaleSpeed;
        } else if self.rightControlBottomImgView?.frame.contains(point) == true {
            scale.y -= self.scaleSpeed;
        } else if self.rightControlRightImgView?.frame.contains(point) == true {
            scale.x += self.scaleSpeed;
        } else if self.rightControlRightTopImgView?.frame.contains(point) == true {
            scale.z += self.scaleSpeed;
        } else if self.rightControlRightBottomImgView?.frame.contains(point) == true {
            scale.z -= self.scaleSpeed;
        }
        self.geometryNode?.scale = scale;
    }
    
//    @objc func longPressControlBoardView(longPress: UILongPressGestureRecognizer) {
//        let point = longPress.location(in: self);
//        
//    }
}


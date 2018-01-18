//
//  XHSSShapeModel.swift
//  ScnceKitTest
//
//  Created by Apple on 2017/12/28.
//  Copyright © 2017年 XiaoHai. All rights reserved.
//

import UIKit
import SceneKit

//SCNShape : UIBezierPath *path / CGFloat extrusionDepth / SCNChamferMode chamferMode / CGFloat chamferRadius /  UIBezierPath *chamferProfile

class XHSSShapeModel: XHSSObjectBaseModel {
    var path: UIBezierPath?;
    var extrusionDepth: CGFloat?;
    var chamferMode: SCNChamferMode?;
    var chamferRadius: CGFloat?;
    var chamferProfile: UIBezierPath?;
    
    override var geometry: SCNGeometry? {
        didSet {
            if let _ = geometry?.isKind(of: SCNShape.self) {
                let shape = geometry as! SCNShape;
                self.path = shape.path;
                self.extrusionDepth = shape.extrusionDepth;
                self.chamferMode = shape.chamferMode;
                self.chamferRadius = shape.chamferRadius;
                self.chamferProfile = shape.chamferProfile;
            }
        }
    }
    
    override func value(forKey key: String) -> Any? {
        switch key {
        case "path":
            return self.path;
        case "extrusionDepth":
            return self.extrusionDepth;
        case "chamferMode":
            return self.chamferMode;
        case "chamferRadius":
            return self.chamferRadius;
        case "chamferProfile":
            return self.chamferProfile;
        default:
            print("nor difined key \(key)");
            return key;
        }
    }
    
    override func setValue(_ value: Any?, forKey key: String) {
        let shape = self.geometry as? SCNShape;
        
        switch key {
        case "path":
            self.path = value as? UIBezierPath;
            shape?.path = self.path;
        case "extrusionDepth":
            self.extrusionDepth = value as? CGFloat;
            shape?.extrusionDepth = self.extrusionDepth!;
        case "chamferMode":
            self.chamferMode = value as? SCNChamferMode;
            shape?.chamferMode = self.chamferMode!;
        case "chamferRadius":
            self.chamferRadius = value as? CGFloat;
            shape?.chamferRadius = self.chamferRadius!;
        case "chamferProfile":
            self.chamferProfile = value as? UIBezierPath;
            shape?.chamferProfile = self.chamferProfile;
        default:
            print("nor difined key \(key)");
        }
    }
}

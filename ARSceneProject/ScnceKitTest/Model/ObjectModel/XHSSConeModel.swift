//
//  XHSSConeModel.swift
//  ScnceKitTest
//
//  Created by Apple on 2017/12/28.
//  Copyright © 2017年 XiaoHai. All rights reserved.
//

import UIKit
import SceneKit

//SCNCone : CGFloat topRadius / CGFloat bottomRadius / CGFloat height / NSInteger radialSegmentCount / NSInteger heightSegmentCount

class XHSSConeModel: XHSSObjectBaseModel {
    var topRadius: CGFloat?
    var bottomRadius: CGFloat?
    var height: CGFloat?
    var radialSegmentCount: NSInteger?
    var heightSegmentCount: NSInteger?
    
    override var geometry: SCNGeometry? {
        didSet {
            if let _ = geometry?.isKind(of: SCNCone.self) {
                let cone = geometry as! SCNCone;
                self.topRadius = cone.topRadius;
                self.bottomRadius = cone.bottomRadius;
                self.height = cone.height;
                self.radialSegmentCount = cone.radialSegmentCount;
                self.heightSegmentCount = cone.heightSegmentCount;
            }
        }
    }
    
    override func value(forKey key: String) -> Any? {
        switch key {
        case "topRadius":
            return self.topRadius;
        case "bottomRadius":
            return self.bottomRadius;
        case "height":
            return self.height;
        case "radialSegmentCount":
            return self.radialSegmentCount;
        case "heightSegmentCount":
            return self.heightSegmentCount;
        default:
            print("nor difined key \(key)");
            return key;
        }
    }
    
    override func setValue(_ value: Any?, forKey key: String) {
        let cone = self.geometry as? SCNCone;
        
        switch key {
        case "topRadius":
            self.topRadius = value as? CGFloat;
            cone?.topRadius = self.topRadius!;
        case "bottomRadius":
            self.bottomRadius = value as? CGFloat;
            cone?.bottomRadius = self.bottomRadius!;
        case "height":
            self.height = value as? CGFloat;
            cone?.height = self.height!;
        case "radialSegmentCount":
            self.radialSegmentCount = value as? NSInteger;
            cone?.radialSegmentCount = self.radialSegmentCount!;
        case "heightSegmentCount":
            self.heightSegmentCount = value as? NSInteger;
            cone?.heightSegmentCount = self.heightSegmentCount!;
        default:
            print("nor difined key \(key)");
        }
    }
}

//
//  XHSSCylinderModel.swift
//  ScnceKitTest
//
//  Created by Apple on 2017/12/28.
//  Copyright © 2017年 XiaoHai. All rights reserved.
//

import UIKit
import SceneKit

//SCNCylinder : CGFloat radius / CGFloat height / NSInteger radialSegmentCount / NSInteger heightSegmentCount

class XHSSCylinderModel: XHSSObjectBaseModel {
    var radius: CGFloat?
    var height: CGFloat?
    var radialSegmentCount: NSInteger?
    var heightSegmentCount: NSInteger?
    
    override var geometry: SCNGeometry? {
        didSet {
            if let _ = geometry?.isKind(of: SCNCylinder.self) {
                let cylinder = geometry as! SCNCylinder;
                self.radius = cylinder.radius;
                self.height = cylinder.height;
                self.radialSegmentCount = cylinder.radialSegmentCount;
                self.heightSegmentCount = cylinder.heightSegmentCount;
            }
        }
    }
    
    override func value(forKey key: String) -> Any? {
        switch key {
        case "radius":
            return self.radius;
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
        let cylinder = self.geometry as? SCNCylinder;
        
        switch key {
        case "radius":
            self.radius = value as? CGFloat;
            cylinder?.radius = self.radius!;
        case "height":
            self.height = value as? CGFloat;
            cylinder?.height = self.height!;
        case "radialSegmentCount":
            self.radialSegmentCount = value as? NSInteger;
            cylinder?.radialSegmentCount = self.radialSegmentCount!;
        case "heightSegmentCount":
            self.heightSegmentCount = value as? NSInteger;
            cylinder?.heightSegmentCount = self.heightSegmentCount!;
        default:
            print("nor difined key \(key)");
        }
    }
}

//
//  XHSSCapsuleModel.swift
//  ScnceKitTest
//
//  Created by Apple on 2017/12/28.
//  Copyright © 2017年 XiaoHai. All rights reserved.
//

import UIKit
import SceneKit

//SCNCapsule : CGFloat capRadius / CGFloat height / NSInteger radialSegmentCount / NSInteger heightSegmentCount / NSInteger capSegmentCount

class XHSSCapsuleModel: XHSSObjectBaseModel {
    var capRadius: CGFloat?
    var height: CGFloat?
    var radialSegmentCount: NSInteger?
    var heightSegmentCount: NSInteger?
    var capSegmentCount: NSInteger?
    
    override var geometry: SCNGeometry? {
        didSet {
            if let _ = geometry?.isKind(of: SCNCapsule.self) {
                let capsule = geometry as! SCNCapsule;
                self.capRadius = capsule.capRadius;
                self.height = capsule.height;
                self.radialSegmentCount = capsule.radialSegmentCount;
                self.heightSegmentCount = capsule.heightSegmentCount;
                self.capSegmentCount = capsule.capSegmentCount;
            }
        }
    }
    
    
    override func value(forKey key: String) -> Any? {
        switch key {
        case "capRadius":
            return self.capRadius;
        case "height":
            return self.height;
        case "radialSegmentCount":
            return self.radialSegmentCount;
        case "heightSegmentCount":
            return self.heightSegmentCount;
        case "capSegmentCount":
            return self.capSegmentCount;
        default:
            print("nor difined key \(key)");
            return key;
        }
    }
    
    override func setValue(_ value: Any?, forKey key: String) {
        let capsule = self.geometry as? SCNCapsule;
        
        switch key {
        case "capRadius":
            self.capRadius = value as? CGFloat;
            capsule?.capRadius = self.capRadius!;
        case "height":
            self.height = value as? CGFloat;
            capsule?.height = self.height!;
        case "radialSegmentCount":
            self.radialSegmentCount = value as? NSInteger;
            capsule?.radialSegmentCount = self.radialSegmentCount!;
        case "heightSegmentCount":
            self.heightSegmentCount = value as? NSInteger;
            capsule?.heightSegmentCount = self.heightSegmentCount!;
        case "capSegmentCount":
            self.capSegmentCount = value as? NSInteger;
            capsule?.capSegmentCount = self.capSegmentCount!;
        default:
            print("nor difined key \(key)");
        }
    }
}

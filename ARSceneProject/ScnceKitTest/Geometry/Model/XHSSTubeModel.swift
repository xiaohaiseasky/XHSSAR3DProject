//
//  XHSSTubeModel.swift
//  ScnceKitTest
//
//  Created by Apple on 2017/12/28.
//  Copyright © 2017年 XiaoHai. All rights reserved.
//

import UIKit
import SceneKit

//SCNTube : CGFloat innerRadius / CGFloat outerRadius / CGFloat height / NSInteger radialSegmentCount / NSInteger heightSegmentCount

class XHSSTubeModel: XHSSObjectBaseModel {
    var innerRadius: CGFloat?
    var outerRadius: CGFloat?
    var height: CGFloat?
    var radialSegmentCount: NSInteger?
    var heightSegmentCount: NSInteger?
    
    override var geometry: SCNGeometry? {
        didSet {
            if let _ = geometry?.isKind(of: SCNTube.self) {
                let tube = geometry as! SCNTube;
                self.innerRadius = tube.innerRadius;
                self.outerRadius = tube.outerRadius;
                self.height = tube.height;
                self.radialSegmentCount = tube.radialSegmentCount;
                self.heightSegmentCount = tube.heightSegmentCount;
            }
        }
    }
    
    override func value(forKey key: String) -> Any? {
        switch key {
        case "innerRadius":
            return self.innerRadius;
        case "outerRadius":
            return self.outerRadius;
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
        let tube = self.geometry as? SCNTube;
        
        switch key {
        case "innerRadius":
            self.innerRadius = value as? CGFloat;
            tube?.innerRadius = self.innerRadius!;
        case "outerRadius":
            self.outerRadius = value as? CGFloat;
            tube?.outerRadius = self.outerRadius!;
        case "height":
            self.height = value as? CGFloat;
            tube?.height = self.height!;
        case "radialSegmentCount":
            self.radialSegmentCount = value as? NSInteger;
            tube?.radialSegmentCount = self.radialSegmentCount!;
        case "heightSegmentCount":
            self.heightSegmentCount = value as? NSInteger;
            tube?.heightSegmentCount = self.heightSegmentCount!;
        default:
            print("nor difined key \(key)");
        }
    }
}

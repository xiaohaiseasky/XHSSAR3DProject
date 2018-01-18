//
//  XHSSTorusModel.swift
//  ScnceKitTest
//
//  Created by Apple on 2017/12/28.
//  Copyright © 2017年 XiaoHai. All rights reserved.
//

import UIKit
import SceneKit

//SCNTorus : CGFloat ringRadius / CGFloat pipeRadius / NSInteger ringSegmentCount / NSInteger pipeSegmentCount

class XHSSTorusModel: XHSSObjectBaseModel {
    var ringRadius: CGFloat?
    var pipeRadius: CGFloat?
    var ringSegmentCount: NSInteger?
    var pipeSegmentCount: NSInteger?
    
    override var geometry: SCNGeometry? {
        didSet {
            if let _ = geometry?.isKind(of: SCNTorus.self) {
                let torus = geometry as! SCNTorus;
                self.ringRadius = torus.ringRadius;
                self.pipeRadius = torus.pipeRadius;
                self.ringSegmentCount = torus.ringSegmentCount;
                self.pipeSegmentCount = torus.pipeSegmentCount;
            }
        }
    }
    
    override func value(forKey key: String) -> Any? {
        switch key {
        case "ringRadius":
            return self.ringRadius;
        case "pipeRadius":
            return self.pipeRadius;
        case "ringSegmentCount":
            return self.ringSegmentCount;
        case "pipeSegmentCount":
            return self.pipeSegmentCount;
        default:
            print("nor difined key \(key)");
            return key;
        }
    }
    
    
    
    override func setValue(_ value: Any?, forKey key: String) {
        let torus = self.geometry as? SCNTorus;
        
        switch key {
        case "ringRadius":
            self.ringRadius = value as? CGFloat;
            torus?.ringRadius = self.ringRadius!;
        case "pipeRadius":
            self.pipeRadius = value as? CGFloat;
            torus?.pipeRadius = self.pipeRadius!;
        case "ringSegmentCount":
            self.ringSegmentCount = value as? NSInteger;
            torus?.ringSegmentCount = self.ringSegmentCount!;
        case "pipeSegmentCount":
            self.pipeSegmentCount = value as? NSInteger;
            torus?.pipeSegmentCount = self.pipeSegmentCount!;
        default:
            print("nor difined key \(key)");
        }
    }
}

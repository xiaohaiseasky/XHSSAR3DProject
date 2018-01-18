//
//  XHSSPlaneModel.swift
//  ScnceKitTest
//
//  Created by Apple on 2017/12/28.
//  Copyright © 2017年 XiaoHai. All rights reserved.
//

import UIKit
import SceneKit

//SCNPlane : CGFloat width / CGFloat height / NSInteger widthSegmentCount / NSInteger heightSegmentCount / CGFloat cornerRadius / NSInteger cornerSegmentCount

class XHSSPlaneModel: XHSSObjectBaseModel {
    var width: CGFloat?
    var height: CGFloat?
    var widthSegmentCount: NSInteger?
    var heightSegmentCount: NSInteger?
    var cornerRadius: CGFloat?
    var cornerSegmentCount: NSInteger?
    
    override var geometry: SCNGeometry? {
        didSet {
            if let _ = geometry?.isKind(of: SCNPlane.self) {
                let plane = geometry as! SCNPlane;
                self.width = plane.width;
                self.height = plane.height;
                self.widthSegmentCount = plane.widthSegmentCount;
                self.heightSegmentCount = plane.heightSegmentCount;
                self.cornerRadius = plane.cornerRadius;
                self.cornerSegmentCount = plane.cornerSegmentCount;
            }
        }
    }
    
    override func value(forKey key: String) -> Any? {
        switch key {
        case "width":
            return self.width;
        case "height":
            return self.height;
        case "widthSegmentCount":
            return self.widthSegmentCount;
        case "heightSegmentCount":
            return self.heightSegmentCount;
        case "cornerRadius":
            return self.cornerRadius;
        case "cornerSegmentCount":
            return self.cornerSegmentCount;
        default:
            print("nor difined key \(key)");
            return key;
        }
    }
    
    override func setValue(_ value: Any?, forKey key: String) {
        let plane = self.geometry as? SCNPlane;
        switch key {
        case "width":
            self.width = value as? CGFloat;
            plane?.width = self.width!;
        case "height":
            self.height = value as? CGFloat;
            plane?.height = self.height!;
        case "widthSegmentCount":
            self.widthSegmentCount = value as? NSInteger;
            plane?.widthSegmentCount = self.widthSegmentCount!;
        case "heightSegmentCount":
            self.heightSegmentCount = value as? NSInteger;
            plane?.heightSegmentCount = self.heightSegmentCount!;
        case "cornerRadius":
            self.cornerRadius = value as? CGFloat;
            plane?.cornerRadius = self.cornerRadius!;
        case "cornerSegmentCount":
            self.cornerSegmentCount = value as? NSInteger;
            plane?.cornerSegmentCount = self.cornerSegmentCount!;
        default:
            print("nor difined key \(key)");
        }
    }
}

//
//  XHSSBoxModel.swift
//  ScnceKitTest
//
//  Created by Apple on 2017/12/28.
//  Copyright © 2017年 XiaoHai. All rights reserved.
//

import UIKit
import SceneKit

//SCNBox : CGFloat width / CGFloat height / CGFloat length / CGFloat chamferRadius / NSInteger widthSegmentCount / NSInteger heightSegmentCount / NSInteger lengthSegmentCount / NSInteger chamferSegmentCount

class XHSSBoxModel: XHSSObjectBaseModel {
    var width: CGFloat?
    var height: CGFloat?
    var length: CGFloat?
    var chamferRadius: CGFloat?
    var widthSegmentCount: NSInteger?
    var heightSegmentCount: NSInteger?
    var lengthSegmentCount: NSInteger?
    var chamferSegmentCount: NSInteger?
    
    override var geometry: SCNGeometry? {
        didSet {
            if let _ = geometry?.isKind(of: SCNBox.self) {
                let box = geometry as! SCNBox;
                self.width = box.width;
                self.height = box.height;
                self.length = box.length;
                self.chamferRadius = box.chamferRadius;
                self.widthSegmentCount = box.widthSegmentCount;
                self.heightSegmentCount = box.heightSegmentCount;
                self.lengthSegmentCount = box.lengthSegmentCount;
                self.chamferSegmentCount = box.chamferSegmentCount;
            }
        }
    }
    
    override func value(forKey key: String) -> Any? {
        switch key {
        case "width":
            return self.width;
        case "height":
            return self.height;
        case "length":
            return self.length;
        case "chamferRadius":
            return self.chamferRadius;
        case "widthSegmentCount":
            return self.widthSegmentCount;
        case "heightSegmentCount":
            return self.heightSegmentCount;
        case "lengthSegmentCount":
            return self.lengthSegmentCount;
        case "chamferSegmentCount":
            return self.chamferSegmentCount;
        default:
            print("nor difined key \(key)");
            return key;
        }
    }
    
    override func setValue(_ value: Any?, forKey key: String) {
        let box = self.geometry as? SCNBox;
        
        switch key {
        case "width":
            self.width = value as? CGFloat;
            box?.width = self.width!;
        case "height":
            self.height = value as? CGFloat;
            box?.height = self.height!;
        case "length":
            self.length = value as? CGFloat;
            box?.length = self.length!;
        case "chamferRadius":
            self.chamferRadius = value as? CGFloat;
            box?.chamferRadius = self.chamferRadius!;
        case "widthSegmentCount":
            self.widthSegmentCount = value as? NSInteger;
            box?.widthSegmentCount = self.widthSegmentCount!;
        case "heightSegmentCount":
            self.heightSegmentCount = value as? NSInteger;
            box?.heightSegmentCount = self.heightSegmentCount!;
        case "lengthSegmentCount":
            self.lengthSegmentCount = value as? NSInteger;
            box?.lengthSegmentCount = self.lengthSegmentCount!;
        case "chamferSegmentCount":
            self.chamferSegmentCount = value as? NSInteger;
            box?.chamferSegmentCount = self.chamferSegmentCount!;
        default:
            print("nor difined key \(key)");
        }
    }
}

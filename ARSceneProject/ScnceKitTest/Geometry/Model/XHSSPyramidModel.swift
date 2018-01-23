//
//  XHSSPyramidModel.swift
//  ScnceKitTest
//
//  Created by Apple on 2017/12/28.
//  Copyright © 2017年 XiaoHai. All rights reserved.
//

import UIKit
import SceneKit

//SCNPyramid : CGFloat width / CGFloat height / CGFloat length / NSInteger widthSegmentCount / NSInteger heightSegmentCount / NSInteger lengthSegmentCount

class XHSSPyramidModel: XHSSObjectBaseModel {
    var width: CGFloat?
    var height: CGFloat?
    var length: CGFloat?
    var widthSegmentCount: NSInteger?
    var heightSegmentCount: NSInteger?
    var lengthSegmentCount: NSInteger?
    
    override var geometry: SCNGeometry? {
        didSet {
            if let _ = geometry?.isKind(of: SCNPyramid.self) {
                let pyramid = geometry as! SCNPyramid;
                self.width = pyramid.width;
                self.height = pyramid.height;
                self.length = pyramid.length;
                self.widthSegmentCount = pyramid.widthSegmentCount;
                self.heightSegmentCount = pyramid.heightSegmentCount;
                self.lengthSegmentCount = pyramid.lengthSegmentCount;
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
        case "widthSegmentCount":
            return self.widthSegmentCount;
        case "heightSegmentCount":
            return self.heightSegmentCount;
        case "lengthSegmentCount":
            return self.lengthSegmentCount;
        default:
            print("nor difined key \(key)");
            return key;
        }
    }
    
    override func setValue(_ value: Any?, forKey key: String) {
        let pyramid = self.geometry as? SCNPyramid;
        
        switch key {
        case "width":
            self.width = value as? CGFloat;
            pyramid?.width = self.width!;
        case "height":
            self.height = value as? CGFloat;
            pyramid?.height = self.height!;
        case "length":
            self.length = value as? CGFloat;
            pyramid?.length = self.length!;
        case "widthSegmentCount":
            self.widthSegmentCount = value as? NSInteger;
            pyramid?.widthSegmentCount = self.widthSegmentCount!;
        case "heightSegmentCount":
            self.heightSegmentCount = value as? NSInteger;
            pyramid?.heightSegmentCount = self.heightSegmentCount!;
        case "lengthSegmentCount":
            self.lengthSegmentCount = value as? NSInteger;
            pyramid?.lengthSegmentCount = self.lengthSegmentCount!;
        default:
            print("nor difined key \(key)");
        }
    }
}

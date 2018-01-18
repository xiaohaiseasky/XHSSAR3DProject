//
//  XHSSFloorModel.swift
//  ScnceKitTest
//
//  Created by Apple on 2017/12/28.
//  Copyright © 2017年 XiaoHai. All rights reserved.
//

import UIKit
import SceneKit

//SCNFloor : CGFloat reflectivity / CGFloat reflectionFalloffStart / CGFloat reflectionFalloffEnd / NSUInteger reflectionCategoryBitMask API_AVAILABLE(ios(10.0)) / CGFloat width API_AVAILABLE(ios(10.0)) / CGFloat length API_AVAILABLE(ios(10.0)) / CGFloat reflectionResolutionScaleFactor

class XHSSFloorModel: XHSSObjectBaseModel {
    var reflectivity: CGFloat?
    var reflectionFalloffStart: CGFloat?
    var reflectionFalloffEnd: CGFloat?
    var reflectionCategoryBitMask: NSInteger?
    var width: CGFloat?
    var length: CGFloat?
    var reflectionResolutionScaleFactor: CGFloat?
    
    override var geometry: SCNGeometry? {
        didSet {
            if let _ = geometry?.isKind(of: SCNFloor.self) {
                let floor = geometry as! SCNFloor;
                self.reflectivity = floor.reflectivity;
                self.reflectionFalloffStart = floor.reflectionFalloffStart;
                self.reflectionFalloffEnd = floor.reflectionFalloffEnd;
                self.reflectionCategoryBitMask = floor.reflectionCategoryBitMask;
                self.width = floor.width;
                self.length = floor.length;
                self.reflectionResolutionScaleFactor = floor.reflectionResolutionScaleFactor;
            }
        }
    }
    
    override func value(forKey key: String) -> Any? {
        switch key {
        case "reflectivity":
            return self.reflectivity;
        case "reflectionFalloffStart":
            return self.reflectionFalloffStart;
        case "reflectionFalloffEnd":
            return self.reflectionFalloffEnd;
        case "reflectionCategoryBitMask":
            return self.reflectionCategoryBitMask;
        case "width":
            return self.width;
        case "length":
            return self.length;
        case "reflectionResolutionScaleFactor":
            return self.reflectionResolutionScaleFactor;
        default:
            print("nor difined key \(key)");
            return key;
        }
    }
    
    override func setValue(_ value: Any?, forKey key: String) {
        let floor = self.geometry as? SCNFloor;
        
        switch key {
        case "reflectivity":
            self.reflectivity = value as? CGFloat;
            floor?.reflectivity = self.reflectivity!;
        case "reflectionFalloffStart":
            self.reflectionFalloffStart = value as? CGFloat;
            floor?.reflectionFalloffStart = self.reflectionFalloffStart!;
        case "reflectionFalloffEnd":
            self.reflectionFalloffEnd = value as? CGFloat;
            floor?.reflectionFalloffEnd = self.reflectionFalloffEnd!;
        case "reflectionCategoryBitMask":
            self.reflectionCategoryBitMask = value as? NSInteger;
            floor?.reflectionCategoryBitMask = self.reflectionCategoryBitMask!;
        case "width":
            self.width = value as? CGFloat;
            floor?.width = self.width!;
        case "length":
            self.length = value as? CGFloat;
            floor?.length = self.length!;
        case "reflectionResolutionScaleFactor":
            self.reflectionResolutionScaleFactor = value as? CGFloat;
            floor?.reflectionResolutionScaleFactor = self.reflectionResolutionScaleFactor!;
        default:
            print("nor difined key \(key)");
        }
    }
}

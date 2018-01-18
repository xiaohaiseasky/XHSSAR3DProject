//
//  XHSSSphereModel.swift
//  ScnceKitTest
//
//  Created by Apple on 2017/12/28.
//  Copyright © 2017年 XiaoHai. All rights reserved.
//

import UIKit
import SceneKit

//SCNSphere : CGFloat radius /  BOOL geodesic / NSInteger segmentCount

class XHSSSphereModel: XHSSObjectBaseModel {
    var radius: CGFloat?
    var geodesic: Bool?
    var segmentCount: NSInteger?
    
    override var geometry: SCNGeometry? {
        didSet {
            if let _ = geometry?.isKind(of: SCNSphere.self) {
                let sphere = geometry as! SCNSphere;
                self.radius = sphere.radius;
                self.geodesic = sphere.isGeodesic;
                self.segmentCount = sphere.segmentCount;
            }
        }
    }
    
    override func value(forKey key: String) -> Any? {
        switch key {
        case "radius":
            return self.radius;
        case "geodesic":
            return self.geodesic;
        case "segmentCount":
            return self.segmentCount;
        default:
            print("nor difined key \(key)");
            return key;
        }
    }
    
    override func setValue(_ value: Any?, forKey key: String) {
        let sphere = self.geometry as? SCNSphere;
        
        switch key {
        case "radius":
            self.radius = value as? CGFloat;
            sphere?.radius = self.radius!;
        case "geodesic":
            self.geodesic = value as? Bool;
            sphere?.isGeodesic = self.geodesic!;
        case "segmentCount":
            self.segmentCount = value as? NSInteger;
            sphere?.segmentCount = self.segmentCount!;
        default:
            print("nor difined key \(key)");
        }
    }
}

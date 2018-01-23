//
//  XHSSTextModel.swift
//  ScnceKitTest
//
//  Created by Apple on 2017/12/28.
//  Copyright © 2017年 XiaoHai. All rights reserved.
//

import UIKit
import SceneKit

//SCNText : CGFloat extrusionDepth / id string / UIFont *font / BOOL wrapped / CGRect containerFrame / NSString *truncationMode / NSString *alignmentMode / CGFloat chamferRadius / UIBezierPath *chamferProfile / CGFloat flatness

class XHSSTextModel: XHSSObjectBaseModel {
    var extrusionDepth: CGFloat?
    var string: Any?
    var font: UIFont?
    var wrapped: Bool?
    var containerFrame: CGRect?
    var truncationMode: String?
    var alignmentMode: String?
    var chamferRadius: CGFloat?
    var chamferProfile: UIBezierPath?
    var flatness: CGFloat?
    
    override var geometry: SCNGeometry? {
        didSet {
            if let _ = geometry?.isKind(of: SCNText.self) {
                let text = geometry as! SCNText;
                self.extrusionDepth = text.extrusionDepth;
                self.string = text.string;
                self.font = text.font;
                self.wrapped = text.isWrapped;
                self.containerFrame = text.containerFrame;
                self.truncationMode = text.truncationMode;
                self.alignmentMode = text.alignmentMode;
                self.chamferRadius = text.chamferRadius;
                self.chamferProfile = text.chamferProfile;
                self.flatness = text.flatness;
            }
        }
    }
    
    override func value(forKey key: String) -> Any? {
        switch key {
        case "extrusionDepth":
            return self.extrusionDepth;
        case "string":
            return self.string;
        case "font":
            return self.font;
        case "wrapped":
            return self.wrapped;
        case "containerFrame":
            return self.containerFrame;
        case "truncationMode":
            return self.truncationMode;
        case "alignmentMode":
            return self.alignmentMode;
        case "chamferRadius":
            return self.chamferRadius;
        case "chamferProfile":
            return self.chamferProfile;
        case "flatness":
            return self.flatness;
        default:
            print("nor difined key \(key)");
            return key;
        }
    }
    
    override func setValue(_ value: Any?, forKey key: String) {
        let text = self.geometry as? SCNText;
        
        switch key {
        case "extrusionDepth":
            self.extrusionDepth = value as? CGFloat;
            text?.extrusionDepth = self.extrusionDepth!;
        case "string":
            self.string = value as? CGFloat;
            text?.string = self.string;
        case "font":
            self.font = value as? UIFont;
            text?.font = self.font;
        case "wrapped":
            self.wrapped = value as? Bool;
            text?.isWrapped = self.wrapped!;
        case "containerFrame":
            self.containerFrame = value as? CGRect;
            text?.containerFrame = self.containerFrame!;
        case "truncationMode":
            self.truncationMode = value as? String;
            text?.truncationMode = self.truncationMode!;
        case "alignmentMode":
            self.alignmentMode = value as? String;
            text?.alignmentMode = self.alignmentMode!;
        case "chamferRadius":
            self.chamferRadius = value as? CGFloat;
            text?.chamferRadius = self.chamferRadius!;
        case "chamferProfile":
            self.chamferProfile = value as? UIBezierPath;
            text?.chamferProfile = self.chamferProfile;
        case "flatness":
            self.flatness = value as? CGFloat;
            text?.flatness = self.flatness!;
        default:
            print("nor difined key \(key)");
        }
    }
}

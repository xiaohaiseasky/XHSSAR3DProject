//
//  XHSSMaterialPropertyModel.swift
//  ScnceKitTest
//
//  Created by Apple on 2018/1/19.
//  Copyright © 2018年 XiaoHai. All rights reserved.
//

import UIKit
import SceneKit

class XHSSMaterialPropertyModel: NSObject {
    
    var contents: Any?;
    var intensity: CGFloat?;
    var minificationFilter: SCNFilterMode?;
    var magnificationFilter: SCNFilterMode?;
    var mipFilter: SCNFilterMode?;
    
    var contentsTransform: SCNMatrix4?;
    var wrapS: SCNWrapMode?;
    var wrapT: SCNWrapMode?;
    var borderColor: Any?;
    var mappingChannel: NSInteger?;
    
    var textureComponents: SCNColorMask?;
    var maxAnisotropy: CGFloat?;
}

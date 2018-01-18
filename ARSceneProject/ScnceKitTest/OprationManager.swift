//
//  OprationManager.swift
//  ScnceKitTest
//
//  Created by Apple on 2017/12/22.
//  Copyright © 2017年 XiaoHai. All rights reserved.
//

import UIKit
import SceneKit

class XHSSObjectTransformInfoModel: NSObject {
    
}

class XHSSNodeInfoModel: NSObject {
    var nodeCalssName: String?
    var nodeClass: AnyClass?
    
    var nodeGeometryModel: XHSSObjectBaseModel?
    var nodeTransformInfoModel: XHSSObjectTransformInfoModel?;
    
    var childNodes: [XHSSNodeInfoModel] = [];
    
    
    
    var node: SCNNode?
    var scene: SCNScene?;
}
/*
 场景
 相机
 灯光
 
 模型
 贴图
 
 动画
 
 物理
 粒子特效
 
 传感器 coreMotion、Vision
 */

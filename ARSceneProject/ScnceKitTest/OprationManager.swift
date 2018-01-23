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
    var geometryCalssName: String?                  // 节点类名
    var geometryClass: SCNGeometry?                 // 节点类
    
    var nodeGeometryModel: XHSSObjectBaseModel?;    // 节点属性信息
    var transform: SCNMatrix4? = SCNMatrix4Identity;                     // 位置信息
    var materials: [XHSSMaterialBaseModel] = [];    // 材质信息
    var childNodes: [XHSSNodeInfoModel] = [];       // 子节点
    var parentNode: XHSSNodeInfoModel?;             // 父节点
    
    
    
    
    var node: SCNNode?
    var scene: SCNScene?;
    
    
    
    
    
    override init() {
        super.init()
    }
    
    // MARK:- 处理需要归档的字段
    func encode(with aCoder:NSCoder) {
        aCoder.encode(geometryCalssName, forKey:"geometryCalssName")
        aCoder.encode(geometryClass, forKey:"geometryClass")
        aCoder.encode(transform, forKey:"transform")
        aCoder.encode(materials, forKey:"materials") ///
        aCoder.encode(nodeGeometryModel, forKey:"nodeGeometryModel") ///
        aCoder.encode(childNodes, forKey:"childNodes") ///
    }
    
    // MARK:- 处理需要解档的字段
    required init(coder aDecoder:NSCoder) {
        super.init()
        geometryCalssName = aDecoder.decodeObject(forKey:"geometryCalssName") as? String;
        geometryClass = aDecoder.decodeObject(forKey:"geometryClass") as? SCNGeometry;
        transform = aDecoder.decodeObject(forKey:"transform") as? SCNMatrix4;
        materials = (aDecoder.decodeObject(forKey:"materials") as? [XHSSMaterialBaseModel])!;
        nodeGeometryModel = aDecoder.decodeObject(forKey:"nodeGeometryModel") as? XHSSObjectBaseModel;
        childNodes = (aDecoder.decodeObject(forKey:"childNodes") as? [XHSSNodeInfoModel])!
    }
}


extension XHSSNodeInfoModel {
    static func createGeometryNode(refInfo: XHSSNodeInfoModel) -> SCNNode {
//        var clazz: SCNGeometry = refInfo.geometryClass ?? SCNGeometry.self();
        
        let node = SCNNode();
        
        switch refInfo.geometryClass {
        case is SCNPlane:
            let planGeometry = SCNPlane();
            node.geometry = planGeometry;
            refInfo.nodeGeometryModel = XHSSPlaneModel();
            refInfo.nodeGeometryModel?.geometry = planGeometry;
        default:
            print("invalide SCNGeometryCalss");
        }
        
        node.transform = refInfo.transform!;
//        node.geometry?.materials = refInfo.materials;
        return node;
    }
}

extension XHSSNodeInfoModel: NSCoding {
    struct WlPlayerkey {
        static  let  playerpath="/players.data"
    }
    
    //得到沙盒路径存到缓存中
    func getfilepath() -> String {
        let  cachespath: String = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0];
        let  path: String =  cachespath.appending(WlPlayerkey.playerpath);
        return  path;
    }
    
    //保存归档
    func saveObject(object: XHSSNodeInfoModel?) -> Bool {
        guard object != nil else {
            return false;
        }
        return   NSKeyedArchiver.archiveRootObject(object!, toFile:getfilepath())
    }
    
    //获取物体解档后的 data 数据
    func getObjectData() -> XHSSNodeInfoModel {
        let data = NSKeyedUnarchiver.unarchiveObject(withFile: getfilepath())as! XHSSNodeInfoModel;
        return data;
    }
    
    func getObject() -> SCNGeometry {
        return SCNGeometry();
    }

    //多个对象的存储使用解档归档 ， 轻量级 存储数据（的对象必须实现nscoding 两个方法，实际上才能  把 你的对象转成nsdata 类型的）```
    // * swift归档中可能会遇到的小坑
    // 针对enum类型的归档,需要在归档的时候需要使用rawvalue(type)，不能直接使用enum类型直接归档,解档需要将其取出构造enum类型的,就是注意类型转换的问题.
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

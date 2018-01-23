//
//  XHSSMaterialModel.swift
//  ScnceKitTest
//
//  Created by Apple on 2018/1/19.
//  Copyright © 2018年 XiaoHai. All rights reserved.
//

import UIKit
import SceneKit

class XHSSMaterialModel: XHSSMaterialBaseModel {
    
    var diffuse: SCNMaterialProperty?;
    var ambient: SCNMaterialProperty?;
    var specular: SCNMaterialProperty?;
    var emission: SCNMaterialProperty?;
    var transparent: SCNMaterialProperty?;
    
    var reflective: SCNMaterialProperty?;
    var multiply: SCNMaterialProperty?;
    var normal: SCNMaterialProperty?;
    var displacement: SCNMaterialProperty?;
    var ambientOcclusion: SCNMaterialProperty?;
    
    var selfIllumination: SCNMaterialProperty?;
    var metalness: SCNMaterialProperty?;
    var roughness: SCNMaterialProperty?;
    var shininess: CGFloat?;
    var transparency: CGFloat?;
    
    var lightingModelName: SCNMaterial.LightingModel?;
    var litPerPixel: Bool?;
    var doubleSided: Bool?;
    var fillMode: SCNFillMode?;
    var cullMode: SCNCullMode?;
    
    var transparencyMode: SCNTransparencyMode?;
    var locksAmbientWithDiffuse: Bool?;
    var writeToDepthBuffer: Bool?;
    var colorBufferWriteMask: SCNColorMask?;
    var readsFromDepthBuffer: Bool?;
    
    var fresnelExponent: CGFloat?;
    var blendMode: SCNBlendMode?;
    
    
    
    override var geometry: SCNGeometry? {
        didSet {
            let material = self.geometry?.materials.last;
            self.diffuse = material?.diffuse;
            self.ambient = material?.ambient;
            self.specular = material?.specular;
            self.emission = material?.emission;
            self.transparent = material?.transparent;
            
            self.reflective = material?.reflective;
            self.multiply = material?.multiply;
            self.normal = material?.normal;
            self.displacement = material?.displacement;
            self.ambientOcclusion = material?.ambientOcclusion;
            
            self.selfIllumination = material?.selfIllumination;
            self.metalness = material?.metalness;
            self.roughness = material?.roughness;
            self.shininess = material?.shininess;
            self.transparency = material?.transparency;
            
            self.lightingModelName = material?.lightingModel;
            self.litPerPixel = material?.isLitPerPixel;
            self.doubleSided = material?.isDoubleSided;
            self.fillMode = material?.fillMode;
            self.cullMode = material?.cullMode;
            
            self.transparencyMode = material?.transparencyMode;
            self.locksAmbientWithDiffuse = material?.locksAmbientWithDiffuse;
            self.writeToDepthBuffer = material?.writesToDepthBuffer;
            self.colorBufferWriteMask = material?.colorBufferWriteMask;
            self.readsFromDepthBuffer = material?.readsFromDepthBuffer;
            
            self.fresnelExponent = material?.fresnelExponent;
            self.blendMode = material?.blendMode;
        }
    }
}

extension XHSSMaterialModel {
    func materialBySelf() -> SCNMaterial {
        let material: SCNMaterial = SCNMaterial();
        return material;
    }
}

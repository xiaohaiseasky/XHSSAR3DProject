//
//  XHSSMaterialOprationUI.swift
//  ScnceKitTest
//
//  Created by Apple on 2018/1/4.
//  Copyright © 2018年 XiaoHai. All rights reserved.
//

import UIKit
import SceneKit

class XHSSMaterialOprationUI: UIView {

    typealias XHSSObjectOprationUIObjectConfigMetarialCallBack = (SCNMaterial) -> ();
    var configMetarialCallBack: XHSSObjectOprationUIObjectConfigMetarialCallBack?;
    
    
    // MARK: - data varables
    var material: SCNMaterial? = SCNMaterial();
    
    
    // MARK: - view varables
    var materialPropertyTableView: UITableView?
    var materialSubPropertyTableView: UITableView?
    var finishBtn: UIButton?;
    
    
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        setupUI();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupUI() {
        setupView();
    }
}

// MARK: - DATA SOURCE VRIBLE
extension XHSSMaterialOprationUI {
    
    var metarialPropertyNameArr: [String] {
        get {
            return ["diffuse", "ambient", "specular", "emission", "transparent",
                    "reflective", "multiply", "normal", "displacement", "ambientOcclusion",
                    "selfIllumination", "metalness", "roughness", "shininess", "transparency",
                    "lightingModelName", "litPerPixel", "doubleSided", "fillMode", "cullMode",
                    "transparencyMode", "locksAmbientWithDiffuse", "writeToDepthBuffer", "colorBufferWriteMask", "readsFromDepthBuffer",
                    "fresnelExponent", "blendMode"];
        }
    }
    var metarialPropertyTypeArr: [String] {
        get {
            return ["SCNMaterialProperty", "SCNMaterialProperty", "SCNMaterialProperty", "SCNMaterialProperty", "SCNMaterialProperty",
                    "SCNMaterialProperty", "SCNMaterialProperty", "SCNMaterialProperty", "SCNMaterialProperty", "SCNMaterialProperty",
                    "SCNMaterialProperty", "SCNMaterialProperty", "SCNMaterialProperty", "CGFloat", "CGFloat",
                    "SCNMaterial.LightingModel", "Bool", "Bool", "SCNFillMode", "SCNCullMode",
                    "SCNTransparencyMode", "Bool", "Bool", "SCNColorMask", "Bool",
                    "CGFloat", "SCNBlendMode"];
        }
    }
    var metarialPropertyTitleArr: [String] {
        get {
            return ["漫反射贴图", "环境贴图", "高光贴图", "发光贴图", "透明贴图",
                    "反射贴图", "正片叠底贴图", "法线贴图", "displacement", "闭塞贴图",
                    "selfIllumination", "metalness", "roughness", "shininess", "transparency",
                    "lightingModelName", "litPerPixel", "doubleSided", "fillMode", "cullMode",
                    "transparencyMode", "locksAmbientWithDiffuse", "writeToDepthBuffer", "colorBufferWriteMask", "readsFromDepthBuffer",
                    "fresnelExponent", "blendMode"];
        }
    }
    
    
    /////////////////////////////////////////////////////////////
    
    
    var metarialSubPropertyNameArr: [String] {
        get {
            return ["contents", "intensity", "minificationFilter", "magnificationFilter", "mipFilter",
                    "contentsTransform", "wrapS", "wrapT", "borderColor", "mappingChannel",
                    "textureComponents", "maxAnisotropy"];
        }
    }
    var metarialSubPropertyTypeArr: [String] {
        get {
            return ["id", "CGFloat", "SCNFilterMode", "SCNFilterMode", "SCNFilterMode",
                    "SCNMatrix4", "SCNWrapMode", "SCNWrapMode", "id", "NSInteger",
                    "SCNColorMask", "CGFloat"];
        }
    }
    var metarialSubPropertyTitleArr: [String] {
        get {
            return ["内容", "强度", "SCNFilterMode", "SCNFilterMode", "SCNFilterMode",
                    "SCNMatrix4", "SCNWrapMode", "SCNWrapMode", "边框颜色", "NSInteger",
                    "SCNColorMask", "CGFloat"];
        }
    }
    
    
}


// MARK: - UI
extension XHSSMaterialOprationUI {
    func setupView() {
        
        self.materialPropertyTableView = UITableView();
        self.materialPropertyTableView?.backgroundColor = UIColor(white: 0, alpha: 0.7);
        self.materialPropertyTableView?.separatorStyle = .none;
        self.materialPropertyTableView?.delegate = self;
        self.materialPropertyTableView?.dataSource = self;
        self.materialPropertyTableView?.register(XHSSObjectTipCell.self, forCellReuseIdentifier: "XHSSObjectTipCell");
        self.addSubview(self.materialPropertyTableView!);
        
        self.materialSubPropertyTableView = UITableView();
        self.materialSubPropertyTableView?.backgroundColor = UIColor(white: 0, alpha: 0.7);
        self.materialSubPropertyTableView?.separatorStyle = .none;
        self.materialSubPropertyTableView?.delegate = self;
        self.materialSubPropertyTableView?.dataSource = self;
        self.materialSubPropertyTableView?.register(XHSSObjectTipCell.self, forCellReuseIdentifier: "XHSSObjectTipCell");
        self.addSubview(self.materialSubPropertyTableView!);
        
        self.finishBtn = UIButton(type: .custom);
        self.finishBtn?.backgroundColor = UIColor.blue;
        self.finishBtn?.setTitle("FINISH", for: .normal);
        self.finishBtn?.addTarget(self, action: #selector(XHSSMaterialOprationUI.finishBtnColick), for: .touchUpInside);
        self.addSubview(self.finishBtn!);
    }
    
    
    // MARK: - layout
    override func layoutSubviews() {
        self.materialPropertyTableView?
            .topEqualToNum(0)
            .leftEqualToNum(0)
            .bottomEqualToNum(0)
            .widthEqualToNum(100)
            .clearWarning();
        
        self.finishBtn?
            .leftEqualToNum(0)
            .rightEqualToNum(0)
            .heightEqualToNum(30)
            .bottomAligmentToNum(0)
            .clearWarning();
        
        self.materialSubPropertyTableView?
            .leftDistance(0).toLeftRefView(self.materialPropertyTableView!)
            .topEqualToNum(0)
            .bottomDistance(0).toBottomRefView(self.finishBtn!)
            .rightEqualToNum(0)
            .clearWarning();
    }
}

/**
 Action
 */
extension XHSSMaterialOprationUI {
    // MARK: - action
    @objc func finishBtnColick() {
        self.configMetarialCallBack?(self.material!);
        self.removeFromSuperview();
    }
}

/**
 TableView
 */
extension XHSSMaterialOprationUI: UITableViewDelegate, UITableViewDataSource {
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView === self.materialPropertyTableView {
            /// *** here only deal with SCNMaterialProperty type , but have other also ***
            self.materialSubPropertyTableView?.reloadData();
        } else {
            switch indexPath.row {
            case 0:
                print("内容 : indexPath row \(indexPath.row)");
                let contentEditView = XHSSMaterialContentEditView();
                contentEditView.show(inView: self, finishCallBack: { (content) in
                    self.material?.diffuse.contents = content;
                });
            case 1:
                print("强度 : indexPath row \(indexPath.row)");
            case 2:
                print("indexPath row \(indexPath.row)");
            case 3:
                print("indexPath row \(indexPath.row)");
            case 4:
                print("indexPath row \(indexPath.row)");
            case 5:
                print("indexPath row \(indexPath.row)");
            case 6:
                print("indexPath row \(indexPath.row)");
            case 7:
                print("indexPath row \(indexPath.row)");
            case 8:
                print("indexPath row \(indexPath.row)");
            case 9:
                print("indexPath row \(indexPath.row)");
            case 10:
                print("indexPath row \(indexPath.row)");
            case 11:
                print("indexPath row \(indexPath.row)");
            case 12:
                print("indexPath row \(indexPath.row)");
            default :
                print("invalide indexPath row");
            }
        }
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView === self.materialPropertyTableView {
            return self.metarialPropertyTitleArr.count;
        } else {
            return self.metarialSubPropertyTitleArr.count;
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: XHSSObjectBaseTVCell?;
        if tableView === self.materialPropertyTableView {
            cell = tableView.dequeueReusableCell(withIdentifier: "XHSSObjectTipCell") as? XHSSObjectBaseTVCell;
            let cellModel = XHXXObjectCellModel();
            cellModel.title = self.metarialPropertyTitleArr[indexPath.row];
            cell?.cellModel = cellModel;
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "XHSSObjectTipCell") as? XHSSObjectBaseTVCell;
            let cellModel = XHXXObjectCellModel();
            cellModel.title = self.metarialSubPropertyTitleArr[indexPath.row];
            cell?.cellModel = cellModel;
        }
        
        return cell!;
    }
}

/**
 Public
 */
extension XHSSMaterialOprationUI {
    // MARK: - PUBLIC
    static func show(inView superView: UIView, geometryNode: SCNNode, configMetarialCallBack: @escaping XHSSObjectOprationUIObjectConfigMetarialCallBack) {
        let materialUI = XHSSMaterialOprationUI(frame: superView.bounds);
        superView.addSubview(materialUI);
        materialUI.configMetarialCallBack = configMetarialCallBack;
    }
}




    
/*
 /*!
 This can be
 a color (NSColor, UIColor, CGColorRef),
 an image (NSImage, UIImage, CGImageRef),
 a layer (CALayer), a path (NSString or NSURL),
 a SpriteKit scene (SKScene),
 a texture (SKTexture, id<MTLTexture> or GLKTextureInfo),
 a floating value between 0 and 1 (NSNumber) for metalness and roughness properties.
 
 Animatable when set to a color.
 A NSArray of 6 images. This array must contain images of the exact same dimensions, in the following order, in a left-handed coordinate system: +X, -X, +Y, -Y, +Z, -Z (or Right, Left, Top, Bottom, Front, Back).
 */
 // id contents;
 
 
 /*!
 Default value is 1.0. Animatable.
 */
 // CGFloat intensity API_AVAILABLE(macos(10.9));
 
 
 /*!
 Defaults to SCNFilterModeLinear.
 */
 // SCNFilterMode minificationFilter;
 
 
 /*!
 Defaults to SCNFilterModeLinear.
 */
 // SCNFilterMode magnificationFilter;
 
 
 /*!
 Defaults to SCNFilterModeNone on iOS 9 or earlier, SCNFilterModeNearest starting in iOS 10.
 */
 // SCNFilterMode mipFilter;
 
 
 /*!
 Animatable.
 */
 // SCNMatrix4 contentsTransform;
 
 
 /*!
 Defaults to SCNWrapModeClamp.
 */
 // SCNWrapMode wrapS;
 
 
 /*!
 Defaults to SCNWrapModeClamp.
 */
 // SCNWrapMode wrapT;
 
 
 /*!
 Animatable.
 The border color is ignored on iOS and is always considered as clear color (0,0,0,0) when the texture has an alpha channel and opaque back (0,0,0,1) otherwise.
 */
 // id borderColor API_DEPRECATED("Deprecated", macos(10.8, 10.12), ios(8.0, 10.0)) API_UNAVAILABLE(watchos, tvos);
 
 
 /*!
 Defaults to 0.
 */
 // NSInteger mappingChannel;
 
 
 /*!
 Defaults to SCNColorMaskRed for displacement property, and to SCNColorMaskAll for other properties.
 Use this property to when using a texture that combine multiple informations in the different texture components. For
 */
 // SCNColorMask textureComponents API_AVAILABLE(macos(10.13), ios(11.0), tvos(11.0), watchos(4.0));
 
 
 /*!
 Defaults to 1.0.
 */
 // CGFloat maxAnisotropy API_AVAILABLE(macos(10.9));
 */


    /*
     /*!
     @property name
     @abstract Determines the name of the receiver.
     */
     open var name: String?
     
     
     // MARK: - Material Properties
     
     /*!
     @property diffuse
     @abstract Specifies the receiver's diffuse property.
     @discussion The diffuse property specifies the amount of light diffusely reflected from the surface. The diffuse light is reflected equally in all directions and is therefore independent of the point of view.
     */
     open var diffuse: SCNMaterialProperty { get }
     
     
     /*!
     @property ambient
     @abstract Specifies the receiver's ambient property.
     @discussion The ambient property specifies the amount of ambient light to reflect. This property has no visual impact on scenes that have no ambient light. Setting the ambient has no effect if locksAmbientWithDiffuse is set to YES.
     */
     open var ambient: SCNMaterialProperty { get }
     
     
     /*!
     @property specular
     @abstract Specifies the receiver's specular property.
     @discussion The specular property specifies the amount of light to reflect in a mirror-like manner. The specular intensity increases when the point of view lines up with the direction of the reflected light.
     */
     open var specular: SCNMaterialProperty { get }
     
     
     /*!
     @property emission
     @abstract The emission property specifies the amount of light the material emits. This emission does not light up other surfaces in the scene.
     */
     open var emission: SCNMaterialProperty { get }
     
     
     /*!
     @property transparent
     @abstract The transparent property specifies the transparent areas of the material.
     */
     open var transparent: SCNMaterialProperty { get }
     
     
     /*!
     @property reflective
     @abstract The reflective property specifies the reflectivity of the surface. The surface will not actually reflect other objects in the scene. This property may be used as a sphere mapping to reflect a precomputed environment.
     */
     open var reflective: SCNMaterialProperty { get }
     
     
     /*!
     @property multiply
     @abstract The multiply property specifies a color or an image used to multiply the output fragments with. The computed fragments are multiplied with the multiply value to produce the final fragments. This property may be used for shadow maps, to fade out or tint 3d objects.
     */
     open var multiply: SCNMaterialProperty { get }
     
     
     /*!
     @property normal
     @abstract The normal property specifies the surface orientation.
     @discussion When an image is set on the normal property the material is automatically lit per pixel. Setting a color has no effect.
     */
     open var normal: SCNMaterialProperty { get }
     
     
     /*!
     @property displacement
     @abstract <TODO>
     @discussion <TODO, Needs tessellation>
     */
     @available(iOS 11.0, *)
     open var displacement: SCNMaterialProperty { get }
     
     
     /*!
     @property ambientOcclusion
     @abstract The ambientOcclusion property specifies the ambient occlusion of the surface. The ambient occlusion is multiplied with the ambient light, then the result is added to the lighting contribution. This property has no visual impact on scenes that have no ambient light. When an ambient occlusion map is set, the ambient property is ignored.
     */
     @available(iOS 9.0, *)
     open var ambientOcclusion: SCNMaterialProperty { get }
     
     
     /*!
     @property selfIllumination
     @abstract The selfIllumination property specifies a texture or a color that is added to the lighting contribution of the surface. When a selfIllumination is set, the emission property is ignored.
     */
     @available(iOS 9.0, *)
     open var selfIllumination: SCNMaterialProperty { get }
     
     
     /*!
     @property metalness
     @abstract The metalness property specifies how metallic the material's surface appears. Lower values (darker colors) cause the material to appear more like a dielectric surface. Higher values (brighter colors) cause the surface to appear more metallic. This property is only used when 'lightingModelName' is 'SCNLightingModelPhysicallyBased'.
     */
     @available(iOS 10.0, *)
     open var metalness: SCNMaterialProperty { get }
     
     
     /*!
     @property roughness
     @abstract The roughness property specifies the apparent smoothness of the surface. Lower values (darker colors) cause the material to appear shiny, with well-defined specular highlights. Higher values (brighter colors) cause specular highlights to spread out and the diffuse property of the material to become more retroreflective. This property is only used when 'lightingModelName' is 'SCNLightingModelPhysicallyBased'.
     */
     @available(iOS 10.0, *)
     open var roughness: SCNMaterialProperty { get }
     
     
     // MARK: -
     
     /*!
     @property shininess
     @abstract Specifies the receiver's shininess value. Defaults to 1.0. Animatable.
     */
     open var shininess: CGFloat
     
     
     /*!
     @property transparency
     @abstract Specifies the receiver's transparency value. Defaults to 1.0. Animatable.
     @discussion The color of the transparent property is multiplied by this property. The result is then used to produce the final transparency according to the rule defined by the transparencyMode property.
     */
     open var transparency: CGFloat
     
     
     /*!
     @property lightingModelName
     @abstract Determines the receiver's lighting model. See above for the list of lighting models. Defaults to SCNLightingModelBlinn.
     */
     open var lightingModel: SCNMaterial.LightingModel
     
     
     /*!
     @property litPerPixel
     @abstract Determines whether the receiver is lit per pixel. Defaults to YES. Animatable.
     */
     open var isLitPerPixel: Bool
     
     
     /*!
     @property doubleSided
     @abstract Determines whether the receiver is double sided. Defaults to NO. Animatable.
     */
     open var isDoubleSided: Bool
     
     
     /*!
     @property fillMode
     @abstract Determines of to how to rasterize the receiver's primitives. Defaults to SCNFillModeFill.
     */
     @available(iOS 11.0, *)
     open var fillMode: SCNFillMode
     
     
     /*!
     @property cullMode
     @abstract Determines the culling mode of the receiver. Defaults to SCNCullBack. Animatable.
     */
     open var cullMode: SCNCullMode
     
     
     /*!
     @property transparencyMode
     @abstract Determines the transparency mode of the receiver. See above for the transparency modes. Defaults to SCNTransparencyModeDefault.
     */
     open var transparencyMode: SCNTransparencyMode
     
     
     /*!
     @property locksAmbientWithDiffuse
     @abstract Makes the ambient property automatically match the diffuse property. Defaults to YES. Animatable.
     */
     open var locksAmbientWithDiffuse: Bool
     
     
     /*!
     @property writeToDepthBuffer
     @abstract Determines whether the receiver writes to the depth buffer when rendered. Defaults to YES.
     */
     open var writesToDepthBuffer: Bool
     
     
     /*!
     @abstract Determines whether the receiver writes to the color buffer when rendered. Defaults to SCNColorMaskAll.
     */
     @available(iOS 11.0, *)
     open var colorBufferWriteMask: SCNColorMask
     
     
     /*!
     @property readsFromDepthBuffer
     @abstract Determines whether the receiver reads from the depth buffer when rendered. Defaults to YES.
     */
     open var readsFromDepthBuffer: Bool
     
     
     /*!
     @property fresnelExponent
     @abstract Specifies the receiver's fresnel exponent value. Defaults to 0.0. Animatable.
     @discussion The effect of the reflectivity property is modulated by this property. The fresnelExponent changes the exponent of the reflectance. The bigger the exponent, the more concentrated the reflection is around the edges.
     */
     open var fresnelExponent: CGFloat
     
     
     /*!
     @property blendMode
     @abstract Specifies the receiver's blend mode. Defaults to SCNBlendModeAlpha.
     */
     @available(iOS 9.0, *)
     open var blendMode: SCNBlendMode
    */


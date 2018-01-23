//
//  XHSSObjectOprationUI.swift
//  ScnceKitTest
//
//  Created by Apple on 2017/12/27.
//  Copyright © 2017年 XiaoHai. All rights reserved.
//

import UIKit
import SceneKit

enum XHSSObjectCellValueType {
    case cvtCGFloat             // √ slider
    case cvtNSInteger           // √ textfeild
    case cvtBool                // switchBtn
    case cvtId                  // √ textfeild : string
    case cvtUIFont              // √ textfeild
    case cvtCGRect              // multiTetfeild
    case cvtNSString            // colick -> pop -> choic
    case cvtUIBezierPath        // colick -> pop -> view
    case cvtSCNChamferMode      // colick -> pop -> choic
}

enum XHSSObjectCellType {
    case tip
    case slider
    case textfeild
    case switchBtn
    case colick
    case multiTetfeild
}



class XHXXObjectCellModel: NSObject {
    var objectModel: XHSSObjectBaseModel?
    var title: String?;
    var valueKey: String?
    var value: Any?;
    var valueType: XHSSObjectCellValueType = .cvtCGFloat;
    var cellType: XHSSObjectCellType = .colick;
}


class XHSSObjectOprationUI: UIView {

    //SCNPlane : CGFloat width / CGFloat height / NSInteger widthSegmentCount / NSInteger heightSegmentCount / CGFloat cornerRadius / NSInteger cornerSegmentCount
    var planeConfigTitleArr: Array<String> =
        ["宽度", "高度", "宽度段数", "高度段数", "圆角半径", "圆角段数"];
    var planeConfigTypeArr: Array<String> =
        ["width", "height", "widthSegmentCount", "heightSegmentCount", "cornerRadius", "cornerSegmentCount"];
    var planeValueTypeArr: Array<XHSSObjectCellValueType> =
        [.cvtCGFloat, .cvtCGFloat, .cvtNSInteger, .cvtNSInteger, .cvtCGFloat, .cvtNSInteger];
    var planeCellTypeArr: Array<XHSSObjectCellType> =
        [.slider, .slider, .textfeild, .textfeild, .slider, .textfeild];
    
    
    //SCNBox : CGFloat width / CGFloat height / CGFloat length / CGFloat chamferRadius / NSInteger widthSegmentCount / NSInteger heightSegmentCount / NSInteger lengthSegmentCount / NSInteger chamferSegmentCount
    var boxConfigTitleArr: Array<String> =
        ["宽度", "高度", "长度", "倒角半径", "宽度段数", "高度段数", "长度段数", "倒角段数"];
    var boxConfigTypeArr: Array<String> =
        ["width", "height", "length", "chamferRadius", "widthSegmentCount", "heightSegmentCount", "lengthSegmentCount", "chamferSegmentCount"];
    var boxValueTypeArr: Array<XHSSObjectCellValueType> =
        [.cvtCGFloat, .cvtCGFloat, .cvtCGFloat, .cvtCGFloat, .cvtNSInteger, .cvtNSInteger, .cvtNSInteger, .cvtNSInteger];
    var boxCellTypeArr: Array<XHSSObjectCellType> =
        [.slider, .slider, .slider, .slider, .textfeild, .textfeild, .textfeild, .textfeild];
    
    //SCNPyramid : CGFloat width / CGFloat height / CGFloat length / NSInteger widthSegmentCount / NSInteger heightSegmentCount / NSInteger lengthSegmentCount
    var pyramidConfigTitleArr: Array<String> =
        ["宽度", "高度", "长度", "宽度段数", "高度段数", "长度段数"];
    var pyramidConfigTypeArr: Array<String> =
        ["width", "height", "length", "widthSegmentCount", "heightSegmentCount", "lengthSegmentCount"];
    var pyramidValueTypeArr: Array<XHSSObjectCellValueType> =
        [.cvtCGFloat, .cvtCGFloat, .cvtCGFloat, .cvtNSInteger, .cvtNSInteger, .cvtNSInteger];
    var pyramidCellTypeArr: Array<XHSSObjectCellType> =
        [.slider, .slider, .slider, .textfeild, .textfeild, .textfeild];
    
    //SCNSphere : CGFloat radius /  BOOL geodesic / NSInteger segmentCount
    var sphereConfigTitleArr: Array<String> =
        ["半径", "高度", "段数"];
    var sphereConfigTypeArr: Array<String> =
        ["radius", "geodesic", "segmentCount"];
    var sphereValueTypeArr: Array<XHSSObjectCellValueType> =
        [.cvtCGFloat, .cvtBool, .cvtNSInteger];
    var sphereCellTypeArr: Array<XHSSObjectCellType> =
        [.slider, .switchBtn, .textfeild];
    
    //SCNCylinder : CGFloat radius / CGFloat height / NSInteger radialSegmentCount / NSInteger heightSegmentCount
    var cylinderConfigTitleArr: Array<String> =
        ["半径", "高度", "半径段数", "高度段数"];
    var cylinderConfigTypeArr: Array<String> =
        ["radius", "height", "radialSegmentCount", "heightSegmentCount"];
    var cylinderValueTypeArr: Array<XHSSObjectCellValueType> =
        [.cvtCGFloat, .cvtCGFloat, .cvtNSInteger, .cvtNSInteger];
    var cylinderCellTypeArr: Array<XHSSObjectCellType> =
        [.slider, .slider, .textfeild, .textfeild];
    
    //SCNCone : CGFloat topRadius / CGFloat bottomRadius / CGFloat height / NSInteger radialSegmentCount / NSInteger heightSegmentCount
    var coneConfigTitleArr: Array<String> =
        ["顶部半径", "底部半径", "高度", "半径段数", "高度段数"];
    var coneConfigTypeArr: Array<String> =
        ["topRadius", "bottomRadius", "height", "radialSegmentCount", "heightSegmentCount"];
    var coneValueTypeArr: Array<XHSSObjectCellValueType> =
        [.cvtCGFloat, .cvtCGFloat, .cvtCGFloat, .cvtNSInteger, .cvtNSInteger];
    var coneCellTypeArr: Array<XHSSObjectCellType> =
        [.slider, .slider, .slider, .textfeild, .textfeild];
    
    //SCNTube : CGFloat innerRadius / CGFloat outerRadius / CGFloat height / NSInteger radialSegmentCount / NSInteger heightSegmentCount
    var tubeConfigTitleArr: Array<String> =
        ["内部半径", "外部半径", "高度", "半径段数", "高度段数"];
    var tubeConfigTypeArr: Array<String> =
        ["innerRadius", "outerRadius", "height", "radialSegmentCount", "heightSegmentCount"];
    var tubeValueTypeArr: Array<XHSSObjectCellValueType> =
        [.cvtCGFloat, .cvtCGFloat, .cvtCGFloat, .cvtNSInteger, .cvtNSInteger];
    var tubeCellTypeArr: Array<XHSSObjectCellType> =
        [.slider, .slider, .slider, .textfeild, .textfeild];

    //SCNCapsule : CGFloat capRadius / CGFloat height / NSInteger radialSegmentCount / NSInteger heightSegmentCount / NSInteger capSegmentCount
    var capsuleConfigTitleArr: Array<String> =
        ["胶囊半径", "高度", "半径段数", "高度段数", "胶囊段数"];
    var capsuleConfigTypeArr: Array<String> =
        ["capRadius", "height", "radialSegmentCount", "heightSegmentCount", "capSegmentCount"];
    var capsuleValueTypeArr: Array<XHSSObjectCellValueType> =
        [.cvtCGFloat, .cvtCGFloat, .cvtNSInteger, .cvtNSInteger, .cvtNSInteger];
    var capsuleCellTypeArr: Array<XHSSObjectCellType> =
        [.slider, .slider, .textfeild, .textfeild, .textfeild];
    
    //SCNTorus : CGFloat ringRadius / CGFloat pipeRadius / NSInteger ringSegmentCount / NSInteger pipeSegmentCount
    var torusConfigTitleArr: Array<String> =
        ["环绕半径", "管道半径", "环绕段数", "管道段数"];
    var torusConfigTypeArr: Array<String> =
        ["ringRadius", "pipeRadius", "ringSegmentCount", "pipeSegmentCount"];
    var torusValueTypeArr: Array<XHSSObjectCellValueType> =
        [.cvtCGFloat, .cvtCGFloat, .cvtNSInteger, .cvtNSInteger];
    var torusCellTypeArr: Array<XHSSObjectCellType> =
        [.slider, .slider, .textfeild, .textfeild];
    
    //SCNFloor : CGFloat reflectivity / CGFloat reflectionFalloffStart / CGFloat reflectionFalloffEnd / NSUInteger reflectionCategoryBitMask API_AVAILABLE(ios(10.0)) / CGFloat width API_AVAILABLE(ios(10.0)) / CGFloat length API_AVAILABLE(ios(10.0)) / CGFloat reflectionResolutionScaleFactor
    var floorConfigTitleArr: Array<String> =
        ["反射率", "反射衰减起点", "反射衰减终点", "--", "宽度", "长度", "--"];
    var floorConfigTypeArr: Array<String> =
        ["reflectivity", "reflectionFalloffStart", "reflectionFalloffEnd", "reflectionCategoryBitMask", "width", "length", "reflectionResolutionScaleFactor"];
    var floorValueTypeArr: Array<XHSSObjectCellValueType> =
        [.cvtCGFloat, .cvtCGFloat, .cvtCGFloat, .cvtNSInteger, .cvtCGFloat, .cvtCGFloat, .cvtCGFloat];
    var floorCellTypeArr: Array<XHSSObjectCellType> =
        [.slider, .slider, .slider, .textfeild, .slider, .slider, .slider];
    
    //SCNText : CGFloat extrusionDepth / id string / UIFont *font / BOOL wrapped / CGRect containerFrame / NSString *truncationMode / NSString *alignmentMode / CGFloat chamferRadius / UIBezierPath *chamferProfile / CGFloat flatness
    var textConfigTitleArr: Array<String> =
        ["挤压深度", "文字", "字体", "换行", "容器尺寸", "截断类型", "对齐模式", "倒角半径", "倒角参照路径", "平整度"];
    var textConfigTypeArr: Array<String> =
        ["extrusionDepth", "string", "font", "wrapped", "containerFrame", "truncationMode", "alignmentMode", "chamferRadius", "chamferProfile", "flatness"];
    var textValueTypeArr: Array<XHSSObjectCellValueType> = [.cvtCGFloat, .cvtId, .cvtUIFont, .cvtBool, .cvtCGRect, .cvtNSString, .cvtNSString, .cvtCGFloat, .cvtUIBezierPath, .cvtCGFloat];
    var textCellTypeArr: Array<XHSSObjectCellType> =
        [.slider, .textfeild, .textfeild, .switchBtn, .multiTetfeild, .textfeild, .colick, .slider, .colick, .slider];
    
    //SCNShape : UIBezierPath *path / CGFloat extrusionDepth / SCNChamferMode chamferMode / CGFloat chamferRadius /  UIBezierPath *chamferProfile
    var shapeConfigTitleArr: Array<String> =
        ["路径", "挤压深度", "倒角类型", "倒角半径", "倒角参照路径"];
    var shapeConfigTypeArr: Array<String> =
        ["path", "extrusionDepth", "chamferMode", "chamferRadius", "chamferProfile"];
    var shapeValueTypeArr: Array<XHSSObjectCellValueType> =
        [.cvtUIBezierPath, .cvtCGFloat, .cvtSCNChamferMode, .cvtCGFloat, .cvtUIBezierPath];
    var shapeCellTypeArr: Array<XHSSObjectCellType> =
        [.colick, .slider, .colick, .slider, .colick];
    
    
    
    
    // MARK: - data varables
    var objectTypeArr: Array<String> =
        ["SCNPlane", "SCNBox", "SCNPyramid", "SCNSphere", "SCNCylinder", "SCNCone", "SCNTube", "SCNCapsule", "SCNTorus", "SCNFloor", "SCNText", "SCNShape"];
    var objectNameArr: Array<String> =
        ["平面", "立方体", "棱锥", "球体", "圆柱", "圆台", "圆管", "胶囊体", "环面体", "地面", "文字", "图形"];
    var objectConfigOperationArr: Array<XHXXObjectCellModel>?;
    
    
    
    /// view property
    override var isHidden: Bool {
        didSet {
            self.objectTypeTableView?.isHidden = false;
            self.objectConfigTableView?.isHidden = true;
        }
    }
    
    
    /// block
    typealias XHSSObjectOprationUIObjectCreateCallBack = (_ newNode: SCNNode) -> ();
    typealias XHSSObjectOprationUIObjectConfigFinishCallBack = () -> ();
    typealias XHSSObjectOprationUIObjectConfigMetarialCallBack = () -> ();
    typealias XHSSObjectOprationUIObjectCreateGeometryCallBack = (XHSSObjectCreateType) -> ();
    var objectCreateCallBack: XHSSObjectOprationUIObjectCreateCallBack?;
    var objectConfigFinishCallBack: XHSSObjectOprationUIObjectConfigFinishCallBack?;
    var objectConfigMetarialCallBack: XHSSObjectOprationUIObjectConfigMetarialCallBack?;
    var createGeometryCallBack: XHSSObjectOprationUIObjectCreateGeometryCallBack?;
    
    
    
    /// scene
    var scene: SCNScene?
    var parentNode: SCNNode?;
    
    var scnGeometryNode: SCNNode? {
        didSet {
            self.scnGeometry = self.scnGeometryNode?.geometry;
            self.parentNode?.addChildNode(self.scnGeometryNode!);
            self.objectTypeTableView?.isHidden = true;
            self.objectConfigTableView?.isHidden = false;
            
            self.objectCreateCallBack?(self.scnGeometryNode!);
        }
    }
    var scnGeometry: SCNGeometry? {
        didSet {
            switch self.scnGeometry {
            case let plane as SCNPlane:
                let planeModel = XHSSPlaneModel();
                planeModel.geometry = plane
                self.objectModel = planeModel;
            case let box as SCNBox:
                let boxModel = XHSSBoxModel();
                boxModel.geometry = box
                self.objectModel = boxModel;
            case let pyramid as SCNPyramid:
                let pyramidModel = XHSSPyramidModel();
                pyramidModel.geometry = pyramid
                self.objectModel = pyramidModel;
            case let sphere as SCNSphere:
                let sphereModel = XHSSSphereModel();
                sphereModel.geometry = sphere
                self.objectModel = sphereModel;
            case let cylinder as SCNCylinder:
                let cylinderModel = XHSSCylinderModel();
                cylinderModel.geometry = cylinder
                self.objectModel = cylinderModel;
            case let cone as SCNCone:
                let coneModel = XHSSConeModel();
                coneModel.geometry = cone
                self.objectModel = coneModel;
            case let tube as SCNTube:
                let tubeModel = XHSSTubeModel();
                tubeModel.geometry = tube
                self.objectModel = tubeModel;
            case let capsule as SCNCapsule:
                let capsuleModel = XHSSCapsuleModel();
                capsuleModel.geometry = capsule
                self.objectModel = capsuleModel;
            case let torus as SCNTorus:
                let torusModel = XHSSTorusModel();
                torusModel.geometry = torus
                self.objectModel = torusModel;
            case let floor as SCNFloor:
                let floorModel = XHSSFloorModel();
                floorModel.geometry = floor
                self.objectModel = floorModel;
            case let text as SCNText:
                let textModel = XHSSTextModel();
                textModel.geometry = text
                self.objectModel = textModel;
            case let shape as SCNShape:
                let shapeModel = XHSSShapeModel();
                shapeModel.geometry = shape
                self.objectModel = shapeModel;
            default:
                print("has new object type in system can be add");
            }
        }
    }
    var objectModel: XHSSObjectBaseModel? {
        didSet {
            self.objectConfigOperationArr = dataSourceWithObject(object: objectModel!);
            self.objectConfigTableView?.reloadData();
        }
    }
    
    
    
    
    // MARK: - view varables
    var objectTypeTableView: UITableView?
    var objectConfigTableView: UITableView?
    var finishBtn: UIButton?;
    var metarialEditBtn: UIButton?;
    
    
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        setupUI();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

/**
 UI
 */
extension XHSSObjectOprationUI {
    // MARK: - UI
    func setupUI() {
        self.backgroundColor = UIColor(white: 0, alpha: 0.3);
        
        self.objectTypeTableView = UITableView();
        self.objectTypeTableView?.backgroundColor = UIColor(white: 0, alpha: 0.7);
        self.objectTypeTableView?.separatorStyle = .none;
        self.objectTypeTableView?.delegate = self;
        self.objectTypeTableView?.dataSource = self;
        self.objectTypeTableView?.register(XHSSObjectTipCell.self, forCellReuseIdentifier: "XHSSObjectTipCell");
        self.addSubview(self.objectTypeTableView!);
        
        self.objectConfigTableView = UITableView();
        self.objectConfigTableView?.backgroundColor = UIColor(white: 0, alpha: 0.7);
        self.objectConfigTableView?.separatorStyle = .none;
        self.objectConfigTableView?.delegate = self;
        self.objectConfigTableView?.dataSource = self;
        self.objectConfigTableView?.register(XHSSObjectTipCell.self, forCellReuseIdentifier: "XHSSObjectTipCell");
        self.objectConfigTableView?.register(XHSSObjectInputOnlyCell.self, forCellReuseIdentifier: "XHSSObjectInputOnlyCell");
        self.objectConfigTableView?.register(XHSSObjectSliderInputCell.self, forCellReuseIdentifier: "XHSSObjectSliderInputCell");
        self.objectConfigTableView?.register(XHSSObjectSwitchBtnTVCell.self, forCellReuseIdentifier: "XHSSObjectSwitchBtnTVCell");
        self.objectConfigTableView?.register(XHSSObjectMultiInputCell.self, forCellReuseIdentifier: "XHSSObjectMultiInputCell");
        self.objectConfigTableView?.isHidden = true;
        self.addSubview(self.objectConfigTableView!);
        
        self.finishBtn = UIButton(type: .custom);
        self.finishBtn?.backgroundColor = UIColor.blue;
        self.finishBtn?.setTitle("FINISH", for: .normal);
        self.finishBtn?.addTarget(self, action: #selector(XHSSObjectOprationUI.finishBtnColick), for: .touchUpInside);
        self.addSubview(self.finishBtn!);
        
        self.metarialEditBtn = UIButton(type: .custom);
        self.metarialEditBtn?.backgroundColor = UIColor.red;
        self.metarialEditBtn?.setTitle("METARIAL", for: .normal);
        self.metarialEditBtn?.addTarget(self, action: #selector(XHSSObjectOprationUI.metarialEditBtnColick), for: .touchUpInside);
        self.addSubview(self.metarialEditBtn!);
    }
    
    // MARK: - layout
    override func layoutSubviews() {
        self.objectTypeTableView?
            .topEqualToNum(0)
            .leftEqualToNum(0)
            .bottomEqualToNum(0)
            .widthEqualToNum(100)
            .clearWarning();
        
        self.finishBtn?
            .leftEqualToNum(0)
            //.rightEqualToNum(0)
            .widthEqualToNum(self.xhssWidth/2.0)
            .heightEqualToNum(30)
            .bottomAligmentToNum(0)
            .clearWarning();
        
        self.metarialEditBtn?
            .widthEqualToNum(self.xhssWidth/2.0)
            //.leftEqualToNum(0)
            .leftAligmentToViewRight(self.finishBtn!)
            //.rightEqualToNum(0)
            .heightEqualToNum(30)
            .bottomAligmentToNum(0)
            .clearWarning();
        
        self.objectConfigTableView?
            .topEqualToNum(0)
            //.leftDistance(0).toLeftRefView(self.objectTypeTableView!)
            .leftEqualToNum(0)
            //.bottomEqualToNum(0)
            .bottomDistance(0).toBottomRefView(self.finishBtn!)
            .rightEqualToNum(0)
            .clearWarning();
    }
}

/**
 Action
 */
extension XHSSObjectOprationUI {
    // MARK: - action
    @objc func finishBtnColick() {
        self.objectConfigFinishCallBack?();
        self.removeFromSuperview();
    }

    @objc func metarialEditBtnColick() {
        XHSSMaterialOprationUI.show(inView: self, geometryNode: SCNNode()) {(material: SCNMaterial) -> () in
            //self.scnGeometry?.materials.append(material);
            self.scnGeometry?.materials = [material];
            self.removeFromSuperview();
        }
        self.objectConfigTableView?.isHidden = true;
        self.objectTypeTableView?.isHidden = true;
        self.objectConfigMetarialCallBack?();
    }
}

/**
 TableView
 */
enum XHSSObjectCreateType {
    case plane
    case box
    case pyramid
    case sphere
    case cylinder
    case cone
    case tube
    case capsule
    case torus
    case floor
    case text
    case shape
}
extension XHSSObjectOprationUI: UITableViewDelegate, UITableViewDataSource {
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView === self.objectTypeTableView {
            //self.objectConfigTableView?.reloadData();
            guard let block = self.createGeometryCallBack else {
                return;
            }
            
            switch objectNameArr[indexPath.row] {
            case "平面":
                block(.plane);
//                self.scnGeometryNode = createPlane();
            case "立方体":
                block(.box);
//                self.scnGeometryNode = createBox();
            case "棱锥":
                block(.pyramid);
//                self.scnGeometryNode = createPyramid();
            case "球体":
                block(.sphere);
//                self.scnGeometryNode = createSphere();
            case "圆柱":
                block(.cylinder);
//                self.scnGeometryNode = createCylinder();
            case "圆台":
                block(.cone);
//                self.scnGeometryNode = createCone();
            case "圆管":
                block(.tube);
//                self.scnGeometryNode = createTube();
            case "胶囊体":
                block(.capsule);
//                self.scnGeometryNode = createCapsule();
            case "环面体":
                block(.torus);
//                self.scnGeometryNode = createTorus();
            case "地面":
                block(.floor);
//                self.scnGeometryNode = createFloor();
            case "文字":
                block(.text);
//                self.scnGeometryNode = createText();
            case "图形":
                block(.shape);
//                self.scnGeometryNode = createShape();
            default:
                print("error bject type selecte");
            }
        } else {
            
        }
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView === self.objectTypeTableView {
            return self.objectNameArr.count;
        } else {
            return self.objectConfigOperationArr?.count ?? 0;
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: XHSSObjectBaseTVCell?;
        if tableView === self.objectTypeTableView {
            cell = tableView.dequeueReusableCell(withIdentifier: "XHSSObjectTipCell") as? XHSSObjectBaseTVCell;
            let cellModel = XHXXObjectCellModel();
            cellModel.title = self.objectNameArr[indexPath.row];
            cell?.cellModel = cellModel;
        } else {
            if let currentModel = self.objectConfigOperationArr?[indexPath.row] {
                switch currentModel.cellType {
                    case .textfeild:
                        cell = tableView.dequeueReusableCell(withIdentifier: "XHSSObjectInputOnlyCell") as? XHSSObjectInputOnlyCell;
                    case .slider:
                        cell = tableView.dequeueReusableCell(withIdentifier: "XHSSObjectSliderInputCell") as? XHSSObjectSliderInputCell;
                    case .tip:
                        cell = tableView.dequeueReusableCell(withIdentifier: "XHSSObjectTipCell") as? XHSSObjectTipCell;
                    case .switchBtn:
                        cell = tableView.dequeueReusableCell(withIdentifier: "XHSSObjectSwitchBtnTVCell") as? XHSSObjectSwitchBtnTVCell;
                    case .colick:
                        cell = tableView.dequeueReusableCell(withIdentifier: "XHSSObjectTipCell") as? XHSSObjectTipCell;
                    case .multiTetfeild:
                        cell = tableView.dequeueReusableCell(withIdentifier: "XHSSObjectMultiInputCell") as? XHSSObjectMultiInputCell;
                }
                cell?.cellModel = self.objectConfigOperationArr?[indexPath.row];
            }
            
        }
        return cell!;
    }
}

///**
// Create Object
// */
//extension XHSSObjectOprationUI {
//    func createPlane() -> SCNNode {
//        let plane: SCNPlane = SCNPlane(width: 3, height: 3);
//        let planeNode = SCNNode(geometry: plane);
//        planeNode.position = SCNVector3(0, 0, 0);
//        planeNode.name = "newPlane";
//        self.scene?.rootNode.addChildNode(planeNode);
//        return planeNode;
//    }
//    
//    func createBox() -> SCNNode {
//        let box: SCNBox = SCNBox(width: 3, height: 3, length: 3, chamferRadius: 0);
//        let boxNode = SCNNode(geometry: box);
//        boxNode.position = SCNVector3(0, 0, 0);
//        boxNode.name = "newBox";
//        self.scene?.rootNode.addChildNode(boxNode);
//        return boxNode;
//    }
//    
//    func createPyramid() -> SCNNode {
//        let pyramid: SCNPyramid = SCNPyramid(width: 3, height: 3, length: 3);
//        let pyramidNode = SCNNode(geometry: pyramid);
//        pyramidNode.position = SCNVector3(0, 0, 0);
//        pyramidNode.name = "newPyramid";
//        self.scene?.rootNode.addChildNode(pyramidNode);
//        return pyramidNode;
//    }
//    
//    func createSphere() -> SCNNode {
//        let sphere: SCNSphere = SCNSphere(radius: 3);
//        let sphereNode = SCNNode(geometry: sphere);
//        sphereNode.position = SCNVector3(0, 0, 0);
//        sphereNode.name = "newSphere";
//        self.scene?.rootNode.addChildNode(sphereNode);
//        return sphereNode;
//    }
//    
//    func createCylinder() -> SCNNode {
//        let cylinder: SCNCylinder = SCNCylinder(radius: 3, height: 3);
//        let cylinderNode = SCNNode(geometry: cylinder);
//        cylinderNode.position = SCNVector3(0, 0, 0);
//        cylinderNode.name = "newCylinder";
//        self.scene?.rootNode.addChildNode(cylinderNode);
//        return cylinderNode;
//    }
//    
//    func createCone() -> SCNNode {
//        let cone: SCNCone = SCNCone(topRadius: 1, bottomRadius: 3, height: 3);
//        let coneNode = SCNNode(geometry: cone);
//        coneNode.position = SCNVector3(0, 0, 0);
//        coneNode.name = "newCone";
//        self.scene?.rootNode.addChildNode(coneNode);
//        return coneNode;
//    }
//    
//    func createTube() -> SCNNode {
//        let tube: SCNTube = SCNTube(innerRadius: 1, outerRadius: 3, height: 3);
//        let tubeNode = SCNNode(geometry: tube);
//        tubeNode.position = SCNVector3(0, 0, 0);
//        tubeNode.name = "newTube";
//        self.scene?.rootNode.addChildNode(tubeNode);
//        return tubeNode;
//    }
//    
//    func createCapsule() -> SCNNode {
//        let capsule: SCNCapsule = SCNCapsule(capRadius: 3, height: 3);
//        let capsuleNode = SCNNode(geometry: capsule);
//        capsuleNode.position = SCNVector3(0, 0, 0);
//        capsuleNode.name = "newCapsule";
//        self.scene?.rootNode.addChildNode(capsuleNode);
//        return capsuleNode;
//    }
//    
//    func createTorus() -> SCNNode {
//        let torus: SCNTorus = SCNTorus(ringRadius: 3, pipeRadius: 1);
//        let torusNode = SCNNode(geometry: torus);
//        torusNode.position = SCNVector3(0, 0, 0);
//        torusNode.name = "newTorus";
//        self.scene?.rootNode.addChildNode(torusNode);
//        return torusNode;
//    }
//    
//    func createFloor() -> SCNNode {
//        let floor: SCNFloor = SCNFloor();
//        floor.width = 3.0;
//        floor.length = 3.0;
//        let floorNode = SCNNode(geometry: floor);
//        floorNode.position = SCNVector3(0, 0, 0);
//        floorNode.name = "newFloor";
//        self.scene?.rootNode.addChildNode(floorNode);
//        return floorNode;
//    }
//    
//    func createText() -> SCNNode {
//        let text: SCNText = SCNText(string: "TEXT", extrusionDepth: 3);
//        let textNode = SCNNode(geometry: text);
//        textNode.position = SCNVector3(0, 0, 0);
//        textNode.name = "newText";
//        self.scene?.rootNode.addChildNode(textNode);
//        return textNode;
//    }
//    
//    func createShape() -> SCNNode {
//        let shape: SCNShape = SCNShape(path: UIBezierPath(rect: CGRect(x: 0, y: 0, width: 3, height: 3)), extrusionDepth: 3);
//        let shapeNode = SCNNode(geometry: shape);
//        shapeNode.position = SCNVector3(0, 0, 0);
//        shapeNode.name = "newShape";
//        self.scene?.rootNode.addChildNode(shapeNode);
//        return shapeNode;
//    }
//}

/**
 DataSource
 */
extension XHSSObjectOprationUI {
    func dataSourceWithObject(object: XHSSObjectBaseModel) -> Array<XHXXObjectCellModel> {
        var resultArr: Array<XHXXObjectCellModel>! = [];
        
        if object.isKind(of: XHSSPlaneModel.self) {
            for index in 0 ..< self.planeConfigTitleArr.count {
                let model: XHXXObjectCellModel = XHXXObjectCellModel();
                model.title = self.planeConfigTitleArr[index];
                model.valueKey = self.planeConfigTypeArr[index];
                model.value = object.value(forKey: self.planeConfigTypeArr[index]);
                model.cellType = self.planeCellTypeArr[index];
                model.valueType = self.planeValueTypeArr[index];
                model.objectModel = self.objectModel;
                resultArr.append(model);
            }
        } else if object.isKind(of: XHSSBoxModel.self) {
            for index in 0 ..< self.boxConfigTitleArr.count {
                let model: XHXXObjectCellModel = XHXXObjectCellModel();
                model.title = self.boxConfigTitleArr[index];
                model.valueKey = self.boxConfigTypeArr[index];
                model.value = object.value(forKey: self.boxConfigTypeArr[index]);
                model.cellType = self.boxCellTypeArr[index];
                model.valueType = self.boxValueTypeArr[index];
                model.objectModel = self.objectModel;
                resultArr.append(model);
            }
        } else if object.isKind(of: XHSSPyramidModel.self) {
            for index in 0 ..< self.pyramidConfigTitleArr.count {
                let model: XHXXObjectCellModel = XHXXObjectCellModel();
                model.title = self.pyramidConfigTitleArr[index];
                model.valueKey = self.pyramidConfigTypeArr[index];
                model.value = object.value(forKey: self.pyramidConfigTypeArr[index]);
                model.cellType = self.pyramidCellTypeArr[index];
                model.valueType = self.pyramidValueTypeArr[index];
                model.objectModel = self.objectModel;
                resultArr.append(model);
            }
        } else if object.isKind(of: XHSSSphereModel.self) {
            for index in 0 ..< self.sphereConfigTitleArr.count {
                let model: XHXXObjectCellModel = XHXXObjectCellModel();
                model.title = self.sphereConfigTitleArr[index];
                model.valueKey = self.sphereConfigTypeArr[index];
                model.value = object.value(forKey: self.sphereConfigTypeArr[index]);
                model.cellType = self.sphereCellTypeArr[index];
                model.valueType = self.sphereValueTypeArr[index];
                model.objectModel = self.objectModel;
                resultArr.append(model);
            }
        } else if object.isKind(of: XHSSCylinderModel.self) {
            for index in 0 ..< self.cylinderConfigTitleArr.count {
                let model: XHXXObjectCellModel = XHXXObjectCellModel();
                model.title = self.cylinderConfigTitleArr[index];
                model.valueKey = self.cylinderConfigTypeArr[index];
                model.value = object.value(forKey: self.cylinderConfigTypeArr[index]);
                model.cellType = self.cylinderCellTypeArr[index];
                model.valueType = self.cylinderValueTypeArr[index];
                model.objectModel = self.objectModel;
                resultArr.append(model);
            }
        } else if object.isKind(of: XHSSConeModel.self) {
            for index in 0 ..< self.coneConfigTitleArr.count {
                let model: XHXXObjectCellModel = XHXXObjectCellModel();
                model.title = self.coneConfigTitleArr[index];
                model.valueKey = self.coneConfigTypeArr[index];
                model.value = object.value(forKey: self.coneConfigTypeArr[index]);
                model.cellType = self.coneCellTypeArr[index];
                model.valueType = self.coneValueTypeArr[index];
                model.objectModel = self.objectModel;
                resultArr.append(model);
            }
        } else if object.isKind(of: XHSSTubeModel.self) {
            for index in 0 ..< self.tubeConfigTitleArr.count {
                let model: XHXXObjectCellModel = XHXXObjectCellModel();
                model.title = self.tubeConfigTitleArr[index];
                model.valueKey = self.tubeConfigTypeArr[index];
                model.value = object.value(forKey: self.tubeConfigTypeArr[index]);
                model.cellType = self.tubeCellTypeArr[index];
                model.valueType = self.tubeValueTypeArr[index];
                model.objectModel = self.objectModel;
                resultArr.append(model);
            }
        } else if object.isKind(of: XHSSCapsuleModel.self) {
            for index in 0 ..< self.capsuleConfigTitleArr.count {
                let model: XHXXObjectCellModel = XHXXObjectCellModel();
                model.title = self.capsuleConfigTitleArr[index];
                model.valueKey = self.capsuleConfigTypeArr[index];
                model.value = object.value(forKey: self.capsuleConfigTypeArr[index]);
                model.cellType = self.capsuleCellTypeArr[index];
                model.valueType = self.capsuleValueTypeArr[index];
                model.objectModel = self.objectModel;
                resultArr.append(model);
            }
        } else if object.isKind(of: XHSSTorusModel.self) {
            for index in 0 ..< self.torusConfigTitleArr.count {
                let model: XHXXObjectCellModel = XHXXObjectCellModel();
                model.title = self.torusConfigTitleArr[index];
                model.valueKey = self.torusConfigTypeArr[index];
                model.value = object.value(forKey: self.torusConfigTypeArr[index]);
                model.cellType = self.torusCellTypeArr[index];
                model.valueType = self.torusValueTypeArr[index];
                model.objectModel = self.objectModel;
                resultArr.append(model);
            }
        } else if object.isKind(of: XHSSFloorModel.self) {
            for index in 0 ..< self.floorConfigTitleArr.count {
                let model: XHXXObjectCellModel = XHXXObjectCellModel();
                model.title = self.floorConfigTitleArr[index];
                model.valueKey = self.floorConfigTypeArr[index];
                model.value = object.value(forKey: self.floorConfigTypeArr[index]);
                model.cellType = self.floorCellTypeArr[index];
                model.valueType = self.floorValueTypeArr[index];
                model.objectModel = self.objectModel;
                resultArr.append(model);
            }
        } else if object.isKind(of: XHSSTextModel.self) {
            for index in 0 ..< self.textConfigTitleArr.count {
                let model: XHXXObjectCellModel = XHXXObjectCellModel();
                model.title = self.textConfigTitleArr[index];
                model.valueKey = self.textConfigTypeArr[index];
                model.value = object.value(forKey: self.textConfigTypeArr[index]);
                model.cellType = self.textCellTypeArr[index];
                model.valueType = self.textValueTypeArr[index];
                model.objectModel = self.objectModel;
                resultArr.append(model);
            }
        } else if object.isKind(of: XHSSShapeModel.self) {
            for index in 0 ..< self.shapeConfigTitleArr.count {
                let model: XHXXObjectCellModel = XHXXObjectCellModel();
                model.title = self.shapeConfigTitleArr[index];
                model.valueKey = self.shapeConfigTypeArr[index];
                model.value = object.value(forKey: self.shapeConfigTypeArr[index]);
                model.cellType = self.shapeCellTypeArr[index];
                model.valueType = self.shapeValueTypeArr[index];
                model.objectModel = self.objectModel;
                resultArr.append(model);
            }
        }
        
        return resultArr;
    }
}

/**
 Public
 */
enum XHSSObjectOprationUITableViewType {
    case create
    case config
}
extension XHSSObjectOprationUI {
    // MARK: - PUBLIC
    static func show(inView superView: UIView, tableViewType: XHSSObjectOprationUITableViewType, geometryNode: SCNNode, finishCallBack: @escaping XHSSObjectOprationUIObjectCreateCallBack) {
        let oprationUI = XHSSObjectOprationUI(frame: superView.bounds);
        superView.addSubview(oprationUI);
        switch tableViewType {
        case .create:
            oprationUI.objectTypeTableView?.isHidden = false;
            oprationUI.objectConfigTableView?.isHidden = true;
            oprationUI.parentNode = geometryNode;
        case .config:
            oprationUI.objectTypeTableView?.isHidden = true;
            oprationUI.objectConfigTableView?.isHidden = false;
            oprationUI.scnGeometry = geometryNode.geometry;
        }
        oprationUI.objectCreateCallBack = finishCallBack;
    }
}









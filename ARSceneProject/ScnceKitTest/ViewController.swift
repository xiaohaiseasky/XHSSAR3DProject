//
//  ViewController.swift
//  ScnceKitTest
//
//  Created by Apple on 2017/12/5.
//  Copyright © 2017年 XiaoHai. All rights reserved.
//
//
//
// object   <->   shader   <->    motion    <->

import UIKit
import SpriteKit
import SceneKit
import ARKit
import Vision
import CoreMotion

class ViewController: UIViewController {
    
    // MARK: - AR
    var arEnable: Bool = false;
    let arSceneView: ARSCNView = ARSCNView();
    let arSession: ARSession = ARSession();
    
    // MARK: - SCN Object
    var scene : SCNScene?;
    var camera : SCNNode?;
    var light : SCNNode?;
    var object : SCNNode?;
    
    
    var oprateTargetObject : SCNNode?;
    
    var geometry : SCNGeometry = SCNGeometry();
    var geometryNode : SCNNode?;
    
    // Menu UI
    var objectControlBoard: XHSSControlBoardView?;
    var objectOprationView: XHSSObjectOprationUI?;
    
    var sceneView: SCNView?;
    
    var sphere : SCNGeometry = SCNSphere();
    var beginPoint = CGPoint();
    
    

    // MARK: - ViewController life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        setupScnce();
        
        ////////////////////////////////////////////
        setup();
        
        let view = XHSSControlBoardView(frame: CGRect(x: 0, y: self.view.xhssHeight-150, width: self.view.xhssWidth, height: 150));
        view.geometryNode = self.geometryNode;
        self.objectControlBoard = view;
        self.view.addSubview(view);
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if self.arEnable {
            let arSessionConfig = ARWorldTrackingConfiguration();
            //arSessionConfig.planeDetection = .horizontal;
            //arSessionConfig.isLightEstimationEnabled = true;
            //self.arSession.run(arSessionConfig, options: [.resetTracking, .removeExistingAnchors]);
            self.arSession.run(arSessionConfig)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if self.arEnable {
            self.arSession.pause()
        }
    }
    
    
    // MARK : control
    func setup() -> Void {
        
        if self.arEnable {
            /// AR Kit
            self.arSceneView.frame = self.view.bounds;
            self.arSceneView.session = arSession;
            self.arSceneView.delegate = self;
            self.arSceneView.autoenablesDefaultLighting = true;
            self.view.addSubview(self.arSceneView);
            
            let longPressGeture = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longPressScene(longPress:)));
            self.arSceneView.addGestureRecognizer(longPressGeture);
            
            let scene = SCNScene();
            self.scene = scene;
            arSceneView.scene = scene;
            self.sceneView = arSceneView;
            
        } else {
            /// SCNCene Kit
            let scnceView = SCNView(frame: self.view.bounds);
            scnceView.isUserInteractionEnabled = true;
            scnceView.allowsCameraControl = true;
            scnceView.showsStatistics = true;
            scnceView.autoenablesDefaultLighting = false;
            let longPressGeture = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longPressScene(longPress:)));
            scnceView.addGestureRecognizer(longPressGeture);
            self.view.addSubview(scnceView);
            let scene = SCNScene();
            self.scene = scene;
            scnceView.scene = scene;
            self.sceneView = scnceView;
            
            
            let camera = setupCamera(scene: scene);
            self.camera = camera;
            setupLight(scene: scene);
            
            
            let sphereNode = addSphere(radius: 4, toScene: scene);
            self.geometryNode = sphereNode;
            self.geometry = sphereNode.geometry!;
            self.object = sphereNode;
            self.oprateTargetObject = sphereNode;
            addMaterial(toGeometry: self.geometry);
            
            
            //添加指向胶囊节点这个约束
            let lookAtConstraint = SCNLookAtConstraint(target: self.object);
            //使其只围绕一个轴转动
            lookAtConstraint.isGimbalLockEnabled = true;
            //camera.constraints = [lookAtConstraint];
        }
    }
    
    // MARK : add object
    func addSphere(radius: CGFloat, toScene scene: SCNScene) -> SCNNode {
        let shapePath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 3, height: 3), cornerRadius: 1);
        let shape = SCNShape(path: shapePath, extrusionDepth: 10);
        let shapeNode = SCNNode(geometry: shape);
        shapeNode.position = SCNVector3(0, 0, 0);
        shapeNode.name = "shape";
        scene.rootNode.addChildNode(shapeNode);
        
        return shapeNode;
    }
    
    func addMaterial(toGeometry geometry: SCNGeometry) -> Void {
        let redMetallicMaterial = SCNMaterial();
        redMetallicMaterial.diffuse.contents = UIImage(named: "tiankong.jpg");
        
        //法线贴图
        let noiseTexture = SKTexture(noiseWithSmoothness: 0.25, size: CGSize(width: 512, height: 512), grayscale: true);
        let noiseNormalMaptexture = noiseTexture.generatingNormalMap(withSmoothness: 1, contrast: 1.0);
        
        redMetallicMaterial.normal.contents = noiseNormalMaptexture;
        geometry.materials = [redMetallicMaterial];
    }
    
    @objc func longPressScene(longPress: UILongPressGestureRecognizer) -> Void {
        // 检测点击到哪个，返回被点到的物体，这里返回的数组里包含了你点击的点顺着屏幕法线穿过的所有的物体
        let hits = self.sceneView?.hitTest(longPress.location(in: longPress.view), options: nil) as! [SCNHitTestResult];
        // 默认取第一个响应点击的物体
        let hit = hits.first;
        let node = hit?.node;
        
        if longPress.state == .began {
            
            XHSSObjectOprationTypePopView.show(inView: self.view, colickCallBack: { (oprationType) in
                switch oprationType {
                case .oprate:
                    self.objectControlBoard?.isHidden = false;
                    self.objectControlBoard?.geometryNode = node;
                case .create:
                    XHSSObjectOprationUI.show(inView: self.view, tableViewType: .create, geometryNode: node ?? (self.scene?.rootNode)!, finishCallBack: { (newNode) in
                        self.objectControlBoard?.geometryNode = newNode;
                    });
                case .edit:
                    XHSSObjectOprationUI.show(inView: self.view, tableViewType: .config, geometryNode: node ?? self.geometryNode!, finishCallBack: { (newNode) in
                    });
                case .copy:
                    print("copy");
                    if let oneNode = node {
                        // copy only colne current node , and clone will clone current node and sub node
                        let newNode = oneNode.clone();
                        node?.parent?.addChildNode(newNode);
                        var newPosition = node?.position;
                        newPosition?.x += 2.0;
                        newNode.position = newPosition!;
                    }
                case .delete:
                    print("delete");
                case .cancel:
                    print("cancel");
                }
            });
        }
    }
    
    // MARK : touch
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = (touches as NSSet).anyObject() as! UITouch;
        let currentPoint = touch.previousLocation(in: self.view);
        self.beginPoint = currentPoint;
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = (touches as NSSet).anyObject() as! UITouch;
        //let lastPoint = touch.previousLocation(in: self.view);
        let currentPoint = touch.location(in: self.view);
        
        let distance = sqrt(Double(pow((self.beginPoint.x-currentPoint.x), 2)) + Double(pow((self.beginPoint.y-currentPoint.y), 2)))/70.0;
        
        return;
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let lookAtConstraint = SCNLookAtConstraint(target: self.object);
        //使其只围绕一个轴转动
        lookAtConstraint.isGimbalLockEnabled = true;
        self.camera?.constraints = [lookAtConstraint];
    }
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    func setupScnce() -> Void {
        let scnceView = SCNView(frame: self.view.bounds); //self.view as! SCNView;
        self.view.addSubview(scnceView);
        let scene = SCNScene();
        scnceView.scene = scene;
        scnceView.allowsCameraControl = true;
        
        let camera = setupCamera(scene: scene);
        let nodes = addWidgets(scene: scene);
        setupLight(scene: scene);
        addConstraint(pointerNode: camera, targetNode: nodes[0]);
    }
    
    func setupCamera(scene: SCNScene) -> SCNNode {
        let camera = SCNCamera();
        camera.fieldOfView = 90;
        camera.focusDistance = 2.5;
        camera.focalLength = 50;
        let cameraNode = SCNNode();
        cameraNode.camera = camera;
        cameraNode.position = SCNVector3(0, 0, 20);
        scene.rootNode.addChildNode(cameraNode);
        return cameraNode;
    }
    
    func setupLight(scene: SCNScene) -> Void {
        let ambientLight = SCNLight();
        ambientLight.type = .ambient;
        ambientLight.color = UIColor.white; // UIColor(red: 0, green: 0, blue: 1, alpha: 1);
        let ambientLightNode = SCNNode();
        ambientLightNode.light = ambientLight;
        scene.rootNode.addChildNode(ambientLightNode);
        self.light = ambientLightNode;
        
        let omniLight = SCNLight();
        omniLight.type = .omni;
        omniLight.color = UIColor.white; // UIColor(red: 1, green: 0, blue: 0, alpha: 1);
        let omniLightNode = SCNNode();
        omniLightNode.light = omniLight;
        omniLightNode.position = SCNVector3(-10, 8, 5);
        scene.rootNode.addChildNode(omniLightNode);
    }
    
    func addWidgets(scene: SCNScene) -> [SCNNode] {
        let capsule = SCNCapsule(capRadius: 3, height: 10);
        let capsuleNode = SCNNode(geometry: capsule);
        capsuleNode.position = SCNVector3(-15, -2.8, 0);
        capsuleNode.name = "myCapsuleNode";
        scene.rootNode.addChildNode(capsuleNode);
        
        let capsule1 = SCNCapsule(capRadius: 3, height: 10);
        let capsuleNode1 = SCNNode(geometry: capsule1);
        capsuleNode1.position = SCNVector3(+15, +2.8, 7);
        capsuleNode1.name = "myCapsuleNode1";
        scene.rootNode.addChildNode(capsuleNode1);
        
        addAnimation(animateNode: capsuleNode);
        addMaterial(node: capsule, node1:capsule1);
        
        return [capsuleNode, capsuleNode1];
    }

    func addAnimation(animateNode: SCNNode) -> Void {
        let moveUpDwonAni = CABasicAnimation(keyPath: "position");
        moveUpDwonAni.byValue = NSValue(scnVector3: SCNVector3(30, 0, 0));
        moveUpDwonAni.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut);
        moveUpDwonAni.autoreverses = true;
        moveUpDwonAni.duration = 10;
        animateNode.addAnimation(moveUpDwonAni, forKey: "upAndDown");
        
        let text = SCNText(string: "This Is Test SCENE KIT", extrusionDepth: 1);
        text.font = UIFont.systemFont(ofSize: 2);
        let textNode = SCNNode(geometry: text);
        textNode.position = SCNVector3(-5, 6, 0);
        animateNode.addChildNode(textNode);
        
        //在一个节点上添加多个动画结果会复合，即便是继承自父节点的动画也同样一起复合
        let rotate = CABasicAnimation(keyPath: "eulerAngles");
        rotate.byValue = NSValue(scnVector3: SCNVector3(Float(0), Float(Double.pi * 2), Float(0)));
        rotate.repeatCount = Float.infinity;
        rotate.duration = 5.0;
        textNode.addAnimation(rotate, forKey: "rotation")
    }
    
    func addMaterial(node: SCNGeometry, node1: SCNGeometry) -> Void {
        let redMetallicMaterial = SCNMaterial();
        redMetallicMaterial.diffuse.contents = UIColor.blue;
        redMetallicMaterial.specular.contents = UIColor.purple;
        redMetallicMaterial.shininess = 1.0;
        node.materials = [redMetallicMaterial];
        
        let noiseTexture = SKTexture(noiseWithSmoothness: 0.25, size: CGSize(width: 512, height: 512), grayscale: true);
        let noiseMaterial = SCNMaterial();
        noiseMaterial.diffuse.contents = noiseTexture;
        node1.materials = [noiseMaterial];
        
        //法线贴图
        let noiseNormalMaptexture = noiseTexture.generatingNormalMap(withSmoothness: 1, contrast: 1.0);
        redMetallicMaterial.normal.contents = noiseNormalMaptexture;
    }
    
    func hitTest() -> Void {
        let tapGesture = UITapGestureRecognizer(target: self, action: Selector("tap:"));
        let longPressGeture = UILongPressGestureRecognizer(target: self, action: "longPress:");
        let sceneView = self.view as! SCNView;
        sceneView.isUserInteractionEnabled = true;
        sceneView.addGestureRecognizer(tapGesture);
        sceneView.addGestureRecognizer(longPressGeture);
    }
    func tap(tap: UITapGestureRecognizer) -> Void {
        if tap.state == .ended {
            let sceneView = self.view as! SCNView;
            //检测点击到哪个，返回被点到的物体，这里返回的数组里包含了你点击的点顺着屏幕法线穿过的所有的物体
            let hits = sceneView.hitTest(tap.location(in: tap.view), options: nil) as [SCNHitTestResult];
            for hit in hits {
                if let theMaterial = hit.node.geometry?.materials[0] {
                    let hightLightAnimation = CABasicAnimation(keyPath: "contents");
                    hightLightAnimation.fromValue = UIColor.black;
                    hightLightAnimation.toValue = UIColor.orange;
                    hightLightAnimation.autoreverses = true;
                    hightLightAnimation.repeatCount = 3;
                    hightLightAnimation.duration = 2;
                    theMaterial.emission.addAnimation(hightLightAnimation, forKey: "hightLight");
                }
            }
            
        }
    }
    func longPress(longPress: UILongPressGestureRecognizer) -> Void {
        
    }
    
    
    func addConstraint(pointerNode: SCNNode, targetNode: SCNNode) -> Void {
        //添加指向胶囊节点这个约束
        let lookAtConstraint = SCNLookAtConstraint(target: targetNode);
        //使其只围绕一个轴转动
        lookAtConstraint.isGimbalLockEnabled = true;
        pointerNode.constraints = [lookAtConstraint];
    }
    
    //加载一个已经建好的3D模型或场景，会是一个COLLADA文件，后缀名为.dae
    func loadCOLLADA(rootNode: SCNNode) -> Void {
        let url = Bundle.main.url(forResource: "Critter", withExtension: "dae");
        let data = SCNSceneSource(url: url!, options: nil);
        let node = data?.entryWithIdentifier("identifier", withClass: SCNNode.self);
        if let addNode = node {
            addNode.position = SCNVector3(0, 0, -10);
            addNode.name = "loadedNode";
            rootNode.addChildNode(addNode);
        }
//        if node != nil {
//            node?.position = SCNVector3(0, 0, -10);
//            node?.name = "loadedNode";
//            rootNode.addChildNode((node?));
//        }
    }
    
    func phsics() -> Void {
//        //像节点添加物理特性
//        var critterPhysicsShape: SCNPhysicsShape?
//        if let geometry = critterNode?.geometry {
//            critterPhysicsShape = SCNPhysicsShape(geometry: geometry, options: nil)
//        }
//        let critterPhysicsBody = SCNPhysicsBody(type: SCNPhysicsBodyType.Dynamic, shape: critterPhysicsShape)
//        critterPhysicsBody.mass = 1
//        critterNode?.physicsBody = critterPhysicsBody
//
//        //添加一个地板
//        let floor = SCNFloor()
//        let floorNode = SCNNode(geometry: floor)
//        floorNode.position = SCNVector3(0, -10, 0)
//        myScenes.rootNode.addChildNode(floorNode)
//        let floorPhysicsBody = SCNPhysicsBody(type: SCNPhysicsBodyType.Static, shape: SCNPhysicsShape(geometry: floor, options: nil))
//        floorNode.physicsBody = floorPhysicsBody
    }
}


// MARK: - ARSCNViewDelegate
extension ViewController: ARSCNViewDelegate {
    
    /**
     Implement this to provide a custom node for the given anchor.
     
     @discussion This node will automatically be added to the scene graph.
     If this method is not implemented, a node will be automatically created.
     If nil is returned the anchor will be ignored.
     @param renderer The renderer that will render the scene.
     @param anchor The added anchor.
     @return Node that will be mapped to the anchor or nil.
     */
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        return self.geometryNode!;
    }
    
    
    /**
     Called when a new node has been mapped to the given anchor.
     
     @param renderer The renderer that will render the scene.
     @param node The node that maps to the anchor.
     @param anchor The added anchor.
     */
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        if let planeAnchor = anchor as? ARPlaneAnchor {
            if let arObject = self.geometryNode {
                arObject.position.x = planeAnchor.center.x;
                arObject.position.y = planeAnchor.center.y;
                arObject.position.z = planeAnchor.center.z;
                arObject.position.y += 3;
            }
        }
    }
    
    
    /**
     Called when a node will be updated with data from the given anchor.
     
     @param renderer The renderer that will render the scene.
     @param node The node that will be updated.
     @param anchor The anchor that was updated.
     */
    func renderer(_ renderer: SCNSceneRenderer, willUpdate node: SCNNode, for anchor: ARAnchor) {
        
    }
    
    
    /**
     Called when a node has been updated with data from the given anchor.
     
     @param renderer The renderer that will render the scene.
     @param node The node that was updated.
     @param anchor The anchor that was updated.
     */
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        
    }
    
    
    /**
     Called when a mapped node has been removed from the scene graph for the given anchor.
     
     @param renderer The renderer that will render the scene.
     @param node The node that was removed.
     @param anchor The anchor that was removed.
     */
    func renderer(_ renderer: SCNSceneRenderer, didRemove node: SCNNode, for anchor: ARAnchor) {
        
    }
}

// MARK: - ARSessionDelegate
extension ViewController: ARSessionDelegate {
    
}

// MARK: - ARSessionObserver
extension ViewController: ARSessionObserver {
    
    /**
     This is called when a session fails.
     
     @discussion On failure the session will be paused.
     @param session The session that failed.
     @param error The error being reported (see ARError.h).
     */
    func session(_ session: ARSession, didFailWithError error: Error) {
        
    }
    
    
    /**
     This is called when the camera’s tracking state has changed.
     
     @param session The session being run.
     @param camera The camera that changed tracking states.
     */
    func session(_ session: ARSession, cameraDidChangeTrackingState camera: ARCamera) {
        if let geometry = self.geometryNode {
        }
    }
    
    
    /**
     This is called when a session is interrupted.
     
     @discussion A session will be interrupted and no longer able to track when
     it fails to receive required sensor data. This happens when video capture is interrupted,
     for example when the application is sent to the background or when there are
     multiple foreground applications (see AVCaptureSessionInterruptionReason).
     No additional frame updates will be delivered until the interruption has ended.
     @param session The session that was interrupted.
     */
    func sessionWasInterrupted(_ session: ARSession) {
        
    }
    
    
    /**
     This is called when a session interruption has ended.
     
     @discussion A session will continue running from the last known state once
     the interruption has ended. If the device has moved, anchors will be misaligned.
     To avoid this, some applications may want to reset tracking (see ARSessionRunOptions).
     @param session The session that was interrupted.
     */
    func sessionInterruptionEnded(_ session: ARSession) {
        
    }
    
    
    /**
     This is called when the session outputs a new audio sample buffer.
     
     @param session The session being run.
     @param audioSampleBuffer The captured audio sample buffer.
     */
    func session(_ session: ARSession, didOutputAudioSampleBuffer audioSampleBuffer: CMSampleBuffer) {
        
    }
    
}

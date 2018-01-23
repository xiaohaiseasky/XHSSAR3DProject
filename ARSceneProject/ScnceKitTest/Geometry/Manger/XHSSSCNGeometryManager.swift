//
//  XHSSSCNGeometryManager.swift
//  ScnceKitTest
//
//  Created by Apple on 2018/1/22.
//  Copyright © 2018年 XiaoHai. All rights reserved.
//

import UIKit
import SceneKit

class XHSSSCNGeometryManager: NSObject {

}

/**
 Create
 */
extension XHSSSCNGeometryManager {
    static func createPlane() -> SCNNode {
        let plane: SCNPlane = SCNPlane(width: 3, height: 3);
        let planeNode = SCNNode(geometry: plane);
        planeNode.position = SCNVector3(0, 0, 0);
        planeNode.name = "newPlane";
        return planeNode;
    }
    
    static func createBox() -> SCNNode {
        let box: SCNBox = SCNBox(width: 3, height: 3, length: 3, chamferRadius: 0);
        let boxNode = SCNNode(geometry: box);
        boxNode.position = SCNVector3(0, 0, 0);
        boxNode.name = "newBox";
        return boxNode;
    }
    
    static func createPyramid() -> SCNNode {
        let pyramid: SCNPyramid = SCNPyramid(width: 3, height: 3, length: 3);
        let pyramidNode = SCNNode(geometry: pyramid);
        pyramidNode.position = SCNVector3(0, 0, 0);
        pyramidNode.name = "newPyramid";
        return pyramidNode;
    }
    
    static func createSphere() -> SCNNode {
        let sphere: SCNSphere = SCNSphere(radius: 3);
        let sphereNode = SCNNode(geometry: sphere);
        sphereNode.position = SCNVector3(0, 0, 0);
        sphereNode.name = "newSphere";
        return sphereNode;
    }
    
    static func createCylinder() -> SCNNode {
        let cylinder: SCNCylinder = SCNCylinder(radius: 3, height: 3);
        let cylinderNode = SCNNode(geometry: cylinder);
        cylinderNode.position = SCNVector3(0, 0, 0);
        cylinderNode.name = "newCylinder";
        return cylinderNode;
    }
    
    static func createCone() -> SCNNode {
        let cone: SCNCone = SCNCone(topRadius: 1, bottomRadius: 3, height: 3);
        let coneNode = SCNNode(geometry: cone);
        coneNode.position = SCNVector3(0, 0, 0);
        coneNode.name = "newCone";
        return coneNode;
    }
    
    static func createTube() -> SCNNode {
        let tube: SCNTube = SCNTube(innerRadius: 1, outerRadius: 3, height: 3);
        let tubeNode = SCNNode(geometry: tube);
        tubeNode.position = SCNVector3(0, 0, 0);
        tubeNode.name = "newTube";
        return tubeNode;
    }
    
    static func createCapsule() -> SCNNode {
        let capsule: SCNCapsule = SCNCapsule(capRadius: 3, height: 3);
        let capsuleNode = SCNNode(geometry: capsule);
        capsuleNode.position = SCNVector3(0, 0, 0);
        capsuleNode.name = "newCapsule";
        return capsuleNode;
    }
    
    static func createTorus() -> SCNNode {
        let torus: SCNTorus = SCNTorus(ringRadius: 3, pipeRadius: 1);
        let torusNode = SCNNode(geometry: torus);
        torusNode.position = SCNVector3(0, 0, 0);
        torusNode.name = "newTorus";
        return torusNode;
    }
    
    static func createFloor() -> SCNNode {
        let floor: SCNFloor = SCNFloor();
        floor.width = 3.0;
        floor.length = 3.0;
        let floorNode = SCNNode(geometry: floor);
        floorNode.position = SCNVector3(0, 0, 0);
        floorNode.name = "newFloor";
        return floorNode;
    }
    
    static func createText() -> SCNNode {
        let text: SCNText = SCNText(string: "TEXT", extrusionDepth: 3);
        let textNode = SCNNode(geometry: text);
        textNode.position = SCNVector3(0, 0, 0);
        textNode.name = "newText";
        return textNode;
    }
    
    static func createShape() -> SCNNode {
        let shape: SCNShape = SCNShape(path: UIBezierPath(rect: CGRect(x: 0, y: 0, width: 3, height: 3)), extrusionDepth: 3);
        let shapeNode = SCNNode(geometry: shape);
        shapeNode.position = SCNVector3(0, 0, 0);
        shapeNode.name = "newShape";
        return shapeNode;
    }
}

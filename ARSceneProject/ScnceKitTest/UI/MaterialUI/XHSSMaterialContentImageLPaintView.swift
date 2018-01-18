//
//  XHSSMaterialContentImageLPaintView.swift
//  ScnceKitTest
//
//  Created by Apple on 2018/1/11.
//  Copyright © 2018年 XiaoHai. All rights reserved.
//

import UIKit


enum XHSSPathType {
    case XHSSPathTypeCurve
    case XHSSPathTypeLine
    case XHSSPathTypeRect
    case XHSSPathTypeOval
    case XHSSPathTypeRoundedRect
    case XHSSPathTypeRoundedRectbyRoundingCorners
    case XHSSPathTypeArc
    case XHSSPathTypeQuadCurve
    case XHSSPathTypeQuadCurveTwoControlPoint
}

class XHSSMaterialContentImageLPaintView: UIView {
    
    // MARK: - view varible
    var topBar: UIView?;
    var bottomBar: UIView?;
    
    var clearBtn: UIButton?;
    var undoBtn: UIButton?;
    var eraserBtn: UIButton?;
    var finishBtn: UIButton?;
    var cancelBtn: UIButton?;
    
    var lineWidthSlider: UISlider?;
    

    // MARK: - temp varible
    var path: XHSSPath?;
    var pathArr: [AnyObject]? = [];
    var tempPoint: CGPoint?;
    var pathType: XHSSPathType? = .XHSSPathTypeCurve;
    var isAvilablePath: Bool?;
    var lineWidth: CGFloat?;
    var drawColor: UIColor? = UIColor.black;
    
    
    // MARK: - public varible
    typealias XHSSMaterialContentImageLPaintViewFinishCalBack = (UIImage) -> ();
    var finishCallback: XHSSMaterialContentImageLPaintViewFinishCalBack?;
    
    // MARK: - setter & getter
    override var frame: CGRect {
        didSet {
            setupUI();
        }
    }
    
    var image: UIImage? {
        didSet {
            self.pathArr?.append(image!);
            self.setNeedsDisplay();
        }
    }
    
    var btnColorArr: [UIColor]? {
        get {
           return [UIColor.red, UIColor.green, UIColor.blue, UIColor.yellow, UIColor.black, UIColor.cyan, UIColor.purple];
        }
    }
    
    
    // MARK: - private varible
    
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        setup();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension XHSSMaterialContentImageLPaintView {
    
    func setup() {
        self.frame = (UIApplication.shared.keyWindow?.bounds)!;
        
        self.lineWidth = 1;
        self.drawColor = UIColor.black;
        
        setUpGestureRecognezer();
        setupUI();
    }
    
    // MARK: - UI
    func setupUI() {
        self.backgroundColor = UIColor.white;
        
        setupTopBar();
        setupBottomBar();
    }
    
    var kXHSSBaseBtnTag: NSInteger {
        get {
            return 321;
        }
    }
    var kXHSSBaseColorBtnTag: NSInteger  {
        get {
            return 789;
        }
    }
    
    func setupTopBar() {
        if self.topBar != nil {
            self.topBar?.removeFromSuperview();
        }
    
        let totalWidth: CGFloat = self.frame.size.width;
        let topBarH: CGFloat = 70.0;
    
    // topBar
        let topBar: UIView = UIView();
        topBar.frame = CGRect(x: 0, y: 0, width: totalWidth, height: topBarH);
        topBar.backgroundColor = UIColor.lightGray;
        self.addSubview(topBar);
        let topBgView: UIView = UIView();
        topBgView.frame = topBar.bounds;
        topBgView.backgroundColor = UIColor.black;
        topBgView.alpha = 0.4;
        topBar.addSubview(topBgView);
        self.topBar = topBar;
    
        let textColor: UIColor = UIColor.white;
        let borderColor: UIColor = UIColor.blue;
        let cornerRadius: CGFloat = 7.0;
        let borderWidth: CGFloat = 2.0;
    
        let btnW: CGFloat = 60.0;
        let btnH: CGFloat = 30.0;
        let btnX: CGFloat = 10.0;
        let btnY: CGFloat = topBarH - btnH - 7.0;
        let btnSpace: CGFloat = (totalWidth - btnW*5.0 - btnX*2.0)/4.0;
    
        self.clearBtn = UIButton(type: .custom);
        self.clearBtn?.frame = CGRect(x: btnX, y: btnY, width: btnW, height: btnH);
        self.clearBtn?.setTitle("清除", for: .normal);
        self.clearBtn?.layer.cornerRadius = cornerRadius;
        self.clearBtn?.layer.borderColor = borderColor.cgColor;
        self.clearBtn?.layer.borderWidth = borderWidth;
        self.clearBtn?.setTitleColor(textColor, for: .normal);
        self.clearBtn?.backgroundColor = UIColor.blue;
        self.clearBtn?.addTarget(self, action: #selector(XHSSMaterialContentImageLPaintView.topBarBtnColick(btn:)), for: .touchUpInside);
        self.clearBtn?.tag = (kXHSSBaseBtnTag + 0);
        topBar.addSubview(self.clearBtn!);
    
        self.undoBtn = UIButton(type: .custom);
        self.undoBtn?.frame = CGRect(x: btnX + (btnW + btnSpace), y: btnY, width: btnW, height: btnH);
        self.undoBtn?.setTitle("撤销", for: .normal);
        self.undoBtn?.layer.cornerRadius = cornerRadius;
        self.undoBtn?.layer.borderColor = borderColor.cgColor;
        self.undoBtn?.layer.borderWidth = borderWidth;
        self.undoBtn?.setTitleColor(textColor, for: .normal);
        self.undoBtn?.backgroundColor = UIColor.blue;
        self.undoBtn?.addTarget(self, action: #selector(XHSSMaterialContentImageLPaintView.topBarBtnColick(btn:)), for: .touchUpInside);
        self.undoBtn?.tag = (kXHSSBaseBtnTag + 1);
        topBar.addSubview(self.undoBtn!);
    
        self.eraserBtn = UIButton(type: .custom);
        self.eraserBtn?.frame = CGRect(x: btnX + (btnW + btnSpace)*2, y: btnY, width: btnW, height: btnH);
        self.eraserBtn?.setTitle("橡皮擦", for: .normal);
        self.eraserBtn?.layer.cornerRadius = cornerRadius;
        self.eraserBtn?.layer.borderColor = borderColor.cgColor;
        self.eraserBtn?.layer.borderWidth = borderWidth;
        self.eraserBtn?.setTitleColor(textColor, for: .normal);
        self.eraserBtn?.backgroundColor = UIColor.blue;
        self.eraserBtn?.addTarget(self, action: #selector(XHSSMaterialContentImageLPaintView.topBarBtnColick(btn:)), for: .touchUpInside);
        self.eraserBtn?.tag = (kXHSSBaseBtnTag + 2);
        topBar.addSubview(self.eraserBtn!);
        
    
        self.finishBtn = UIButton(type: .custom);
        self.finishBtn?.frame = CGRect(x: btnX + (btnW + btnSpace)*3, y: btnY, width: btnW, height: btnH);
        self.finishBtn?.setTitle("完成", for: .normal);
        self.finishBtn?.layer.cornerRadius = cornerRadius;
        self.finishBtn?.layer.borderColor = borderColor.cgColor;
        self.finishBtn?.layer.borderWidth = borderWidth;
        self.finishBtn?.setTitleColor(textColor, for: .normal);
        self.finishBtn?.backgroundColor = UIColor.blue;
        self.finishBtn?.addTarget(self, action: #selector(XHSSMaterialContentImageLPaintView.topBarBtnColick(btn:)), for: .touchUpInside);
        self.finishBtn?.tag = (kXHSSBaseBtnTag + 3);
        topBar.addSubview(self.finishBtn!);
        
    
        self.cancelBtn = UIButton(type: .custom);
        self.cancelBtn?.frame = CGRect(x: btnX + (btnW + btnSpace)*4, y: btnY, width: btnW, height: btnH);
        self.cancelBtn?.setTitle("取消", for: .normal);
        self.cancelBtn?.layer.cornerRadius = cornerRadius;
        self.cancelBtn?.layer.borderColor = borderColor.cgColor;
        self.cancelBtn?.layer.borderWidth = borderWidth;
        self.cancelBtn?.setTitleColor(textColor, for: .normal);
        self.cancelBtn?.backgroundColor = UIColor.blue;
        self.cancelBtn?.addTarget(self, action: #selector(XHSSMaterialContentImageLPaintView.topBarBtnColick(btn:)), for: .touchUpInside);
        self.cancelBtn?.tag = (kXHSSBaseBtnTag + 4);
        topBar.addSubview(self.cancelBtn!);
    }
    
    func setupBottomBar() {
        if self.bottomBar != nil {
            self.bottomBar?.removeFromSuperview();
        }
    
        let totalWidth: CGFloat = self.frame.size.width;
        let totalHeight: CGFloat = self.frame.size.height;
        let bottomBarH: CGFloat = 77.0;
    
    // bottomBar
        let bottomBar: UIView = UIView();
        bottomBar.frame = CGRect(x: 0, y: totalHeight - bottomBarH, width: totalWidth, height: bottomBarH);
        bottomBar.backgroundColor = UIColor.lightGray;
        self.addSubview(bottomBar);
        let bottomBgView: UIView = UIView();
        bottomBgView.frame = bottomBar.bounds;
        bottomBgView.backgroundColor = UIColor.black;
        bottomBgView.alpha = 0.4;
        bottomBar.addSubview(bottomBgView);
        self.bottomBar = bottomBar;
    
        let btnTitles = ["直线", "曲线", "矩形", "椭圆"];
        let btnX: CGFloat = 10.0;
        let btnY: CGFloat = 10.0;
        let btnSpace: CGFloat = 7.0;
        let btnW: CGFloat = (bottomBar.frame.size.width - (btnX*2.0) - (btnSpace*CGFloat((self.btnColorArr?.count)!)))/CGFloat(self.btnColorArr!.count);
        let btnH: CGFloat = 30.0;
    
        for i: Int in 0..<4 {
            let btn: UILabel = UILabel();
            btn.frame = CGRect(x: btnX + CGFloat((i > 1 ? i+3 : i))*(btnW+btnSpace), y: btnY, width: btnW, height: btnH);
            btn.text = btnTitles[i];
            btn.textColor = UIColor.white;
            btn.backgroundColor = UIColor.blue;
            btn.font = UIFont.systemFont(ofSize: 13);
            btn.textAlignment = .center;
            btn.layer.cornerRadius = 4.0;
            btn.clipsToBounds = true;
            btn.tag = kXHSSBaseColorBtnTag + 123 + i;
            btn.isUserInteractionEnabled = true;
            btn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(XHSSMaterialContentImageLPaintView.barBtnColick(tap:))));
            bottomBar.addSubview(btn);
        }
    
        let sliderX: CGFloat = btnX + (btnW + btnSpace)*2;
        let sliderW: CGFloat = (btnW + btnSpace)*2 + btnW;
    
        self.lineWidthSlider = UISlider();
        self.lineWidthSlider?.frame = CGRect(x: sliderX, y: 10, width: sliderW, height: 30);
        self.lineWidthSlider?.addTarget(self, action: #selector(XHSSMaterialContentImageLPaintView.sliderValueChanged(slider:)), for: .valueChanged)
        self.lineWidthSlider?.minimumValue = 1;
        self.lineWidthSlider?.maximumValue = 70;
        self.lineWidthSlider?.value = 7;
        self.lineWidth = CGFloat((self.lineWidthSlider?.value)!);
        bottomBar.addSubview(self.lineWidthSlider!);
    
        let colorBtnX: CGFloat = 10;
        let colorBtnY: CGFloat = (self.lineWidthSlider?.frame.maxY)! + 10;
        let colorBtnSpace: CGFloat = 7;
        let colorBtnW: CGFloat = (bottomBar.frame.size.width - (colorBtnX*2) - colorBtnSpace*CGFloat((self.btnColorArr?.count)!))/CGFloat(self.btnColorArr!.count);
        let colorBtnH: CGFloat = bottomBarH - colorBtnY - 10;
    
        for i: Int in 0..<(self.btnColorArr?.count)! {
            let colorBtn: UILabel = UILabel();
            colorBtn.frame = CGRect(x: colorBtnX + CGFloat(i)*(colorBtnW + colorBtnSpace), y: colorBtnY, width: colorBtnW, height: colorBtnH);
            colorBtn.backgroundColor = self.btnColorArr?[i];
            colorBtn.layer.cornerRadius = 4;
            colorBtn.clipsToBounds = true;
            colorBtn.tag = kXHSSBaseColorBtnTag + i;
            colorBtn.isUserInteractionEnabled = true;
            colorBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(XHSSMaterialContentImageLPaintView.barBtnColick(tap:))));
            bottomBar.addSubview(colorBtn);
        }
    }
    
    func setUpGestureRecognezer() {
        
    }
}

// MARK: - Action
extension XHSSMaterialContentImageLPaintView {
    @objc func topBarBtnColick(btn: UIButton) {
        if btn.titleLabel?.text == "清除" {
            clear();
        } else if btn.titleLabel?.text == "撤销" {
            undo();
        }  else if btn.titleLabel?.text == "橡皮擦" {
            erase();
        }else if btn.titleLabel?.text == "完成" {
            finish();
        } else if btn.titleLabel?.text == "取消" {
            cancel();
        }
    }
    
    @objc func barBtnColick(tap: UITapGestureRecognizer) {
        let view: UIView = tap.view!;
        if view.tag >= kXHSSBaseColorBtnTag {
            if (view.tag - kXHSSBaseColorBtnTag >= 123) {
                let label: UILabel = view as! UILabel;
                if (label.text == "直线") {
                    self.pathType = .XHSSPathTypeLine;
                } else if (label.text == "曲线") {
                    self.pathType = .XHSSPathTypeCurve;
                } else if (label.text == "矩形") {
                    self.pathType = .XHSSPathTypeRect;
                } else if (label.text == "椭圆") {
                    self.pathType = .XHSSPathTypeOval;
                }
            } else {
                self.drawColor = view.backgroundColor;
            }
        }
    }
    
    @objc func sliderValueChanged(slider: UISlider) {
        self.lineWidth = CGFloat(slider.value);
    }
    
    
    func clear() {
        self.pathArr?.removeAll();
        if let image = self.image {
            self.pathArr?.append(image);
        }
        self.setNeedsDisplay();
    }
    
    func undo() {
        if self.pathArr?.last?.isKind(of: UIImage.self) == true {
            return;
        }
        if let count = self.pathArr?.count {
            if count > 0 {
                self.pathArr?.removeLast();
            }
        }
        self.setNeedsDisplay();
    }
    
    func erase() {
        self.drawColor = UIColor.white;
    }
    
    func finish() {
        if ((self.finishCallback) != nil) {
            self.finishCallback!(generatImage());
        }
        self.removeFromSuperview();
    }
    
    func cancel() {
        if ((self.finishCallback) != nil) {
            //self.finishCallback(nil);
        }
        self.removeFromSuperview();
    }
    
    func generatImage() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, 0);
        let ctx: CGContext = UIGraphicsGetCurrentContext()!;
        self.layer.render(in: ctx);
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!;
        UIGraphicsEndImageContext();
        return image;
    }
}

// MARK: - Touch
extension XHSSMaterialContentImageLPaintView {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch = touches.first!;
        let currentPoint: CGPoint = touch.location(in: self);
        if isPoint(point: currentPoint, inView: self.topBar!) == true ||
            isPoint(point: currentPoint, inView: self.bottomBar!) == true {
            return;
        }

        self.path = XHSSPath();
        self.path?.lineWidth = self.lineWidth!;
        self.path?.pathColor = self.drawColor;
        self.path?.move(to: currentPoint);
        self.pathArr?.append(self.path!);
    
        self.tempPoint = currentPoint;
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch = touches.first!;
        let currentPoint: CGPoint = touch.location(in: self);
        
        if self.path == nil {
            return;
        }
    
        switch self.pathType {
        case .XHSSPathTypeCurve?:            // 在路径中增加一条直线
            addCurve(toPath: self.path!, point: currentPoint)
        case .XHSSPathTypeLine?:         // 在路径中增加一条直线
                addLine(toPath: self.path!, startPoint: self.tempPoint!, endPoint: currentPoint);
        case .XHSSPathTypeOval?:         // 内切于一个矩形的椭圆路径
                paintOvalInRect(firstPoint: self.tempPoint!, secondPoint: currentPoint);
        case .XHSSPathTypeRect?:         // 矩形路径
                paintRect(firstPoint: self.tempPoint!, secondPoint: currentPoint);
        case .XHSSPathTypeRoundedRect?:  // 圆角矩形路径       cornerRadius
                paintRoundedRect(firstPoint: self.tempPoint!,
                                 secondPoint: currentPoint,
                                 cornerRadius: 12);
        case .XHSSPathTypeRoundedRectbyRoundingCorners?: // 可选圆弧位置的圆角矩形路径       byRoundingCorners       cornerRadii
                paintRoundedRect(firstPoint: self.tempPoint!,
                                 secondPoint: currentPoint,
                                 roundingCorners: .topLeft,
                                 cornerRadii: CGSize(width: 10, height: 10));
        case .XHSSPathTypeArc?:          // 圆弧路径       Center      radius       startAngle       endAngle       clockwise
                paintArc(center: self.tempPoint!,
                         radius: sqrt(pow(((self.tempPoint?.x)! - currentPoint.x), 2) + pow(((self.tempPoint?.y)! - currentPoint.y), 2)),
                         startAngle: 0,
                         endAngle: CGFloat(Double.pi),
                         clockwise: true);
            // 在路径中增加一条圆弧
            //[self addArcToPath:_path withCenter:_tempPoint radius:sqrt(pow((_tempPoint.x - currentPoint.x), 2) + pow((_tempPoint.y - currentPoint.y), 2)) startAngle:0 endAngle:M_PI clockwise:YES];
        case .XHSSPathTypeQuadCurve?:    // 在路径中增加一条二次贝塞尔曲线       controlPoint
                addQuadCurve(toPath: self.path!, point: currentPoint, controlPoint: self.tempPoint!);
        case .XHSSPathTypeQuadCurveTwoControlPoint?:     // 在路径中增加一条三次贝塞尔曲线       controlPoint1       controlPoint2
                addQuadCurve(toPath: self.path!, point: currentPoint, controlPoint1: self.tempPoint!, controlPoint2: self.tempPoint!);
            
        default:
            print("invilade shap type");
        }
    
        self.setNeedsDisplay();
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch = touches.first!;
        let currentPoint: CGPoint = touch.location(in: self);
        let lastPoint: CGPoint = touch.previousLocation(in: self);
        
        if lastPoint == currentPoint {};
    }
}

// MARK: - Tool
extension XHSSMaterialContentImageLPaintView {
    func isPoint(point: CGPoint, inView view: UIView) -> Bool {
        let frame: CGRect = view.frame;
        if point.x >= frame.origin.x &&
            point.x <= frame.maxX &&
            point.y >= frame.origin.y &&
            point.y <= frame.maxY {
            return true;
        }
        return false;
    }
}

// MARK: - Path
extension XHSSMaterialContentImageLPaintView {
    // 矩形路径
    func paintRect(firstPoint:CGPoint, secondPoint:CGPoint) {
        self.pathArr?.removeLast();
        
        self.path = XHSSPath(rect: CGRect(x: firstPoint.x,
                                          y: firstPoint.y,
                                          width: secondPoint.x - firstPoint.x,
                                          height: secondPoint.y - firstPoint.y));
        self.path?.lineWidth = self.lineWidth!;
        self.path?.pathColor = self.drawColor;
        self.pathArr?.append(self.path!);
    }
    
    // 内切于一个矩形的椭圆路径
    func paintOvalInRect(firstPoint: CGPoint, secondPoint: CGPoint) {
        self.pathArr?.removeLast();
        self.path = XHSSPath(ovalIn: CGRect(x: firstPoint.x,
                                            y: firstPoint.y,
                                            width: secondPoint.x - firstPoint.x,
                                            height: secondPoint.y - firstPoint.y));
        self.path?.lineWidth = self.lineWidth!;
        self.path?.pathColor = self.drawColor;
        self.pathArr?.append(self.path!);
    }
    
    // 圆角矩形路径
    func paintRoundedRect(firstPoint: CGPoint, secondPoint: CGPoint, cornerRadius: CGFloat) {
        self.pathArr?.removeLast();
        self.path = XHSSPath(roundedRect: CGRect(x: firstPoint.x,
                                                 y: firstPoint.y,
                                                 width: secondPoint.x - firstPoint.x,
                                                 height: secondPoint.y - firstPoint.y),
                             cornerRadius: cornerRadius);
        self.path?.lineWidth = self.lineWidth!;
        self.path?.pathColor = self.drawColor;
        self.pathArr?.append(self.path!);
    }
    
    // 可选圆弧位置的圆角矩形路径
    func paintRoundedRect(firstPoint: CGPoint, secondPoint: CGPoint, roundingCorners: UIRectCorner, cornerRadii: CGSize) {
        self.pathArr?.removeLast();
        self.path = XHSSPath(roundedRect: CGRect(x: firstPoint.x,
                                                 y: firstPoint.y,
                                                 width: secondPoint.x - firstPoint.x,
                                                 height: secondPoint.y - firstPoint.y),
                             byRoundingCorners: roundingCorners,
                             cornerRadii: cornerRadii);
        self.path?.lineWidth = self.lineWidth!;
        self.path?.pathColor = self.drawColor;
        self.pathArr?.append(self.path!);
    }
    
    // 圆弧路径
    func paintArc(center: CGPoint, radius: CGFloat, startAngle: CGFloat, endAngle: CGFloat, clockwise: Bool) {
        self.pathArr?.removeLast();
        self.path = XHSSPath(arcCenter: center,
                             radius: radius,
                             startAngle: startAngle,
                             endAngle: endAngle,
                             clockwise: clockwise);
        self.path?.lineWidth = self.lineWidth!;
        self.path?.pathColor = self.drawColor;
        self.pathArr?.append(self.path!);
    }
    
    func paintArc(firstPoint: CGPoint, secondPoint: CGPoint) {
        self.pathArr?.removeLast();
//        _path = [XHSSPath bezierPathWithArcCenter:CGPointMake((firstPoint.x -secondPoint.x)/2.0f, (firstPoint.y -secondPoint.y)/2.0f)
//            radius:sqrt(pow((firstPoint.x - secondPoint.x), 2) + pow((firstPoint.y - secondPoint.y), 2))
//            startAngle:startAngle
//            endAngle:endAngle
//            clockwise:YES];
        self.path?.lineWidth = self.lineWidth!;
        self.path?.pathColor = self.drawColor;
        self.pathArr?.append(self.path!);
    }
    
    // 在路径中增加一条直线
    func addLine(toPath: UIBezierPath, startPoint: CGPoint, endPoint: CGPoint) {
        self.pathArr?.removeLast();
        self.path = XHSSPath();
        self.path?.lineWidth = self.lineWidth!;
        self.path?.pathColor = self.drawColor;
        self.path?.move(to: startPoint);
        self.path?.addLine(to: endPoint);
        self.pathArr?.append(self.path!);
    }
    
    // 在路径中增加一条曲线
    func addCurve(toPath: UIBezierPath, point: CGPoint) {
        path?.addLine(to: point);
    }
    
    
    // 在路径中增加一条圆弧
    func addArc(toPath: UIBezierPath, center: CGPoint, radius: CGFloat, startAngle: CGFloat, endAngle:CGFloat, clockwise: Bool)  {
        path?.addArc(withCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise);
    }
    
    // 在路径中增加一条二次贝塞尔曲线
    func addQuadCurve(toPath: UIBezierPath, point: CGPoint, controlPoint: CGPoint) {
        path?.addQuadCurve(to: point, controlPoint: controlPoint);
    }
    
    // 在路径中增加一条三次贝塞尔曲线
    func addQuadCurve(toPath: UIBezierPath, point: CGPoint, controlPoint1: CGPoint, controlPoint2: CGPoint) {
        path?.addCurve(to: point, controlPoint1: controlPoint1, controlPoint2: controlPoint2);
    }
}

// MARK: - Paint
extension XHSSMaterialContentImageLPaintView {
    override func draw(_ rect: CGRect) {
        if let pathArr = self.pathArr {
            for path: AnyObject in pathArr {
                if path .isKind(of: UIImage.self) {
                    // 绘制图片
                    let image: UIImage = path as! UIImage;
                    let drawImageRect = CGRect(x: (rect.size.width - image.size.width)/2.0,
                                               y: (rect.size.height - image.size.height)/2.0,
                                               width: image.size.width,
                                               height: image.size.height);
                    image.draw(in: drawImageRect);
                } else {
                    // 画线
                    let realPath = path as! XHSSPath;
                    realPath.pathColor?.set();
                    
                    realPath.stroke();
                }
            }
        }
    }
}

// MARK: - Public
extension XHSSMaterialContentImageLPaintView {
    func show(inView superView: UIView, finishCallBack finish: @escaping XHSSMaterialContentImageLPaintViewFinishCalBack) {
        superView.addSubview(self);
        self.frame = superView.bounds;
        self.finishCallback = finish;
    }
}


class XHSSPath: UIBezierPath {
    var pathColor: UIColor?;
}


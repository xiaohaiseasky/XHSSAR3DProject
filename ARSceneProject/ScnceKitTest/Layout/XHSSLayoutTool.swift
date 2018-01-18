//
//  XHSSLayoutTool.swift
//  ScnceKitTest
//
//  Created by Apple on 2017/12/25.
//  Copyright © 2017年 XiaoHai. All rights reserved.
//

import UIKit

class XHSSLayoutTool: NSObject {

}


extension UIView {
    
    /**
     no use , just for clear warning
     */
    func clearWarning() {
        
    }
    
    
    
    struct RuntimeKey {
        static let floatValueKey = UnsafeRawPointer.init(bitPattern: "xhssFloatValueKey".hashValue)
        /// ...其他Key声明
    }
    
    /**
     adaptationRate
     */
//    - (CGFloat)adaptationRate {
//    id adaptationRateObj = objc_getAssociatedObject(self, _cmd);
//
//    if (adaptationRateObj == nil) {
//    return [UIScreen mainScreen].bounds.size.width/self.baseScreenWidth;
//    }
//
//    return [adaptationRateObj floatValue];
//    }
//
//    - (void)setAdaptationRate:(CGFloat)adaptationRate {
//    objc_setAssociatedObject(self, @selector(adaptationRate), @(adaptationRate), OBJC_ASSOCIATION_ASSIGN);
//    }
    
    var adaptationRate: CGFloat {
        get {
            /// <<<<<<<>>>>>>>
            return self.adaptationRate;
        }
        set(newAdaptationRate) {
            /// <<<<<<<>>>>>>>
            self.adaptationRate = newAdaptationRate;
        }
    }
        
    
    /**
     baseScreenWidth
     */
//    - (CGFloat)baseScreenWidth {
//    id baseScreenWidthObj = objc_getAssociatedObject(self, _cmd);
//    return [baseScreenWidthObj floatValue];
//    }
//
//    - (void)setBaseScreenWidth:(CGFloat)baseScreenWidth {
//    objc_setAssociatedObject(self, @selector(baseScreenWidth), @(baseScreenWidth), OBJC_ASSOCIATION_ASSIGN);
//    }
    
//    - (UIView*(^)(CGFloat baseScreenWidth))laBaseScreenWidth {
//    return ^(CGFloat baseScreenWidth){
//    self.baseScreenWidth = baseScreenWidth;
//    return self;
//    };
//    }
    
    var baseScreenWidth: CGFloat {
        get {
            /// <<<<<<<>>>>>>>
            return self.baseScreenWidth;
        }
        set(newScreenWidth) {
            /// <<<<<<<>>>>>>>
            if newScreenWidth <= 0 {
                self.baseScreenWidth = 375;   // default value is 375
            }
        }
    }
    func layoutBaseScreenWidth(_ baseScreenWidth: CGFloat) -> UIView {
        self.baseScreenWidth = baseScreenWidth;
        self.adaptationRate = UIScreen.main.bounds.size.width/self.baseScreenWidth;
        return self;
    }
    
    //////////////////////////////////////////////////////////////////////////
    
    /**
     float
     */
//    - (CGFloat)xhssFloatValue {
//    id floatObj = objc_getAssociatedObject(self, _cmd);
//    return [floatObj floatValue];
//    }
//    - (void)setXhssFloatValue:(CGFloat)xhssFloatValue {
//    objc_setAssociatedObject(self, @selector(xhssFloatValue), @(xhssFloatValue), OBJC_ASSOCIATION_ASSIGN);
//    }
    var xhssFloatValue: CGFloat {
        get {
            /// <<<<<<<>>>>>>>
            //return self.xhssFloatValue;
            return objc_getAssociatedObject(self, RuntimeKey.floatValueKey!) as! CGFloat;
        }
        set(newFloatValue) {
            /// <<<<<<<>>>>>>>
            //self.xhssFloatValue = newFloatValue;
            objc_setAssociatedObject(self, RuntimeKey.floatValueKey!, newFloatValue, .OBJC_ASSOCIATION_ASSIGN);
        }
    }
    
    /**
     point
     */
//    - (CGPoint)xhssPointValue {
//    id pointObj = objc_getAssociatedObject(self, _cmd);
//    return [pointObj CGPointValue];
//    }
//    - (void)setXhssPointValue:(CGPoint)xhssPointValue {
//    objc_setAssociatedObject(self, @selector(xhssPointValue), [NSValue valueWithCGPoint:xhssPointValue], OBJC_ASSOCIATION_ASSIGN);
//    }
    var xhssPointValue: CGPoint {
        get {
            /// <<<<<<<>>>>>>>
            return self.xhssPointValue;
        }
        set(newPointValue) {
            /// <<<<<<<>>>>>>>
            self.xhssPointValue = newPointValue;
        }
    }
    
    /**
     size
     */
//    - (CGSize)xhssSizeValue {
//    id sizeObj = objc_getAssociatedObject(self, _cmd);
//    return [sizeObj CGSizeValue];
//    }
//    - (void)setXhssSizeValue:(CGSize)xhssSizeValue {
//    objc_setAssociatedObject(self, @selector(xhssSizeValue), [NSValue valueWithCGSize:xhssSizeValue], OBJC_ASSOCIATION_ASSIGN);
//    }
    var xhssSizeValue: CGSize {
        get {
            /// <<<<<<<>>>>>>>
            return self.xhssSizeValue;
        }
        set(newSizeValue) {
            /// <<<<<<<>>>>>>>
            self.xhssSizeValue = newSizeValue;
        }
    }
    
    /**
     rect
     */
//    - (CGRect)xhssRectValue {
//    id rectObj = objc_getAssociatedObject(self, _cmd);
//    return [rectObj CGRectValue];
//    }
//    - (void)setXhssRectValue:(CGRect)xhssRectValue{
//    objc_setAssociatedObject(self, @selector(xhssRectValue), [NSValue valueWithCGRect:xhssRectValue], OBJC_ASSOCIATION_ASSIGN);
//    }
    var xhssRectValue: CGSize {
        get {
            /// <<<<<<<>>>>>>>
            return self.xhssRectValue;
        }
        set(newRectValue) {
            /// <<<<<<<>>>>>>>
            self.xhssRectValue = newRectValue;
        }
    }
    
    
    
    // MARK: - ==============参考视图===============
    //===========================================================
    //===========================================================
    //====    　参考视图
    //===========================================================
    //===========================================================
    
    // MARK: - top
    /**
     保存 self 的 top 以备后续使用
     */
//    - (UIView*(^)(CGFloat topDistance))topDistance {
//    return ^(CGFloat topDistance) {
//    self.xhssFloatValue = topDistance;
//    return self;
//    };
//    }
    func topDistance(_ topDistance: CGFloat) -> UIView {
        self.xhssFloatValue = topDistance;
        return self;
    }
    
    
    /**
     设置上边距时，上侧的参考视图
     */
//    - (UIView*(^)(UIView *topRefView))toTopRefView {
//    return ^(UIView *topRefView) {
//    self.xhssHeight += (self.xhssY -(topRefView.xhssMaxY +self.xhssFloatValue));
//    self.xhssY = topRefView.xhssMaxY + self.xhssFloatValue;
//    return self;
//    };
//    }
    func toTopRefView(_ topRefView: UIView) -> UIView {
        self.xhssHeight += (self.xhssY-(topRefView.xhssMaxY+self.xhssFloatValue));
        self.xhssY = topRefView.xhssMaxY + self.xhssFloatValue;
        return self;
    }
    
//    - (UIView*(^)(UIView *topRefView))toTopRefViewScreenFit {
//    return ^(UIView *topRefView) {
//    self.xhssHeight += (self.xhssY -(topRefView.xhssMaxY +self.xhssFloatValue * self.adaptationRate));
//    self.xhssY = topRefView.xhssMaxY + self.xhssFloatValue * self.adaptationRate;
//    return self;
//    };
//    }
    func toTopRefViewScreenFit(_ topRefView: UIView) -> UIView {
        self.xhssHeight += (self.xhssY-(topRefView.xhssMaxY+self.xhssFloatValue * self.adaptationRate));
        self.xhssY = topRefView.xhssMaxY + self.xhssFloatValue * self.adaptationRate;
        return self;
    }
    
    // MARK: - left
    /**
     保存 self 的 left 以备后续使用
     */
//    - (UIView*(^)(CGFloat leftDistance))leftDistance {
//    return ^(CGFloat leftDistance) {
//    self.xhssFloatValue = leftDistance;
//    return self;
//    };
//    }
    func leftDistance(_ leftDistance: CGFloat) -> UIView {
        self.xhssFloatValue = leftDistance;
        return self;
    }
    
    /**
     设置左边距时，左侧的参考视图
     */
//    - (UIView*(^)(UIView *leftRefView))toLeftRefView {
//    return ^(UIView *leftRefView) {
//    self.xhssWidth += (self.xhssX -(leftRefView.xhssMaxX + self.xhssFloatValue));
//    self.xhssX = leftRefView.xhssMaxX + self.xhssFloatValue;
//    return self;
//    };
//    }
    func toLeftRefView(_ leftRefView: UIView) -> UIView {
        self.xhssWidth += (self.xhssX - (leftRefView.xhssMaxX + self.xhssFloatValue));
        self.xhssX = leftRefView.xhssMaxX + self.xhssFloatValue;
        return self;
    }
    
//    - (UIView*(^)(UIView *leftRefView))toLeftRefViewScreenFit {
//    return ^(UIView *leftRefView) {
//    self.xhssWidth += (self.xhssX -(leftRefView.xhssMaxX + self.xhssFloatValue * self.adaptationRate));
//    self.xhssX = leftRefView.xhssMaxX + self.xhssFloatValue * self.adaptationRate;
//    return self;
//    };
//    }
    func toLeftRefViewScreenFit(_ leftRefView: UIView) -> UIView {
        self.xhssWidth += (self.xhssX - (leftRefView.xhssMaxX + self.xhssFloatValue * self.adaptationRate));
        self.xhssX = leftRefView.xhssMaxX + self.xhssFloatValue * self.adaptationRate;
        return self;
    }
    
    // MARK: - bottom
    /**
     保存 self 的 bottom 以备后续使用
     */
//    - (UIView*(^)(CGFloat bottomDistance))bottomDistance {
//    return ^(CGFloat bottomDistance) {
//    self.xhssFloatValue = bottomDistance;
//    return self;
//    };
//    }
    func bottomDistance(_ bottomDistance: CGFloat) -> UIView {
        self.xhssFloatValue = bottomDistance;
        return self;
    }
    
    /**
     设置下边距时，下侧的参考视图
     */
//    - (UIView*(^)(UIView *bottomRefView))toBottomRefView {
//    return ^(UIView *bottomRefView) {
//    self.xhssMaxY = bottomRefView.xhssY - self.xhssFloatValue;
//    return self;
//    };
//    }
    func toBottomRefView(_ bottomRefView: UIView) -> UIView {
        self.xhssMaxY = bottomRefView.xhssY - self.xhssFloatValue;
        return self;
    }
    
//    - (UIView*(^)(UIView *bottomRefView))toBottomRefViewScreenFit {
//    return ^(UIView *bottomRefView) {
//    self.xhssMaxY = bottomRefView.xhssY - self.xhssFloatValue * self.adaptationRate;
//    return self;
//    };
//    }
    func toBottomRefViewScreenFit(_ bottomRefView: UIView) -> UIView {
        self.xhssMaxY = bottomRefView.xhssY - self.xhssFloatValue * self.adaptationRate;
        return self;
    }
    
    // MARK: - right
    /**
     保存 self 的 right 以备后续使用
     */
//    - (UIView*(^)(CGFloat rightDistance))rightDistance {
//    return ^(CGFloat rightDistance) {
//    self.xhssFloatValue = rightDistance;
//    return self;
//    };
//    }
    func rightDistance(_ rightDistance: CGFloat) -> UIView {
        self.xhssFloatValue = rightDistance;
        return self;
    }
    
    /**
     设置右边距时，右侧的参考视图
     */
//    - (UIView*(^)(UIView *rightRefView))toRightRefView {
//    return ^(UIView *rightRefView) {
//    self.xhssMaxX = rightRefView.xhssX - self.xhssFloatValue;
//    return self;
//    };
//    }
    func toRightRefView(_ rightRefView: UIView) -> UIView {
        self.xhssMaxX = rightRefView.xhssX - self.xhssFloatValue;
        return self;
    }
    
//    - (UIView*(^)(UIView *rightRefView))toRightRefViewScreenFit {
//    return ^(UIView *rightRefView) {
//    self.xhssMaxX = rightRefView.xhssX - self.xhssFloatValue * self.adaptationRate;
//    return self;
//    };
//    }
    func toRightRefViewScreenFit(_ rightRefView: UIView) -> UIView {
        self.xhssMaxX = rightRefView.xhssX - self.xhssFloatValue * self.adaptationRate;
        return self;
    }
    
    // MARK: - width
    /**
     保存 self 的 width 以备后续使用
     */
//    - (UIView*(^)(CGFloat widthValue))widthValue {
//    return ^(CGFloat widthValue) {
//    self.xhssFloatValue = widthValue;
//    return self;
//    };
//    }
    func widthValue(_ widthValue: CGFloat) -> UIView {
        self.xhssFloatValue = widthValue;
        return self;
    }
    
    /**
     设置 width 时的参考视图
     */
//    - (UIView*(^)(UIView *refView))equalToRefViewWidth {
//    return ^(UIView *refView) {
//    self.xhssWidth = refView.xhssWidth;
//    return self;
//    };
//    }
    func equalToRefViewWidth(_ refView: UIView) -> UIView {
        self.xhssWidth = refView.xhssWidth;
        return self;
    }
    
    // MARK: - height
    /**
     保存 self 的 height 以备后续使用
     */
//    - (UIView*(^)(CGFloat heightValue))heightValue {
//    return ^(CGFloat heightValue) {
//    self.xhssFloatValue = heightValue;
//    return self;
//    };
//    }
    func heightValue(_ heightValue: CGFloat) -> UIView {
        self.xhssFloatValue = heightValue;
        return self;
    }
    
    /**
     设置 height 时的参考视图
     */
//    - (UIView*(^)(UIView *refView))equalToRefViewHeight {
//    return ^(UIView *refView) {
//    self.xhssHeight = refView.xhssHeight;
//    return self;
//    };
//    }
    func equalToRefViewHeight(_ refView: UIView) -> UIView {
        self.xhssHeight = refView.xhssHeight;
        return self;
    }
    
    // MARK: - center
    /**
     保存 self 的 center 以备后续使用
     */
//    - (UIView*(^)(CGPoint centerValue))centerValue {
//    return ^(CGPoint centerValue) {
//    self.xhssPointValue = centerValue;
//    return self;
//    };
//    }
    func centerValue(_ centerValue: CGPoint) -> UIView {
        self.xhssPointValue = centerValue;
        return self;
    }
    
    /**
     设置 center 时的参考视图
     */
//    - (UIView*(^)(UIView *refView))equalToRefViewCenter {
//    return ^(UIView *refView) {
//    self.xhssCenter = refView.center;
//    return self;
//    };
//    }
    func equalToRefViewCenter(_ refView: UIView) -> UIView {
        self.xhssCenter = refView.center;
        return self;
    }
    
    // MARK: - origin
    /**
     保存 self 的 origin 以备后续使用
     */
//    - (UIView*(^)(CGPoint orignValue))originValue {
//    return ^(CGPoint orignValue) {
//    self.xhssPointValue = orignValue;
//    return self;
//    };
//    }
    func originValue(_ orignValue: CGPoint) -> UIView {
        self.xhssPointValue = orignValue;
        return self;
    }
    
    /**
     设置 origin 时的参考视图
     */
//    - (UIView*(^)(UIView *refView))equalToRefViewOrigin {
//    return ^(UIView *refView) {
//    self.xhssOrigin = refView.frame.origin;
//    return self;
//    };
//    }
    func equalToRefViewOrigin(_ refView: UIView) -> UIView {
        self.xhssOrigin = refView.frame.origin;
        return self;
    }
    
    // MARK: - bounds
    /**
     保存 self 的 bounds 以备后续使用
     */
//    - (UIView*(^)(CGSize boundsValue))boundsValue {
//    return ^(CGSize boundsValue) {
//    self.xhssSizeValue = boundsValue;
//    return self;
//    };
//    }
    func boundsValue(_ boundsValue: CGSize) -> UIView {
        self.xhssSizeValue = boundsValue;
        return self;
    }
    
    /**
     设置 bounds 时的参考视图
     */
//    - (UIView*(^)(UIView *refView))equalToRefViewBounds {
//    return ^(UIView *refView) {
//    self.xhssBounds = refView.bounds.size;
//    return self;
//    };
//    }
    func equalToRefViewBounds(_ refView: UIView) -> UIView {
        self.xhssBounds = refView.bounds.size;
        return self;
    }
    
    
    // MARK: - ==============固定数值===============
    //===========================================================
    //===========================================================
    //====    固定数值
    //===========================================================
    //===========================================================
    
    /**
     left
     默认只适配 左边到父视图的距离
     */
//    - (UIView*(^)(CGFloat leftValue))leftEqualToNum {
//    return ^(CGFloat leftValue) {
//    self.xhssWidth += (self.xhssX -leftValue);
//    self.xhssX = leftValue;
//    return self;
//    };
//    }
    func leftEqualToNum(_ leftValue: CGFloat) -> UIView {
        self.xhssWidth += (self.xhssX - leftValue);
        self.xhssX = leftValue;
        return self;
    }
    
//    - (UIView*(^)(CGFloat leftValue))leftEqualToNumScreenFit {
//    return ^(CGFloat leftValue) {
//    self.xhssWidth += (self.xhssX -leftValue * self.adaptationRate);
//    self.xhssX = leftValue * self.adaptationRate;
//    return self;
//    };
//    }
    func leftEqualToNumScreenFit(_ leftValue: CGFloat) -> UIView {
        self.xhssWidth += (self.xhssX - leftValue * self.adaptationRate);
        self.xhssX = leftValue * self.adaptationRate;
        return self;
    }
    
    
    /**
     right
     默认只适配 右边到父视图的距离
     */
//    - (UIView*(^)(CGFloat rightValue))rightEqualToNum {
//    return ^(CGFloat rightValue) {
//    self.xhssMaxX = self.superview.xhssWidth - rightValue;
//    return self;
//    };
//    }
    func rightEqualToNum(_ rightValue: CGFloat) -> UIView {
        self.xhssMaxX = (self.superview?.xhssWidth)! - rightValue;
        return self;
    }
    
//    - (UIView*(^)(CGFloat rightValue))rightEqualToNumScreenFit {
//    return ^(CGFloat rightValue) {
//    self.xhssMaxX = self.superview.xhssWidth - rightValue * self.adaptationRate;
//    return self;
//    };
//    }
    func rightEqualToNumScreenFit(_ rightValue: CGFloat) -> UIView {
        self.xhssMaxX = (self.superview?.xhssWidth)! - rightValue * self.adaptationRate;
        return self;
    }
    
    /**
     top
     默认只适配 上边到父视图的距离
     */
//    - (UIView*(^)(CGFloat topValue))topEqualToNum {
//    return ^(CGFloat topValue) {
//    self.xhssHeight += (self.xhssY -topValue);
//    self.xhssY = topValue;
//    return self;
//    };
//    }
    func topEqualToNum(_ topValue: CGFloat) -> UIView {
        self.xhssHeight += (self.xhssY - topValue);
        self.xhssY = topValue;
        return self;
    }
    
//    - (UIView*(^)(CGFloat topValue))topEqualToNumScreenFit {
//    return ^(CGFloat topValue) {
//    self.xhssHeight += (self.xhssY -topValue * self.adaptationRate);
//    self.xhssY = topValue * self.adaptationRate;
//    return self;
//    };
//    }
    func topEqualToNumScreenFit(_ topValue: CGFloat) -> UIView {
        self.xhssHeight += (self.xhssY - topValue * self.adaptationRate);
        self.xhssY = topValue * self.adaptationRate;
        return self;
    }
    
    /**
     bottom
     默认只适配 底边到父视图的距离
     */
//    - (UIView*(^)(CGFloat bottomValue))bottomEqualToNum {
//    return ^(CGFloat bottomValue) {
//    self.xhssMaxY = self.superview.xhssHeight - bottomValue;
//    return self;
//    };
//    }
    func bottomEqualToNum(_ bottomValue: CGFloat) -> UIView {
        self.xhssMaxY = (self.superview?.xhssHeight)! - bottomValue;
        return self;
    }
    
//    - (UIView*(^)(CGFloat bottomValue))bottomEqualToNumScreenFit {
//    return ^(CGFloat bottomValue) {
//    self.xhssMaxY = self.superview.xhssHeight - bottomValue * self.adaptationRate;
//    return self;
//    };
//    }
    func bottomEqualToNumScreenFit(_ bottomValue: CGFloat) -> UIView {
        self.xhssMaxY = (self.superview?.xhssHeight)! - bottomValue * self.adaptationRate;
        return self;
    }
    
    /**
     width
     适配宽度到具体数值
     */
//    - (UIView*(^)(CGFloat widthValue))widthEqualToNum {
//    return ^(CGFloat widthValue) {
//    self.xhssWidth = widthValue;
//    return self;
//    };
//    }
    func widthEqualToNum(_ widthValue: CGFloat) -> UIView {
        self.xhssWidth = widthValue;
        return self;
    }
    
//    - (UIView*(^)(CGFloat widthValue))widthEqualToNumScreenFit {
//    return ^(CGFloat widthValue) {
//    self.xhssWidth = widthValue * self.adaptationRate;
//    return self;
//    };
//    }
    func widthEqualToNumScreenFit(_ widthValue: CGFloat) -> UIView {
        self.xhssWidth = widthValue * self.adaptationRate;
        return self;
    }
    
    /**
     height
     适配高度到具体数值
     */
//    - (UIView*(^)(CGFloat heightValue))heightEqualToNum {
//    return ^(CGFloat heightValue) {
//    self.xhssHeight = heightValue;
//    return self;
//    };
//    }
    func heightEqualToNum(_ heightValue: CGFloat) -> UIView {
        self.xhssHeight = heightValue;
        return self;
    }
    
//    - (UIView*(^)(CGFloat heightValue))heightEqualToNumScreenFit {
//    return ^(CGFloat heightValue) {
//    self.xhssHeight = heightValue * self.adaptationRate;
//    return self;
//    };
//    }
    func heightEqualToNumScreenFit(_ heightValue: CGFloat) -> UIView {
        self.xhssHeight = heightValue * self.adaptationRate;
        return self;
    }
    
    /**
     center
     适配中心点到具体位置
     */
//    - (UIView*(^)(CGPoint centerValue))centerEqualToNum {
//    return ^(CGPoint centerValue) {
//    self.xhssCenter = centerValue;
//    return self;
//    };
//    }
    func centerEqualToNum(_ centerValue: CGPoint) -> UIView {
        self.xhssCenter = centerValue;
        return self;
    }
    
//    - (UIView*(^)(CGPoint centerValue))centerEqualToNumScreenFit {
//    return ^(CGPoint centerValue) {
//    self.xhssCenter = CGPointMake(centerValue.x * self.adaptationRate, centerValue.y * self.adaptationRate);
//    return self;
//    };
//    }
    func centerEqualToNumScreenFit(_ centerValue: CGPoint) -> UIView {
        self.xhssCenter = CGPoint(x: centerValue.x * self.adaptationRate, y: centerValue.y * self.adaptationRate);
        return self;
    }
    
    
    /**
     origin
     适配原点到具体位置
     */
//    - (UIView*(^)(CGPoint originValue))originEqualToNum {
//    return ^(CGPoint originValue) {
//    self.xhssOrigin = originValue;
//    return self;
//    };
//    }
    func originEqualToNum(_ originValue: CGPoint) -> UIView {
        self.xhssOrigin = originValue;
        return self;
    }
    
//    - (UIView*(^)(CGPoint originValue))originEqualToNumScreenFit {
//    return ^(CGPoint originValue) {
//    self.xhssOrigin = CGPointMake(originValue.x * self.adaptationRate, originValue.y * self.adaptationRate);
//    return self;
//    };
//    }
    func originEqualToNumScreenFit(_ originValue: CGPoint) -> UIView {
        self.xhssOrigin = CGPoint(x: originValue.x * self.adaptationRate, y: originValue.y * self.adaptationRate);
        return self;
    }
    
    
    /**
     bounds
       适配边框到具体尺寸
     */
//    - (UIView*(^)(CGSize sizeValue))sizeEqualToNum {
//    return ^(CGSize sizeValue) {
//    CGRect oldBounds = self.bounds;
//    oldBounds.size = sizeValue;
//    self.bounds = oldBounds;
//    return self;
//    };
//    }
    func sizeEqualToNum(_ sizeValue: CGSize) -> UIView {
        var oldBounds = self.bounds;
        oldBounds.size = sizeValue;
        self.bounds = oldBounds;
        return self;
    }
    
//    - (UIView*(^)(CGSize sizeValue))sizeEqualToNumScreenFit {
//    return ^(CGSize sizeValue) {
//    CGRect oldBounds = self.bounds;
//    oldBounds.size = CGSizeMake(sizeValue.width * self.adaptationRate, sizeValue.height * self.adaptationRate);
//    self.bounds = oldBounds;
//    return self;
//    };
//    }
    func sizeEqualToNumScreenFit(_ sizeValue: CGSize) -> UIView {
        var oldBounds = self.bounds;
        oldBounds.size = CGSize(width: sizeValue.width * self.adaptationRate, height: sizeValue.height * self.adaptationRate);
        self.bounds = oldBounds;
        return self;
    }
    
    // MARK: - ==============视图相等==============
    //===========================================================
    //===========================================================
    //====    　视图相等
    //===========================================================
    //===========================================================
    
    /**
     top
     */
//    - (UIView*(^)(UIView  *refView))topEqualToView {
//    return ^(UIView  *refView) {
//    self.xhssHeight += (self.xhssY -refView.xhssY);
//    self.xhssY = refView.xhssY;
//    return self;
//    };
//    }
    func topEqualToView(_ refView: UIView) -> UIView {
        self.xhssHeight += (self.xhssY - refView.xhssY);
        self.xhssY = refView.xhssY;
        return self;
    }
    
//    - (UIView*(^)(UIView  *refView))topEqualToViewTop {
//    return ^(UIView  *refView) {
//    self.xhssHeight += (self.xhssY -refView.xhssY);
//    self.xhssY = refView.xhssY;
//    return self;
//    };
//    };
    func topEqualToViewTop(_ refView: UIView) -> UIView {
        self.xhssHeight += (self.xhssY - refView.xhssY);
        self.xhssY = refView.xhssY;
        return self;
    }
    
//    - (UIView*(^)(UIView  *refView))topEqualToViewCenter {
//    return ^(UIView  *refView) {
//    self.xhssHeight += (self.xhssY -(refView.xhssY +refView.xhssHeight/2.0f));
//    self.xhssY = refView.xhssY;
//    return self;
//    };
//    };
    func topEqualToViewCenter(_ refView: UIView) -> UIView {
        self.xhssHeight += (self.xhssY - (refView.xhssY + refView.xhssHeight/2.0));
        self.xhssY = refView.xhssY;
        return self;
    }
    
//    - (UIView*(^)(UIView  *refView))topEqualToViewBottom {
//    return ^(UIView  *refView) {
//    self.xhssHeight += (self.xhssY -refView.xhssMaxY);
//    self.xhssY = refView.xhssY;
//    return self;
//    };
//    };
    func topEqualToViewBottom(_ refView: UIView) -> UIView {
        self.xhssHeight += (self.xhssY - refView.xhssMaxY);
        self.xhssY = refView.xhssY;
        return self;
    }
    
    /**
     left
     */
//    - (UIView*(^)(UIView  *refView))leftEqualToView {
//    return ^(UIView  *refView) {
//    self.xhssWidth += (self.xhssX -refView.xhssX);
//    self.xhssX = refView.xhssX;
//    return self;
//    };
//    }
    func leftEqualToView(_ refView: UIView) -> UIView {
        self.xhssWidth += (self.xhssX - refView.xhssX);
        self.xhssX = refView.xhssX;
        return self;
    }
    
//    - (UIView*(^)(UIView  *refView))leftEqualToViewLeft {
//    return ^(UIView  *refView) {
//    self.xhssWidth += (self.xhssX -refView.xhssX);
//    self.xhssX = refView.xhssX;
//    return self;
//    };
//    }
    func leftEqualToViewLeft(_ refView: UIView) -> UIView {
        self.xhssWidth += (self.xhssX - refView.xhssX);
        self.xhssX = refView.xhssX;
        return self;
    }
    
//    - (UIView*(^)(UIView  *refView))leftEqualToViewCenter {
//    return ^(UIView  *refView) {
//    self.xhssWidth += (self.xhssX -(refView.xhssX +refView.xhssWidth/2.0f));
//    self.xhssX = refView.xhssX;
//    return self;
//    };
//    }
    func leftEqualToViewCenter(_ refView: UIView) -> UIView {
        self.xhssWidth += (self.xhssX - (refView.xhssX + refView.xhssWidth/2.0));
        self.xhssX = refView.xhssX;
        return self;
    }
    
//    - (UIView*(^)(UIView  *refView))leftEqualToViewRight {
//    return ^(UIView  *refView) {
//    self.xhssWidth += (self.xhssX -refView.xhssMaxX);
//    self.xhssX = refView.xhssX;
//    return self;
//    };
//    }
    func leftEqualToViewRight(_ refView: UIView) -> UIView {
        self.xhssWidth += (self.xhssX - refView.xhssMaxX);
        self.xhssX = refView.xhssX;
        return self;
    }
    
    /**
     bottom
     */
//    - (UIView*(^)(UIView  *refView))bottomEqualToView {
//    return ^(UIView  *refView) {
//    self.xhssMaxY = refView.xhssMaxY;
//    return self;
//    };
//    }
    func bottomEqualToView(_ refView: UIView) -> UIView {
        self.xhssMaxY = refView.xhssMaxY;
        return self;
    }
    
//    - (UIView*(^)(UIView  *refView))bottomEqualToViewTop {
//    return ^(UIView  *refView) {
//    self.xhssMaxY = refView.xhssY;
//    return self;
//    };
//    }
    func bottomEqualToViewTop(_ refView: UIView) -> UIView {
        self.xhssMaxY = refView.xhssY;
        return self;
    }
    
//    - (UIView*(^)(UIView  *refView))bottomEqualToViewCenter {
//    return ^(UIView  *refView) {
//    self.xhssMaxY = refView.xhssMaxY -refView.xhssHeight/2.0f;
//    return self;
//    };
//    }
    func bottomEqualToViewCenter(_ refView: UIView) -> UIView {
        self.xhssMaxY = refView.xhssMaxY - refView.xhssHeight/2.0;
        return self;
    }
    
//    - (UIView*(^)(UIView  *refView))bottomEqualToViewBottom {
//    return ^(UIView  *refView) {
//    self.xhssMaxY = refView.xhssMaxY;
//    return self;
//    };
//    }
    func bottomEqualToViewBottom(_ refView: UIView) -> UIView {
        self.xhssMaxY = refView.xhssMaxY;
        return self;
    }
    
    /**
     right
     */
//    - (UIView*(^)(UIView  *refView))rightEqualToView {
//    return ^(UIView  *refView) {
//    self.xhssMaxX = refView.xhssMaxX;
//    return self;
//    };
//    }
    func rightEqualToView(_ refView: UIView) -> UIView {
        self.xhssMaxX = refView.xhssMaxX;
        return self;
    }

//    - (UIView*(^)(UIView  *refView))rightEqualToViewLeft {
//    return ^(UIView  *refView) {
//    self.xhssMaxX = refView.xhssX;
//    return self;
//    };
//    }
    func rightEqualToViewLeft(_ refView: UIView) -> UIView {
        self.xhssMaxX = refView.xhssX;
        return self;
    }

//    - (UIView*(^)(UIView  *refView))rightEqualToViewCenter {
//    return ^(UIView  *refView) {
//    self.xhssMaxX = refView.xhssMaxX -refView.xhssWidth/2.0f;
//    return self;
//    };
//    }
    func rightEqualToViewCenter(_ refView: UIView) -> UIView {
        self.xhssMaxX = refView.xhssMaxX - refView.xhssWidth/2.0;
        return self;
    }
    
//    - (UIView*(^)(UIView  *refView))rightEqualToViewRight {
//    return ^(UIView  *refView) {
//    self.xhssMaxX = refView.xhssMaxX;
//    return self;
//    };
//    }
    func rightEqualToViewRight(_ refView: UIView) -> UIView {
        self.xhssMaxX = refView.xhssMaxX;
        return self;
    }
    
    /**
     width
     */
//    - (UIView*(^)(UIView  *refView))widthEqualToView {
//    return ^(UIView  *refView) {
//    self.xhssWidth = refView.xhssWidth;
//    return self;
//    };
//    }
    func widthEqualToView(_ refView: UIView) -> UIView {
        self.xhssWidth = refView.xhssWidth;
        return self;
    }
    
    /**
     height
     */
//    - (UIView*(^)(UIView  *refView))heightEqualToView {
//    return ^(UIView  *refView) {
//    self.xhssHeight = refView.xhssHeight;
//    return self;
//    };
//    }
    func heightEqualToView(_ refView: UIView) -> UIView {
        self.xhssHeight = refView.xhssHeight;
        return self;
    }
    
    /**
     center
     */
//    - (UIView*(^)(UIView  *refView))centerEqualToView {
//    return ^(UIView  *refView) {
//    self.xhssCenter = refView.center;
//    return self;
//    };
//    }
    func centerEqualToView(_ refView: UIView) -> UIView {
        self.xhssCenter = refView.center;
        return self;
    }
    
    /**
     center point
     */
//    - (UIView*(^)(UIView  *refView))centerEqualToViewCenterPoint {
//    return ^(UIView  *refView) {
//    self.xhssCenter = CGPointMake(refView.frame.size.width/2.0, refView.frame.size.height/2.0);
//    return self;
//    };
//    }
    func centerEqualToViewCenterPoint(_ refView: UIView) -> UIView {
        self.xhssCenter = CGPoint(x: refView.frame.size.width/2.0, y: refView.frame.size.height/2.0);
        return self;
    }
    
    /// <<<<<<<>>>>>>>
    func centerXEqualToNum(_ centerX: CGFloat) -> UIView {
        self.xhssCenter = CGPoint(x: centerX, y: self.xhssCenter.y);
        return self;
    }
    /// <<<<<<<>>>>>>>
    func centerXEqualToNumScreenFit(_ centerX: CGFloat) -> UIView {
        self.xhssCenter = CGPoint(x: centerX * self.adaptationRate, y: self.xhssCenter.y);
        return self;
    }
    /// <<<<<<<>>>>>>>
    func centerXEqualToView(_ refView: UIView) -> UIView {
        self.xhssCenter = CGPoint(x: refView.xhssCenter.x, y: self.xhssCenter.y);
        return self;
    }
    /// <<<<<<<>>>>>>>
    func centerYEqualToNum(_ centerY: CGFloat) -> UIView {
        self.xhssCenter = CGPoint(x: self.xhssCenter.x, y: centerY);
        return self;
    }
    /// <<<<<<<>>>>>>>
    func centerYEqualToNumScreenFit(_ centerY: CGFloat) -> UIView {
        self.xhssCenter = CGPoint(x: self.xhssCenter.x, y: centerY * self.adaptationRate);
        return self;
    }
    /// <<<<<<<>>>>>>>
    func centerYEqualToView(_ refView: UIView) -> UIView {
        self.xhssCenter = CGPoint(x: self.xhssCenter.x, y: refView.xhssCenter.y);
        return self;
    }
    
    /**
     origin
     */
//    - (UIView*(^)(UIView  *refView))originEqualToView {
//    return ^(UIView  *refView) {
//    self.xhssOrigin = refView.frame.origin;
//    return self;
//    };
//    }
    func originEqualToView(_ refView: UIView) -> UIView {
        self.xhssOrigin = refView.frame.origin;
        return self;
    }
    
    /**
     size
     */
//    - (UIView*(^)(UIView  *refView))sizeEqualToView {
//    return ^(UIView  *refView) {
//    CGRect oldBounds = self.bounds;
//    oldBounds.size = refView.bounds.size;
//    self.bounds = oldBounds;
//    return self;
//    };
//    }
    func sizeEqualToView(_ refView: UIView) -> UIView {
        var oldBounds = self.bounds;
        oldBounds.size = refView.bounds.size;
        self.bounds = oldBounds;
        return self;
    }
    
    // MARK: - ==============对齐===============
    /**
     top
     */
//    - (UIView*(^)(CGFloat  topValue))topAligmentToNum {
//    return ^(CGFloat topValue) {
//    self.xhssY = topValue;
//    return self;
//    };
//    }
    func topAligmentToNum(_ topValue: CGFloat) -> UIView {
        self.xhssY = topValue;
        return self;
    }
    
//    - (UIView*(^)(CGFloat topValue))topAligmentToNumScreenFit {
//    return ^(CGFloat topValue) {
//    self.xhssY = topValue * self.adaptationRate;
//    return self;
//    };
//    }
    func topAligmentToNumScreenFit(_ topValue: CGFloat) -> UIView {
        self.xhssY = topValue * self.adaptationRate;
        return self;
    }
    
//    - (UIView*(^)(UIView  *refView))topAligmentToView {
//    return ^(UIView  *refView) {
//    self.xhssY = refView.xhssY;
//    return self;
//    };
//    }
    func topAligmentToView(_ refView: UIView) -> UIView {
        self.xhssY = refView.xhssY;
        return self;
    }
    
//    - (UIView*(^)(UIView  *refView))topAligmentToViewTop {
//    return ^(UIView  *refView) {
//    self.xhssY = refView.xhssY;
//    return self;
//    };
//    }
    func topAligmentToViewTop(_ refView: UIView) -> UIView {
        self.xhssY = refView.xhssY;
        return self;
    }
    
//    - (UIView*(^)(UIView  *refView))topAligmentToViewCenter {
//    return ^(UIView  *refView) {
//    self.xhssY = refView.xhssY +refView.xhssHeight/2.0f;
//    return self;
//    };
//    }
    func topAligmentToViewCenter(_ refView: UIView) -> UIView {
        self.xhssY = refView.xhssY + refView.xhssHeight/2.0;
        return self;
    }
    
//    - (UIView*(^)(UIView  *refView))topAligmentToViewBotton {
//    return ^(UIView  *refView) {
//    self.xhssY = refView.xhssMaxY;
//    return self;
//    };
//    }
    func topAligmentToViewBotton(_ refView: UIView) -> UIView {
        self.xhssY = refView.xhssMaxY;
        return self;
    }
    
    /**
     left
     */
//    - (UIView*(^)(CGFloat  leftValue))leftAligmentToNum {
//    return ^(CGFloat leftValue) {
//    self.xhssX = leftValue;
//    return self;
//    };
//    }
    func leftAligmentToNum(_ leftValue: CGFloat) -> UIView {
        self.xhssX = leftValue;
        return self;
    }
    
//    - (UIView*(^)(CGFloat  leftValue))leftAligmentToNumScreenFit {
//    return ^(CGFloat leftValue) {
//    self.xhssX = leftValue * self.adaptationRate;
//    return self;
//    };
//    }
    func leftAligmentToNumScreenFit(_ leftValue: CGFloat) -> UIView {
        self.xhssX = leftValue * self.adaptationRate;
        return self;
    }
    
//    - (UIView*(^)(UIView  *refView))leftAligmentToView {
//    return ^(UIView  *refView) {
//    self.xhssX = refView.xhssX;
//    return self;
//    };
//    }
    func leftAligmentToView(_ refView: UIView) -> UIView {
        self.xhssX = refView.xhssX;
        return self;
    }
    
//    - (UIView*(^)(UIView  *refView))leftAligmentToViewLeft {
//    return ^(UIView  *refView) {
//    self.xhssX = refView.xhssX;
//    return self;
//    };
//    }
    func leftAligmentToViewLeft(_ refView: UIView) -> UIView {
        self.xhssX = refView.xhssX;
        return self;
    }
    
//    - (UIView*(^)(UIView  *refView))leftAligmentToViewCenter {
//    return ^(UIView  *refView) {
//    self.xhssX = refView.xhssX +refView.xhssWidth/2.0f;
//    return self;
//    };
//    }
    func leftAligmentToViewCenter(_ refView: UIView) -> UIView {
        self.xhssX = refView.xhssX + refView.xhssWidth/2.0;
        return self;
    }
    
//    - (UIView*(^)(UIView  *refView))leftAligmentToViewRight {
//    return ^(UIView  *refView) {
//    self.xhssX = refView.xhssMaxX;
//    return self;
//    };
//    }
    func leftAligmentToViewRight(_ refView: UIView) -> UIView {
        self.xhssX = refView.xhssMaxX;
        return self;
    }
    
    /**
     bottom             amxx  -> value
     */
//    - (UIView*(^)(CGFloat  bottomValue))bottomAligmentToNum {
//    return ^(CGFloat bottomValue) {
//    self.xhssY = self.superview.xhssHeight - bottomValue - self.xhssHeight;
//    return self;
//    };
//    }
    func bottomAligmentToNum(_ bottomValue: CGFloat) -> UIView {
        self.xhssY = (self.superview?.xhssHeight)! - bottomValue - self.xhssHeight;
        return self;
    }
    
//    - (UIView*(^)(CGFloat  bottomValue))bottomAligmentToNumScreenFit {
//    return ^(CGFloat bottomValue) {
//    self.xhssY = self.superview.xhssHeight - bottomValue*self.adaptationRate - self.xhssHeight;
//    return self;
//    };
//    }
    func bottomAligmentToNumScreenFit(_ bottomValue: CGFloat) -> UIView {
        self.xhssY = (self.superview?.xhssHeight)! - bottomValue*self.adaptationRate - self.xhssHeight;
        return self;
    }
    
//    - (UIView*(^)(UIView  *refView))bottomAligmentToView {
//    return ^(UIView  *refView) {
//    self.xhssY = self.xhssY + (refView.xhssMaxY - self.xhssMaxY);
//    return self;
//    };
//    }
    func bottomAligmentToView(_ refView: UIView) -> UIView {
        self.xhssY = self.xhssY + (refView.xhssMaxY - self.xhssMaxY);
        return self;
    }
    
//    - (UIView*(^)(UIView  *refView))bottomAligmentToViewTop {
//    return ^(UIView  *refView) {
//    self.xhssY = self.xhssY + (refView.xhssY - self.xhssMaxY);
//    return self;
//    };
//    }
    func bottomAligmentToViewTop(_ refView: UIView) -> UIView {
        self.xhssY = self.xhssY + (refView.xhssY - self.xhssMaxY);
        return self;
    }
    
//    - (UIView*(^)(UIView  *refView))bottomAligmentToViewCenter {
//    return ^(UIView  *refView) {
//    self.xhssY = self.xhssY + ((refView.xhssY +refView.xhssHeight/2.0f) - self.xhssMaxY);
//    return self;
//    };
//    }
    func bottomAligmentToViewCenter(_ refView: UIView) -> UIView {
        self.xhssY = self.xhssY + ((refView.xhssY + refView.xhssHeight/2.0) - self.xhssMaxY);
        return self;
    }
    
//    - (UIView*(^)(UIView  *refView))bottomAligmentToViewBotton {
//    return ^(UIView  *refView) {
//    self.xhssY = self.xhssY + (refView.xhssMaxY - self.xhssMaxY);
//    return self;
//    };
//    }
    func bottomAligmentToViewBotton(_ refView: UIView) -> UIView {
        self.xhssY = self.xhssY + (refView.xhssMaxY - self.xhssMaxY);
        return self;
    }
    
    /**
     right
     */
//    - (UIView*(^)(CGFloat  rightValue))rightAligmentToNum {
//    return ^(CGFloat rightValue) {
//    self.xhssX = self.superview.xhssWidth - rightValue - self.xhssWidth;
//    return self;
//    };
//    }
    func rightAligmentToNum(_ rightValue: CGFloat) -> UIView {
        self.xhssX = (self.superview?.xhssWidth)! - rightValue - self.xhssWidth;
        return self;
    }
    
//    - (UIView*(^)(CGFloat  rightValue))rightAligmentToNumScreenFit {
//    return ^(CGFloat rightValue) {
//    self.xhssX = self.superview.xhssWidth - rightValue*self.adaptationRate - self.xhssWidth;
//    return self;
//    };
//    }
    func rightAligmentToNumScreenFit(_ rightValue: CGFloat) -> UIView {
        self.xhssX = (self.superview?.xhssWidth)! - rightValue*self.adaptationRate - self.xhssWidth;
        return self;
    }
    
//    - (UIView*(^)(UIView  *refView))rightAligmentToView {
//    return ^(UIView  *refView) {
//    self.xhssX = self.xhssX + (refView.xhssMaxX - self.xhssMaxX);
//    return self;
//    };
//    }
    func rightAligmentToView(_ refView: UIView) -> UIView {
        self.xhssX = self.xhssX + (refView.xhssMaxX - self.xhssMaxX);
        return self;
    }
    
//    - (UIView*(^)(UIView  *refView))rightAligmentToViewLeft {
//    return ^(UIView  *refView) {
//    self.xhssX = self.xhssX + (refView.xhssX - self.xhssMaxX);
//    return self;
//    };
//    }
    func rightAligmentToViewLeft(_ refView: UIView) -> UIView {
        self.xhssX = self.xhssX + (refView.xhssX - self.xhssMaxX);
        return self;
    }
    
//    - (UIView*(^)(UIView  *refView))rightAligmentToViewCenter {
//    return ^(UIView  *refView) {
//    self.xhssX = self.xhssX + ((refView.xhssX +refView.xhssWidth/2.0f) - self.xhssMaxX);
//    return self;
//    };
//    }
    func rightAligmentToViewCenter(_ refView: UIView) -> UIView {
        self.xhssX = self.xhssX + ((refView.xhssX + refView.xhssWidth/2.0) - self.xhssMaxX);
        return self;
    }
    
//    - (UIView*(^)(UIView  *refView))rightAligmentToViewRight {
//    return ^(UIView  *refView) {
//    self.xhssX = self.xhssX + (refView.xhssMaxX - self.xhssMaxX);
//    return self;
//    };
//    }
    func rightAligmentToViewRight(_ refView: UIView) -> UIView {
        self.xhssX = self.xhssX + (refView.xhssMaxX - self.xhssMaxX);
        return self;
    }

    /**
     center
     */
    /// <<<<<<<>>>>>>>
    func centerXAligmentToNum(_ centerXValue: CGFloat) -> UIView {
        self.xhssCenter = CGPoint(x: centerXValue, y: self.xhssCenter.y);
        return self;
    }
    /// <<<<<<<>>>>>>>
    func centerXAligmentToNumScreenFit(_ centerXValue: CGFloat) -> UIView {
        self.xhssCenter = CGPoint(x: centerXValue * self.adaptationRate, y: self.xhssCenter.y);
        return self;
    }
    /// <<<<<<<>>>>>>>
    func centerXAligmentToView(_ refView: UIView) -> UIView {
        self.xhssCenter = CGPoint(x: refView.xhssCenter.x, y: self.xhssCenter.y);
        return self;
    }
    /// <<<<<<<>>>>>>>
    func centerXAligmentToViewLeft(_ refView: UIView) -> UIView {
        self.xhssCenter = CGPoint(x: refView.xhssX, y: self.xhssCenter.y);
        return self;
    }
    /// <<<<<<<>>>>>>>
    func centerXAligmentToViewCenterX(_ refView: UIView) -> UIView {
        self.xhssCenter = CGPoint(x: refView.xhssX + refView.xhssWidth/2.0, y: self.xhssCenter.y);
        return self;
    }
    /// <<<<<<<>>>>>>>
    func centerXAligmentToViewRight(_ refView: UIView) -> UIView {
        self.xhssCenter = CGPoint(x: refView.xhssMaxX, y: self.xhssCenter.y);
        return self;
    }
    
    /// <<<<<<<>>>>>>>
    func centerYAligmentToNum(_ centerYValue: CGFloat) -> UIView {
        self.xhssCenter = CGPoint(x: self.xhssCenter.x, y: centerYValue);
        return self;
    }
    /// <<<<<<<>>>>>>>
    func centerYAligmentToNumScreenFit(_ centerYValue: CGFloat) -> UIView {
        self.xhssCenter = CGPoint(x: self.xhssCenter.x, y: centerYValue * self.adaptationRate);
        return self;
    }
    /// <<<<<<<>>>>>>>
    func centerYAligmentToView(_ refView: UIView) -> UIView {
        self.xhssCenter = CGPoint(x: self.xhssCenter.x, y: refView.xhssCenter.y);
        return self;
    }
    /// <<<<<<<>>>>>>>
    func centerYAligmentToViewTop(_ refView: UIView) -> UIView {
        self.xhssCenter = CGPoint(x: self.xhssCenter.x, y: refView.xhssY);
        return self;
    }
    /// <<<<<<<>>>>>>>
    func centerYAligmentToViewCenterY(_ refView: UIView) -> UIView {
        self.xhssCenter = CGPoint(x: self.xhssCenter.x, y: refView.xhssY + refView.xhssHeight/2.0);
        return self;
    }
    /// <<<<<<<>>>>>>>
    func centerYAligmentToViewBottom(_ refView: UIView) -> UIView {
        self.xhssCenter = CGPoint(x: self.xhssCenter.x, y: refView.xhssMaxY);
        return self;
    }
    
    // MARK: - ==============平移===============
    /**
     up
     */
//    - (UIView*(^)(CGFloat  topValue))moveUpByNum {
//    return ^(CGFloat topValue) {
//    self.xhssY = self.xhssY - topValue;
//    return self;
//    };
//    }
    func moveUpByNum(_ topValue: CGFloat) -> UIView {
        self.xhssY = self.xhssY - topValue;
        return self;
    }
    
//    - (UIView*(^)(CGFloat  topValue))moveUpByNumScreenFit {
//    return ^(CGFloat topValue) {
//    self.xhssY = self.xhssY - topValue*self.adaptationRate;
//    return self;
//    };
//    }
    func moveUpByNumScreenFit(_ topValue: CGFloat) -> UIView {
        self.xhssY = self.xhssY - topValue*self.adaptationRate;
        return self;
    }
    
//    - (UIView*(^)(CGFloat  topValue))moveUpToNum {
//    return ^(CGFloat topValue) {
//    self.xhssY = topValue;
//    return self;
//    };
//    }
    func moveUpToNum(_ topValue: CGFloat) -> UIView {
        self.xhssY = topValue;
        return self;
    }
    
//    - (UIView*(^)(CGFloat  topValue))moveUpToNumScreenFit {
//    return ^(CGFloat topValue) {
//    self.xhssY = topValue * self.adaptationRate;
//    return self;
//    };
//    }
    func moveUpToNumScreenFit(_ topValue: CGFloat) -> UIView {
        self.xhssY = topValue * self.adaptationRate;
        return self;
    }
    
    /**
     left
     */
//    - (UIView*(^)(CGFloat  leftValue))moveLeftByNum {
//    return ^(CGFloat leftValue) {
//    self.xhssX = self.xhssX - leftValue;
//    return self;
//    };
//    }
    func moveLeftByNum(_ leftValue: CGFloat) -> UIView {
        self.xhssX = self.xhssX - leftValue;
        return self;
    }
    
//    - (UIView*(^)(CGFloat  leftValue))moveLeftByNumScreenFit {
//    return ^(CGFloat leftValue) {
//    self.xhssX = self.xhssX - leftValue*self.adaptationRate;
//    return self;
//    };
//    }
    func moveLeftByNumScreenFit(_ leftValue: CGFloat) -> UIView {
        self.xhssX = self.xhssX - leftValue*self.adaptationRate;
        return self;
    }
    
//    - (UIView*(^)(CGFloat  leftValue))moveLeftToNum {
//    return ^(CGFloat leftValue) {
//    self.xhssX = leftValue;
//    return self;
//    };
//    }
    func moveLeftToNum(_ leftValue: CGFloat) -> UIView {
        self.xhssX = leftValue;
        return self;
    }
    
//    - (UIView*(^)(CGFloat  leftValue))moveLeftToNumScreenFit {
//    return ^(CGFloat leftValue) {
//    self.xhssX = leftValue * self.adaptationRate;
//    return self;
//    };
//    }
    func moveLeftToNumScreenFit(_ leftValue: CGFloat) -> UIView {
        self.xhssX = leftValue * self.adaptationRate;
        return self;
    }
    
    /**
     dwon
     */
//    - (UIView*(^)(CGFloat  dwonValue))moveDwonByNum {
//    return ^(CGFloat dwonValue) {
//    self.xhssY = self.xhssY + dwonValue;
//    return self;
//    };
//    }
    func moveDwonByNum(_ dwonValue: CGFloat) -> UIView {
        self.xhssY = self.xhssY + dwonValue;
        return self;
    }
    
//    - (UIView*(^)(CGFloat  dwonValue))moveDwonByNumScreenFit {
//    return ^(CGFloat dwonValue) {
//    self.xhssY = self.xhssY + dwonValue*self.adaptationRate;
//    return self;
//    };
//    }
    func moveDwonByNumScreenFit(_ dwonValue: CGFloat) -> UIView {
        self.xhssY = self.xhssY + dwonValue*self.adaptationRate;
        return self;
    }
    
//    - (UIView*(^)(CGFloat  dwonValue))moveDwonToNum {
//    return ^(CGFloat dwonValue) {
//    self.xhssMaxY = dwonValue;
//    return self;
//    };
//    }
    func moveDwonToNum(_ dwonValue: CGFloat) -> UIView {
        self.xhssY = dwonValue - self.xhssHeight;
        return self;
    }
    
//    - (UIView*(^)(CGFloat  dwonValue))moveDwonToNumScreenFit {
//    return ^(CGFloat dwonValue) {
//    self.xhssMaxY = dwonValue * self.adaptationRate;
//    return self;
//    };
//    }
    func moveDwonToNumScreenFit(_ dwonValue: CGFloat) -> UIView {
        self.xhssY = dwonValue * self.adaptationRate - self.xhssHeight;
        return self;
    }
    
    /**
     right
     */
//    - (UIView*(^)(CGFloat  rightValue))moveRightByNum {
//    return ^(CGFloat rightValue) {
//    self.xhssX = self.xhssX + rightValue;
//    return self;
//    };
//    }
    func moveRightByNum(_ rightValue: CGFloat) -> UIView {
        self.xhssX = self.xhssX + rightValue;
        return self;
    }
    
//    - (UIView*(^)(CGFloat  rightValue))moveRightByNumScreenFit {
//    return ^(CGFloat rightValue) {
//    self.xhssX = self.xhssX + rightValue*self.adaptationRate;
//    return self;
//    };
//    }
    func moveRightByNumScreenFit(_ rightValue: CGFloat) -> UIView {
        self.xhssX = self.xhssX + rightValue*self.adaptationRate;
        return self;
    }
    
//    - (UIView*(^)(CGFloat  rightValue))moveRightToNum {
//    return ^(CGFloat rightValue) {
//    self.xhssMaxX = rightValue;
//    return self;
//    };
//    }
    func moveRightToNum(_ rightValue: CGFloat) -> UIView {
        self.xhssX = rightValue - self.xhssWidth;
        return self;
    }
    
//    - (UIView*(^)(CGFloat  rightValue))moveRightToNumScreenFit {
//    return ^(CGFloat rightValue) {
//    self.xhssMaxX = rightValue * self.adaptationRate;
//    return self;
//    };
//    }
    func moveRightToNumScreenFit(_ rightValue: CGFloat) -> UIView {
        self.xhssX = rightValue * self.adaptationRate - self.xhssWidth;
        return self;
    }
}

//
//  DrawView.m
//  SingleDraw
//
//  Created by 刘浩浩 on 16/3/31.
//  Copyright © 2016年 CodingFire. All rights reserved.
//

#import "DrawView.h"
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
@implementation DrawView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect

{
    CGContextRef context=UIGraphicsGetCurrentContext();
    
    //画线-------------
    //设置起点
    CGContextMoveToPoint(context, 20, 20);
    //设置终点
    CGContextAddLineToPoint(context, 300, 20);
    //设置线宽
    CGContextSetLineWidth(context, 5);
    //设置颜色
    CGContextSetStrokeColorWithColor(context, [UIColor orangeColor].CGColor);
    //开始画
    CGContextDrawPath(context, kCGPathStroke);
    
    //画圆------------
    //几个参数除了context外，分别是圆心的x，圆心的y，半径，起始角度，结束角度，顺时针逆时针，0为顺时针
    CGContextAddArc(context, 85, 95, 65, 0, M_PI*2, 1);
    //设置线宽
    CGContextSetLineWidth(context, 2);
    //设置线的颜色
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    //开始画圆
    CGContextDrawPath(context, kCGPathStroke);
    
    //画填充圆
    //几个参数除了context外，分别是圆心的x，圆心的y，半径，起始角度，结束角度，顺时针逆时针，0为顺时针
    CGContextAddArc(context, 235, 95, 65, 0, M_PI*2, 1);
    //设置边框颜色
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    //设置填充颜色
    CGContextSetFillColorWithColor(context, [UIColor cyanColor].CGColor);
    //设置线宽
    CGContextSetLineWidth(context, 1);
    //画图并填充(这里的参数要注意了，有填充一定要用带fill的，否则是不会填充的)
    CGContextDrawPath(context, kCGPathFillStroke);
    
    //画三角形
    CGPoint anglePoint[3];
    anglePoint[0]=CGPointMake(70, 105);
    anglePoint[1]=CGPointMake(100, 105);
    anglePoint[2]=CGPointMake(85, 80);
    //参数依次是点的数组和数量
    CGContextAddLines(context, anglePoint, 3);
    //设置线条颜色
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    //把三个点连线封闭起来
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathStroke);
    
    //画填充三角形
    CGPoint anglePoint1[3];
    anglePoint1[0]=CGPointMake(220, 105);
    anglePoint1[1]=CGPointMake(250, 105);
    anglePoint1[2]=CGPointMake(235, 80);
    //参数依次是点的数组和数量
    CGContextAddLines(context, anglePoint1, 3);
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    //设置填充色
    CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
    //把三个点连线封闭起来
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke);
    
    //画一个椭圆
    CGContextAddEllipseInRect(context, CGRectMake(20, 180, 280, 130));
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    CGContextSetLineWidth(context, 6);
    CGContextDrawPath(context, kCGPathStroke);
    
    //画一个矩形
    CGContextAddRect(context, CGRectMake(80, 200, 160, 90));
    CGContextSetStrokeColorWithColor(context, [UIColor greenColor].CGColor);
    CGContextSetLineWidth(context, 4);
    CGContextDrawPath(context, kCGPathStroke);
    
    //画一个圆角矩形
    /*
     CGContextAddArcToPoint(<#CGContextRef  _Nullable c#>, <#CGFloat x1#>, <#CGFloat y1#>, <#CGFloat x2#>, <#CGFloat y2#>, <#CGFloat radius#>)
     x1,y1是startPoint   x2,y2是endPoint   radius是半径
     博主在这里简单解释下这里的核心，这里会有三个点，第一个点是开始画的那个点current point，就是CGContextMoveToPoint移动到的那个点，第二个点是起点，第三个点是终点，当绘制结束后，终点就成为了新的current point，我们知道三个点可以决定一个圆，所以我们要做的就是使这三个点始终能够形成大于0度小于180的角，圆弧是通过与两条直线的夹角形成的切线绘制的，这样就可以绘制出圆角弧度，还是不明白的请留言或者私信
     */
    int X=120;
    int Y=220;
    CGContextMoveToPoint(context, X+10, Y);
    //左上角
    CGContextAddArcToPoint(context, X, Y , X, Y+10, 10);
    //左下角
    CGContextAddArcToPoint(context, X, Y+50 , X+10, Y+50, 10);
    //右下角
    CGContextAddArcToPoint(context, X+80, Y+50 , X+80, Y+40, 10);
    //右上角
    CGContextAddArcToPoint(context, X+80, Y , X+10, Y, 10);
    
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke);
    
    //二次贝塞尔曲线
    //设置起点
    CGContextMoveToPoint(context, 80, 400);
    //设置贝塞尔曲线的控制点坐标和终点坐标
    CGContextAddQuadCurveToPoint(context,140, 300, 220, 400);
    CGContextSetStrokeColorWithColor(context, [UIColor yellowColor].CGColor);
    CGContextSetLineWidth(context, 3);
    CGContextStrokePath(context);
    
    //三次贝塞尔曲线
    //设置起点
    CGContextMoveToPoint(context, 40, 560);
    //设置贝塞尔曲线的控制点坐标和终点坐标
    CGContextAddCurveToPoint(context, 30, 400, 240, 440, 280, 560);
    CGContextSetStrokeColorWithColor(context, [UIColor yellowColor].CGColor);
    CGContextSetLineWidth(context, 3);
    CGContextStrokePath(context);

}

@end

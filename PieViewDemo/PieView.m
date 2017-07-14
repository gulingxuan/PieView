//
//  PieView.m
//  Demo
//
//  Created by 文艺复兴 on 2017/7/10.
//  Copyright © 2017年 顾泠轩. All rights reserved.
//

#import "PieView.h"

@interface PieView()

@end

@implementation PieView

-(void)drawPieWithNumbers:(NSArray *)numArray colorArray:(NSArray *)colorArray duration:(CGFloat)duration smallOvalRadius:(CGFloat)smallRadius
{
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    //圆心
    CGPoint center = CGPointMake(width/2, height/2);
    //整个大圆的半径
    CGFloat bgRadius = width/2-2;
    //内部空白圆形的半径
    CGFloat maskRadius = (bgRadius - smallRadius)/2 + smallRadius;
    //线宽，饼图的宽度
    CGFloat maskLineWidth = bgRadius - smallRadius;
    
    //画比例分布好的饼图
    CALayer *layer;
    NSArray *dataArr = [self changeArray:numArray];
    if (!dataArr || !dataArr.count)
    {
        layer = [self drawCenterPieDataArray:@[@"1"] colorArray:colorArray && colorArray.count ? colorArray : @[[UIColor lightGrayColor]]];
    }
    else
    {
        layer = [self drawCenterPieDataArray:dataArr colorArray:colorArray];
    }
    

    //蒙版
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithArcCenter:center radius:maskRadius startAngle:-1*M_PI/2 endAngle:3*M_PI/2 clockwise:YES];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = maskPath.CGPath;
    maskLayer.fillColor = nil;
    maskLayer.lineJoin = kCALineCapRound;
    maskLayer.lineWidth = maskLineWidth;
    maskLayer.strokeColor = [UIColor whiteColor].CGColor;

    layer.mask = maskLayer;
    [self.layer addSublayer:layer];

    if (duration){
        //动画
        CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        ani.duration = duration;
        ani.fromValue = @0;
        ani.toValue = @1;
        ani.fillMode = kCAFillModeForwards;
        ani.removedOnCompletion = NO;
        [maskLayer addAnimation:ani forKey:@"strokeEndAnimation"];
    }
}

//饼图色块分布图
-(CALayer *)drawCenterPieDataArray:(NSArray *)array colorArray:(NSArray *)colorArray
{
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    CGPoint center = CGPointMake(width/2, height/2);
    //整个大圆的半径
    CGFloat radius = width/2-2;
    
    CALayer *layer = [CALayer layer];
    layer.frame = self.bounds;
    
    //比例分布起始位置
    CGFloat start = -0.25;
    
    for (int i = 0; i < array.count; i++)
    {
        CGFloat end = start + [array[i] floatValue];
        UIColor *color = colorArray[i];
        UIBezierPath *arcBezier;
        if (!i) {
            arcBezier = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:0 endAngle:2*M_PI clockwise:YES];
        }
        else{
            arcBezier = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:start*2*M_PI endAngle:end*2*M_PI clockwise:YES];
        }
        if(i)
        {
            [arcBezier addLineToPoint:center];
        }
        
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.path = arcBezier.CGPath;
        shapeLayer.fillColor = color.CGColor;
        shapeLayer.lineJoin = kCALineJoinRound;
        [layer addSublayer:shapeLayer];
        start = end;
    }
    return layer;
}

//数组值计算
-(NSArray *)changeArray:(NSArray *)arr
{
    NSMutableArray *mArr = [NSMutableArray array];
    if (arr && arr.count) {
        CGFloat account = 0;
        for (int i = 0; i < arr.count; i++)
        {
            account += [arr[i] floatValue];
        }
        if (account)
        {
            for (int i = 0 ; i < arr.count; i++)
            {
                CGFloat temp = [arr[i] floatValue]/account;
                [mArr addObject:[NSString stringWithFormat:@"%.2f",temp]];
            }
        }
        NSLog(@"mArr = \r%@",mArr);
    }
    return mArr;
}





@end

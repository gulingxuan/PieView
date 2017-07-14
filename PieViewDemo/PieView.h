//
//  PieView.h
//  Demo
//
//  Created by 文艺复兴 on 2017/7/10.
//  Copyright © 2017年 顾泠轩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PieView : UIView

/*
    仿支付宝总资产统计饼图
    参数一： 数据数组（NSString，NSNumber的值都行）
    参数二： 颜色数组，colorArray.count >= numArray.count,必须满足这个条件。正常情况colorArray.count == numArray.count
    参数三： 动画时间
    参数四： 中间白色小圆半径
 
    numArray可以为nil，也可以数组内数据和为0，通过colorArr传值可以设置没有值时候的默认颜色；
    numArray的和为0或为nil的时候，colorArr的值可以为nil，默认颜色lightGrayColor
    duration = 0;则没有动画效果
    smallRadius = 0；饼图为实心圆
 
 */


-(void)drawPieWithNumbers:(NSArray *)numArray colorArray:(NSArray *)colorArray duration:(CGFloat)duration smallOvalRadius:(CGFloat)smallRadius;
@end

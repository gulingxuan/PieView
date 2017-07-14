//
//  ViewController.m
//  PieViewDemo
//
//  Created by 文艺复兴 on 2017/7/13.
//  Copyright © 2017年 顾泠轩. All rights reserved.
//

#import "ViewController.h"
#import "PieView.h"

//屏幕宽高
#define SCW [[UIScreen mainScreen] bounds].size.width
#define SCH [[UIScreen mainScreen] bounds].size.height


@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //参数
    NSArray *numArray = @[@"10",@"30",@"25",@"35"];
    NSArray *colorArray = @[[UIColor colorWithRed:1.00 green:0.65 blue:0.26 alpha:1.00],[UIColor colorWithRed:0.99 green:0.42 blue:0.35 alpha:1.00],[UIColor colorWithRed:0.00 green:0.41 blue:0.68 alpha:1.00],[UIColor colorWithRed:0.22 green:0.59 blue:0.98 alpha:1.00]];
    
    //空心圆，数据分布图,仿支付宝总资产
    PieView * hollowOval = [[PieView alloc]initWithFrame:CGRectMake(15, 40,100 , 100)];
    [hollowOval drawPieWithNumbers:numArray colorArray:colorArray duration:1 smallOvalRadius:20];
    [self.view addSubview:hollowOval];
    
    //实心圆
    PieView *Oval = [[PieView alloc]initWithFrame:CGRectMake(130, 40,100 , 100)];
    [Oval drawPieWithNumbers:@[@5,@7,@11] colorArray:colorArray duration:1 smallOvalRadius:0];
    [self.view addSubview:Oval];
    
    //没数据，默认样式,无动画
    PieView *defaultOval = [[PieView alloc]initWithFrame:CGRectMake(15, 160,100 , 100)];
    [defaultOval drawPieWithNumbers:nil colorArray:nil duration:0 smallOvalRadius:0];
    [self.view addSubview:defaultOval];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

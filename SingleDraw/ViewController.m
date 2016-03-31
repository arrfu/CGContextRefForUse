//
//  ViewController.m
//  SingleDraw
//
//  Created by 刘浩浩 on 16/3/31.
//  Copyright © 2016年 CodingFire. All rights reserved.
//

#import "ViewController.h"
#import "DrawView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor whiteColor];
    DrawView *drawView=[[DrawView alloc]initWithFrame:self.view.frame];
    drawView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:drawView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

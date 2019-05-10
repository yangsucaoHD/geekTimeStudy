//
//  ViewController.m
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/9.
//  Copyright © 2019年 郝丹. All rights reserved.
//

#import "ViewController.h"
#import "ViewController+Chain.h"
#import "ViewController+Promise.h"
#import "ViewController+Response.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self chainProgrammingDemo];//链式调用的学习
//    [self responseDemo];//学习RAC各种响应式编程的例子
    [self geekTimeDemo];//学习极客时间22课
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

@end

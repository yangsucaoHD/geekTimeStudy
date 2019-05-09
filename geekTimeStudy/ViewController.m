//
//  ViewController.m
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/9.
//  Copyright © 2019年 郝丹. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>
#import "NSObject+MyCalculate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *view = [[UIView alloc] init];
    [self.view addSubview:view];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.view).offset(10);
    }];
    
    [self hd_makeCalculate:^(CManager * _Nonnull make) {
        make.add(10).add(10).add(10);
    }];
    
}


@end

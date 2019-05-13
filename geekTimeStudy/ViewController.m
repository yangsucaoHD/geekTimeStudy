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
#import "geekTimeStudy-Swift.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self chainProgrammingDemo];//链式调用的学习
//    [self responseDemo];//学习RAC各种响应式编程的例子
//    [self geekTimeDemo];//学习极客时间22课
//    [self promiseTest];//使用swift来调用promiseKit
    
//#################-------PromiseKit在OC中使用-------#################
    //promiseKit使用前调用
    [self jsonPostUrl:@"" params:nil success:^(NSURLSessionDataTask *task, NSDictionary *responseDic) {
        //数据处理
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError *error) {
        //处理出错
    }];//使用promise语法前调用
    
    //promiseKit使用后链式调用
    [self jsonPostUrl:@"" params:nil].then(^(NSDictionary* responseDic){
        //数据处理
    }).thenOn(dispatch_get_main_queue(),^(NSArray* array){
        //指定线程上处理数据 eg.[_tableView reloadData];
    }).catch(^(NSError* error){
        dispatch_async(dispatch_get_main_queue(), ^{
            //处理出错
        });
    });
//#################-------PromiseKit在OC中使用-------#################
    

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

#pragma mark private method test
- (void)promiseTest {
    Test *t = [Test new];
    [t show];
    [t testPromiseKit];
}

@end

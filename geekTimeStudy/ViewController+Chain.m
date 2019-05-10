//
//  ViewController+Chain.m
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/10.
//  Copyright © 2019年 郝丹. All rights reserved.
//

#import "ViewController+Chain.h"
#import <Masonry.h>
#import "NSObject+MyCalculate.h"
#import <JKAlertX.h>
#import "NSString+Manager.h"
#import "ChainFunctionHeader.h"
#import "WBREQUEST.h"
#import "HDRequestMgr.h"
#import "DDMaker.h"

@implementation ViewController (Chain)

#pragma mark - chainProgrammingDemo

- (void)chainProgrammingDemo {
    //学习逻辑思维视频，解析Masonry的源码，了解链式调用的原理
    UIView *view = [[UIView alloc] init];
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.view).offset(10);
    }];
    
    //模仿Masonry链式调用原理，编写一个链式调用的加法器
    [self hd_makeCalculate:^(CManager * _Nonnull make) {
        make.add(10).add(10).add(10);
    }];
    
    //链式调用的一些设计场景，例如字符串的增删改查
    NSString *message = [NSString makeString:^(StringMaker *make) {
        make.append(@"please").append(@" ").append(@"notice this message!!!");
    }];
    
    //链式调用的一些设计场景，例如UI通用组件的AlertView链式调用
    JKAlertView.alertView(@"alert", message, JKAlertStylePlain)
    .setMessageTextFont([UIFont systemFontOfSize:13])
    .setTitleTextFont([UIFont systemFontOfSize:16])
    .show();
    
    JKAlertView.dismissAll();
    
    
    //链式调用的一些设计场景，例如UI通用组件的Button,Label等链式调用,这种没有延用Masonry里面maker
    [self UIchainDemo];
    //链式调用的一些设计场景，例如UI通用组件的Button,Label等链式调用,延用Masonry里面maker
    [self UIchainDemo2];
    
    //链式调用的一些设计场景，例如网络请求的参数配置
    //    WBREQUEST.url(@"http:www.163.com/user/login").parameters(@{@"phone":@"136********",@"passwd":@""}).success(^(NSURLSessionDataTask *task, id responsedObj){
    //        WBLog(@"登录成功");
    //    }).failure(^(NSURLSessionDataTask *task, NSError *error){
    //        WBLog(@"登录失败");
    //    }).startRequest();
    
    
    //自己写的一个网络参数链式调用的demo
    //参考：https://github.com/lanyuzx/iOS-AFNDemo
    [HDNetwork.requestUrl(@"").param(@{@"":@""}) POSTWithSuccess:^(id responceObject){
        
    } failed:^(NSError *error){
        
    }];
}

- (void)UIchainDemo {
    UILabel *label = [[UILabel alloc] init];
    label.labelChain
    .font([UIFont systemFontOfSize:13])
    .text(@"链式作死")
    .textColor([UIColor greenColor])
    .viewMaker()    // 调到view链
    .frame(CGRectMake(20, 100, 100, 40))
    .backgroundColor([UIColor whiteColor])
    .addToSuperView(self.view)
    .labelMaker()   // 回到Label链
    .textAlignment(NSTextAlignmentCenter)
    .layerMaker()   // 调到layer链
    .cornerRadius(5)
    .borderColor([UIColor redColor].CGColor)
    .borderWidth(1.f);
    
    UITextField *tf = [[UITextField alloc] init];
    tf.viewChain
    .frame(CGRectMake(20, 200, 300, 40))
    .addToSuperView(self.view)
    .textFieldMaker()
    .font([UIFont systemFontOfSize:13])
    .placeholder(@"我也只是个textField啊。。")
    .keyboardType(UIKeyboardTypeNumberPad)
    .controlMaker()
    .addTarget(self,@selector(textFieldValueChanged:),UIControlEventEditingChanged)
    .layerMaker()
    .borderColor([UIColor greenColor].CGColor)
    .borderWidth(1.f);
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.buttonChain
    .title(@"我还小啊",UIControlStateNormal)
    .titleFont([UIFont systemFontOfSize:13])
    .titleColor([UIColor yellowColor],UIControlStateNormal)
    .controlMaker()
    .addTarget(self,@selector(clickButton:),UIControlEventTouchUpInside)
    .viewMaker()
    .frame(CGRectMake(50, 300, 80, 40))
    .addToSuperView(self.view);
}

- (void)UIchainDemo2 {
    [UILabel dd_lbMake:^(DDLabelMaker *maker) {
        maker.bgColor([UIColor redColor]).textAlignment(NSTextAlignmentCenter).intoView(self.view).numberOfLines(0);
        maker.textColor([UIColor purpleColor]).boldFontSize(25).frame(CGRectMake(10, 80, 300, 110));
        maker.attributedText([NSMutableAttributedString dd_attributedStringMake:^(DDMutAttributedStringMaker *maker) {
            maker.textColor([UIColor yellowColor]).font([UIFont boldSystemFontOfSize:16]).fontRange([UIFont systemFontOfSize:28], [@"今年" rangeOfString:@"今年"]);
            maker.kern(@4).lineSpacing(10);
            //            maker.specialTextSet(@[@"笑",@"江湖"], @[[UIFont systemFontOfSize:16],[UIFont boldSystemFontOfSize:30]], @[[UIColor cyanColor],[UIColor orangeColor]]);
            maker.specialText(@"江湖", [UIFont systemFontOfSize:16], [UIColor blueColor]);
        } str:@"关于今年新 iPhone 的消息我们已经听到不少，比如传闻中的第二代 iPhone SE，还有配备更大尺寸屏幕的 iPhone X Plus，但这次的新消息则是和充电头有关。来自国外的 ChargerLab 近期曝光了几张疑似是今年新 iPhone 充电头的设计图，它不仅会换用新的 USB Type-C 接口，还会支持 18W 的快充。"]);
    }];
    
    
    //button的创建
    [UIButton dd_btMake:^(DDButtonMaker *maker) {
        maker.intoView(self.view).bgColor([UIColor orangeColor]).frame(CGRectMake(10, 200, 260, 40));
        maker.normalTitle(@"点击一下试试").normalTitleColor([UIColor purpleColor]);
        maker.highlightedTitle(@"高亮了").highlightedTitleColor([UIColor cyanColor]);
        maker.actionBlock(^{
            NSLog(@"单击了button");
        });
        maker.intoView(self.view);
    }];
    //imageView的创建
    [UIImageView dd_imgVMake:^(DDImageViewMaker *maker) {
        maker.intoView(self.view).frame(CGRectMake(10, 260, 80, 80));
        maker.imageName(@"1024");
    }];
    //UIView的创建
    [UIView dd_viewMake:^(DDViewMaker *maker) {
        maker.intoView(self.view).frame(CGRectMake(20, 360, 40, 40));
        maker.bgColor([UIColor yellowColor]);
    }];
}

- (void)clickButton:(UIButton *)sender {
    NSLog(@"我还只是个按钮啊...");
}

- (void)textFieldValueChanged:(UITextField *)textField {
    NSLog(@"textField text:%@",textField.text);
}


@end

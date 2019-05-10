//
//  ViewController+Response.m
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/10.
//  Copyright © 2019年 郝丹. All rights reserved.
//

#import "ViewController+Response.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import <Masonry.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import <ReactiveCocoa/RACEXTScope.h>
#import "SMStudent.h"

@implementation ViewController (Response)
- (void)responseDemo {
    //RAC-->target action   使用RAC再也不用add target,响应的方法写在一块，即为函数式编程
    UITextField *tf = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    tf.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:tf];
    [tf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.view).offset(50);
        make.width.offset(200);
        make.height.offset(50);
    }];
    
    [[tf rac_signalForControlEvents:UIControlEventEditingChanged]
     subscribeNext:^(id x) {
        NSLog(@"change");
    }];
    
    [[tf rac_textSignal]
     subscribeNext:^(id x) {
         NSLog(@"%@",x);
    }];
    
    UITapGestureRecognizer *tap = [UITapGestureRecognizer new];
    [[tap rac_gestureSignal] subscribeNext:^(id x) {
        NSLog(@"tap");
    }];
    [self.view addGestureRecognizer:tap];
    
    
    //RAC-->delegate  局限的，它只能实现返回值为void的代理方法
    //极端一点的例子，一个View里面很多alertView，每个alertview有很多按钮，RAC可以写出简单易维护的代码
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"RAC" message:@"RAC TEST" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"other", nil];
    [[self rac_signalForSelector:@selector(alertView:clickedButtonAtIndex:) fromProtocol:@protocol(UIAlertViewDelegate)] subscribeNext:^(RACTuple *tuple) {
        NSLog(@"%@",tuple.first);
        NSLog(@"%@",tuple.second);
        NSLog(@"%@",tuple.third);
    }];
    [alert show];
    
    //RAC-->NOtification  RAC中的通知不需要remove observer，因为在rac_add方法中他已经写了remove。
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:@"postData" object:nil] subscribeNext:^(NSNotification *notification) {
        NSLog(@"%@", notification.name);
        NSLog(@"%@", notification.object);
    }];
    //RAC-->NOtification 给上面的监听发送消息
    NSMutableArray *dataArray = [[NSMutableArray alloc] initWithObjects:@"1", @"2", @"3", nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"postData" object:dataArray];
    
    //RAC-->KVO  大部分都是宏定义，所以代码异常简洁
    UIScrollView *scrolView = [[UIScrollView alloc] initWithFrame:CGRectMake(100, 150, 200, 400)];
    scrolView.contentSize = CGSizeMake(200, 800);
    scrolView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:scrolView];
    [RACObserve(scrolView, contentOffset) subscribeNext:^(id x) {
        NSLog(@"success");
    }];
}

- (void)geekTimeDemo {//极客时间22课戴銘给出的一个自己设计响应式的例子🌰
    //setupUI
    UILabel *currentCreditLabel = [[UILabel alloc] init];
    currentCreditLabel.textColor = [UIColor lightGrayColor];
    
    UILabel *isSatisfyLabel =  [[UILabel alloc] init];
    isSatisfyLabel.textAlignment = NSTextAlignmentRight;
    isSatisfyLabel.textColor = [UIColor lightGrayColor];
    
    UIButton *testButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [testButton setTitle:@"增加5个积分" forState:UIControlStateNormal];
    [testButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.view addSubview:testButton];
    [testButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];
    
    [self.view addSubview:currentCreditLabel];
    [currentCreditLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(40);
        make.left.equalTo(self.view).offset(40);
    }];
    
    [self.view addSubview:isSatisfyLabel];
    [isSatisfyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(40);
        make.right.equalTo(self.view).offset(-40);
    }];
    

    //present
    SMStudent *student = [[[[[SMStudent create]
                       name:@"ming"]
                      gender:SMStudentGenderMale]
                     studentNumber:345]
                    filterIsASatisfyCredit:^BOOL(NSUInteger credit){
                        if (credit >= 70) {
                            isSatisfyLabel.text = @"合格";
                            isSatisfyLabel.textColor = [UIColor redColor];
                            return YES;
                        } else {
                            isSatisfyLabel.text = @"不合格";
                            return NO;
                        }
                        
                    }];
    
    [[testButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {        
        [student sendCredit:^NSUInteger(NSUInteger credit) {
            credit += 5;
            NSLog(@"current credit %lu",credit);
            [student.creditSubject sendNext:credit];
            return credit;
        }];
    }];
    
    [student.creditSubject subscribeNext:^(NSUInteger credit) {
        NSLog(@"第一个订阅的credit处理积分%lu",credit);
        currentCreditLabel.text = [NSString stringWithFormat:@"%lu",credit];
        if (credit < 30) {
            currentCreditLabel.textColor = [UIColor lightGrayColor];
        } else if(credit < 70) {
            currentCreditLabel.textColor = [UIColor purpleColor];
        } else {
            currentCreditLabel.textColor = [UIColor redColor];
        }
    }];
    
    [student.creditSubject subscribeNext:^(NSUInteger credit) {
        NSLog(@"第二个订阅的credit处理积分%lu",credit);
        if (!(credit > 0)) {
            currentCreditLabel.text = @"0";
            isSatisfyLabel.text = @"未设置";
        }
    }];
}


@end

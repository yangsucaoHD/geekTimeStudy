//
//  MyBlock.m
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/9.
//  Copyright © 2019年 郝丹. All rights reserved.
//

#import "MyBlock.h"

@implementation MyBlock
- (void)test {
    void(^empty)(void) = ^(void) {
        NSLog(@"empty block");
    };
    empty();
    
    
    NSString *(^strBlock)(void) = ^() {
        NSLog(@"parameter block");
        return @"";
    };
    strBlock();
    
    
    NSString *(^str2Block)(NSString *) = ^(NSString *name) {
        NSLog(@"parameter block");
        return name;
    };
    str2Block(@"hello str2Block");
    
    [self getSuccessBlock:^(NSString *name) {
        NSLog(@"%@ hello",name);
    }];
}

- (void)getSuccessBlock:(void(^)(NSString *))successBlock {
    successBlock(@"");
}

- (MyBlock *(^)(NSString *))backBlock {
    return ^(NSString *name) {
        NSLog(@"%@ hello",name);
        return self;
    };
}


@end

//
//  NSObject+MyCalculate.m
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/9.
//  Copyright © 2019年 郝丹. All rights reserved.
//

#import "NSObject+MyCalculate.h"

@implementation NSObject (MyCalculate)
- (int)hd_makeCalculate:(void(NS_NOESCAPE ^)(CManager *make))block {
    CManager *manager = [[CManager alloc] init];
    block(manager);
    return manager.result;
}
@end

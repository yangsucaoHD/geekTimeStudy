//
//  CManager.m
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/9.
//  Copyright © 2019年 郝丹. All rights reserved.
//

#import "CManager.h"

@implementation CManager
- (CManager *(^)(int))add {
    return ^(int value) {
        _result += value;
        return self;
    };
}
@end

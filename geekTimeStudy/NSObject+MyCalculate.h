//
//  NSObject+MyCalculate.h
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/9.
//  Copyright © 2019年 郝丹. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (MyCalculate)
- (int)hd_makeCalculate:(void(NS_NOESCAPE ^)(CManager *make))block;
@end

NS_ASSUME_NONNULL_END

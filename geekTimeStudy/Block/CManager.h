//
//  CManager.h
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/9.
//  Copyright © 2019年 郝丹. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CManager : NSObject
@property (nonatomic,assign) int result;
- (CManager *(^)(int))add;
@end

NS_ASSUME_NONNULL_END

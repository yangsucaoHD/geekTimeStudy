//
//  MyBlock.h
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/9.
//  Copyright © 2019年 郝丹. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NSString *(^nameBlock)(NSString *);
typedef void(^successBlock)(BOOL isSuccess, NSError *error);

NS_ASSUME_NONNULL_BEGIN

@interface MyBlock : NSObject
@property (nonatomic,copy) NSString *(^name)(NSString*);
@property (nonatomic,strong) nameBlock bl;
@property (nonatomic,strong) successBlock successBlock;
@end

NS_ASSUME_NONNULL_END

//
//  DemoRouter.h
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/6/17.
//  Copyright © 2019年 郝丹. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//#import <flutter_boost/FLBPlatform.h>

NS_ASSUME_NONNULL_BEGIN

@interface DemoRouter : NSObject<FLBPlatform>

@property (nonatomic,strong) UINavigationController *navigationController;

+ (DemoRouter *)sharedRouter;


@end

NS_ASSUME_NONNULL_END

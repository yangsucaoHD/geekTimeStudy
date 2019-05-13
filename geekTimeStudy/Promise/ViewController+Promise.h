//
//  ViewController+Promise.h
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/10.
//  Copyright © 2019年 郝丹. All rights reserved.
//

#import "ViewController.h"
#import <PromiseKit.h>

@interface ViewController (Promise)
#pragma mark - public old
-(void)jsonPostUrl:(NSString*)url params:(NSDictionary<NSString *,id>*)params success:(nullable void (^)(NSURLSessionDataTask *task, NSDictionary* responseDic))success
           failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure;

#pragma mark - public new
-(AnyPromise*)jsonPostUrl:(NSString*)url params:(NSDictionary<NSString *,id>*)params;
@end


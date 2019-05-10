//
//  HDRequestMgr.h
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/10.
//  Copyright © 2019年 郝丹. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^successBlock)(id);
typedef void (^failedBlock) (NSError *);
typedef void (^DownloadBlock)(NSString *filePath);
#define HDNetwork [HDRequestMgr sharedInstance]

@interface HDRequestMgr : NSObject
+ (instancetype)sharedInstance;

- (void)POSTWithSuccess:(successBlock)success failed:(failedBlock)failed;
- (void)GETWithsuccess:(successBlock)succrss failed:(failedBlock)failed;

- (HDRequestMgr *(^)(NSString *))requestUrl;
- (HDRequestMgr *(^)(NSDictionary *))param;
@end


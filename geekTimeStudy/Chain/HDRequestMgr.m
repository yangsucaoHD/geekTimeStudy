//
//  HDRequestMgr.m
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/10.
//  Copyright © 2019年 郝丹. All rights reserved.
//

#import "HDRequestMgr.h"
#import <AFNetworking/AFNetworking.h>

static HDRequestMgr *_mgr = nil;
@interface HDRequestMgr ()
@property (nonatomic,copy) NSString * url;
@property (nonatomic,strong) NSDictionary *paramDic;
@end

@implementation HDRequestMgr

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!_mgr) {
            _mgr = [[HDRequestMgr alloc] init];
        }
    });
    return _mgr;
}

- (void)POSTWithSuccess:(successBlock)success failed:(failedBlock)failed {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setValue:@"application/x-www-form-urlencoded;charset=utf8" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer setValue:@"application/x-www-form-urlencoded;charset=utf8" forHTTPHeaderField:@"Content-Type"];
    //请求序列化器
    manager.responseSerializer= [AFHTTPResponseSerializer serializer];
    //解析序列化器
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //配置超时时长
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 15.f;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    manager.responseSerializer.acceptableContentTypes =  [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css",@"text/xml",@"text/plain", @"application/javascript", nil];
    [manager POST:self.url parameters:self.paramDic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failed(error);
    }];
}

- (void)GETWithsuccess:(successBlock)success failed:(failedBlock)failed {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setValue:@"application/x-www-form-urlencoded;charset=utf8" forHTTPHeaderField:@"Content-Type"];
    //请求序列化器
    manager.responseSerializer= [AFHTTPResponseSerializer serializer];
    //解析序列化器
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //配置超时时长
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 15.f;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    manager.responseSerializer.acceptableContentTypes =  [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css",@"text/xml",@"text/plain", @"application/javascript", nil];
    
    [manager GET:self.url parameters:self.paramDic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failed(error);
    }];
}

- (HDRequestMgr *(^)(NSString *))requestUrl {
    return ^(NSString *url){
        self.url = url;
        return self;
    };
}

- (HDRequestMgr *(^)(NSDictionary *))param {
    return ^(NSDictionary *param){
        self.paramDic = param;
        return self;
    };
}
@end

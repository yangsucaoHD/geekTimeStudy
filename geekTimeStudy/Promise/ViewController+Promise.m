//
//  ViewController+Promise.m
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/10.
//  Copyright © 2019年 郝丹. All rights reserved.
//

#import "ViewController+Promise.h"
#import <AFNetworking.h>

@implementation ViewController (Promise)

#pragma mark - public old
-(void)jsonPostUrl:(NSString*)url params:(NSDictionary<NSString *,id>*)params success:(nullable void (^)(NSURLSessionDataTask *task, NSDictionary* responseDic))success
           failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure{
    
    [[self postUrl:url params:params requestType:@"json" success:^(NSURLSessionDataTask *task, id responseObject) {
        if([responseObject isKindOfClass:[NSDictionary class]]){
            NSDictionary* dic = (NSDictionary*)responseObject;
            NSNumber* code = dic[@"code"];
            if(![code isEqual:@0]){
                //                [self.view makeToast:dic[@"msg"] duration:2 position:CSToastPositionCenter];
                if(failure){
                    NSError *err = [NSError errorWithDomain:@"ServiceError" code:code.integerValue userInfo:@{NSLocalizedDescriptionKey: dic[@"msg"]}];
                    failure(task,err);
                }
            }else if(success!=nil){
                success(task,dic);
            }
        }
    } failure:failure]resume];
    
}


#pragma mark - public new
-(AnyPromise*)jsonPostUrl:(NSString*)url params:(NSDictionary<NSString *,id>*)params{
    return [AnyPromise promiseWithResolverBlock:^(PMKResolver resolve) {
        [[self postUrl:url params:params requestType:@"json" success:^(NSURLSessionDataTask *task, id responseObject) {
            if([responseObject isKindOfClass:[NSDictionary class]]){
                NSDictionary* dic = (NSDictionary*)responseObject;
                NSNumber* code = dic[@"code"];
                if(![code isEqual:@0]){
                    //                [self.view makeToast:dic[@"msg"] duration:2 position:CSToastPositionCenter];
                    NSError *err = [NSError errorWithDomain:@"ServiceError" code:code.integerValue userInfo:@{NSLocalizedDescriptionKey: dic[@"msg"]}];
                    resolve(err);
                }else{
                    resolve(dic);
                }
            }
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            resolve(error);
        }] resume];
    }];
    
}


#pragma mark - private

- (NSURLSessionDataTask *)postUrl:(NSString *)url params:(NSDictionary *)params requestType:(NSString *)type success:(void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setValue:@"application/x-www-form-urlencoded;charset=utf8" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer setValue:@"application/x-www-form-urlencoded;charset=utf8" forHTTPHeaderField:@"Content-Type"];
    manager.responseSerializer= [AFHTTPResponseSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 15.f;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    manager.responseSerializer.acceptableContentTypes = type;//[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css",@"text/xml",@"text/plain", @"application/javascript", nil];
    return [manager POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(task,responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(task,error);
    }];
}

@end

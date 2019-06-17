//
//  AppDelegate.m
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/9.
//  Copyright © 2019年 郝丹. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "ViewController+Promise.h"
#import "ABTestViewController.h"
//#import "DemoRouter.h"
#import <FlutterPluginRegistrant/GeneratedPluginRegistrant.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    ViewController *vc = [[ViewController alloc] init];//ViewController ABTestViewController
//    vc.view.backgroundColor = [UIColor whiteColor];
//    
//    self.window.rootViewController = vc;
//    [self.window makeKeyAndVisible];
    [UITabBar appearance].tintColor = [UIColor orangeColor];
    
//    [GeneratedPluginRegistrant registerWithRegistry:self];

//    DemoRouter *router = [DemoRouter sharedRouter];
//    [FlutterBoostPlugin.sharedInstance startFlutterWithPlatform:router
//                                                        onStart:^(FlutterViewController *fvc) {
//
//                                                        }];
//    
//    [GeneratedPluginRegistrant registerWithRegistry:self]; // Only if you are using Flutter plugins.
//    return [_lifeCycleDelegate application:application didFinishLaunchingWithOptions:launchOptions];
    
    
    return YES;

    
}

- (int)getBatteryLevel {
    UIDevice* device = UIDevice.currentDevice;
    device.batteryMonitoringEnabled = YES;
    if (device.batteryState == UIDeviceBatteryStateUnknown) {
        return -1;
    } else {
        return (int)(device.batteryLevel * 100);
    }
}

@end

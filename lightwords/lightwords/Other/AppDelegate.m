//
//  AppDelegate.m
//  lightwords
//
//  Created by wangxiangyu on 16/3/1.
//  Copyright © 2016年 com.qingyu. All rights reserved.
//

#import "AppDelegate.h"
#import "QYMainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    QYMainViewController * controller=[[QYMainViewController alloc]init];
    self.window.rootViewController=controller;
    return YES;
}



@end

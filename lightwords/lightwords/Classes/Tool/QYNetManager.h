//
//  QYNetManager.h
//  lightwords
//
//  Created by wangxiangyu on 16/3/2.
//  Copyright © 2016年 com.qingyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QYNetManager : AFHTTPSessionManager

// 封装 Get 请求，成功和失败分开处理
+ (void)getDataWithParam:(NSDictionary *)params andPath:(NSString *)path andComplete:(void (^)(BOOL success, id result))complete;

// 封装 Post 请求，成功和失败在一个 block 里面处理
+ (void)postWithParam:(NSDictionary *)params andPath:(NSString *)path andComplete:(void (^)(BOOL success, id result))complete;
@end

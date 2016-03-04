//
//  QYNetManager.m
//  lightwords
//
//  Created by wangxiangyu on 16/3/2.
//  Copyright © 2016年 com.qingyu. All rights reserved.
//

#import "QYNetManager.h"



@implementation QYNetManager

+(AFHTTPSessionManager *)qySharedManager{
    static QYNetManager *_qySharedManager=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
       	_qySharedManager = [[super alloc]init];
        // 设置网络请求 SSL 功能，使用（HTTPS）时开启
        //		_shareManager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        
        _qySharedManager.requestSerializer.timeoutInterval = 10;
        
        _qySharedManager.responseSerializer = [AFJSONResponseSerializer serializer];
    
        _qySharedManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/xml", @"text/plain", nil];
        
        // 当手机处于无网络状态时，必须给出提示，不然会被拒绝。
        [self isReachToWeb];
    });
    return _qySharedManager;
}

+ (void)isReachToWeb {
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown: {
                WLog(@"未知错误");
                break;
            }
            case AFNetworkReachabilityStatusNotReachable: {
                WLog(@"无网络");
                break;
            }
            case AFNetworkReachabilityStatusReachableViaWWAN: {
                WLog(@"通过wlan");
                break;
            }
            case AFNetworkReachabilityStatusReachableViaWiFi: {
                WLog(@"通过wifi");
                break;
            }
        }
        
    }];
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}


+(void)postWithParam:(NSDictionary *)params andPath:(NSString *)path andComplete:(void (^)(BOOL, id))complete{
//    NSDictionary *mainParams=@{SHOWAPI_APPID:SHOWAPI_APPID_VALUE,SHOWAPI_SIGN:SHOWAPI_SIGN_VALUE,SHOWAPI_TIMESTAMP:SHOWAPI_TIMESTAMP_VALUE};
  [[self qySharedManager] POST:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
      complete(YES, responseObject);
  } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
      complete(NO, error.localizedDescription);
  }];
}
+(void)getDataWithParam:(NSDictionary *)params andPath:(NSString *)path andComplete:(void (^)(BOOL, id))complete{
   [[self qySharedManager]GET:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
     //  id jsonDate=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
       complete(YES, responseObject);
       
   } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       complete(NO, error.localizedDescription);
   }];
}
@end

//
//  QYLatestNewsModel.m
//  lightwords
//
//  Created by MacBook on 16/3/4.
//  Copyright © 2016年 com.qingyu. All rights reserved.
//

#import "QYLatestNewsModel.h"

@implementation QYLatestNewsModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"imageurls" : [QYImageURL class]};
}


@end

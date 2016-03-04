//
//  QYLatestNewsModel.h
//  lightwords
//
//  Created by MacBook on 16/3/4.
//  Copyright © 2016年 com.qingyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QYImageURL.h"

@interface QYLatestNewsModel : NSObject



@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *channelId;

@property (nonatomic, strong) NSArray<QYImageURL *> *imageurls;

@property (nonatomic, copy) NSString *channelName;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *link;

@property (nonatomic, copy) NSString *pubDate;

@property (nonatomic, copy) NSString *desc;

@end


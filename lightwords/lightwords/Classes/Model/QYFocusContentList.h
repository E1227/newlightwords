//
//  QYFocusContentList.h
//  lightwords
//
//  Created by wangxiangyu on 16/3/4.
//  Copyright © 2016年 com.qingyu. All rights reserved.
//

#import <Foundation/Foundation.h>


@class QYFocusImageUrl;
@interface QYFocusContentList : NSObject


@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *channelId;

@property (nonatomic, strong) NSArray<QYFocusImageUrl *> *imageurls;

@property (nonatomic, copy) NSString *channelName;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *link;

@property (nonatomic, copy) NSString *pubDate;

@property (nonatomic, copy) NSString *desc;



@end





//
//  QYFocusDetail.h
//  lightwords
//
//  Created by wangxiangyu on 16/3/8.
//  Copyright © 2016年 com.qingyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QYFocusDetailImageUrl.h"

@interface QYFocusDetail : NSObject


@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, strong) NSArray<QYFocusDetailImageUrl *> *img_list;

@property (nonatomic, assign) NSInteger ret_code;

@property (nonatomic, copy) NSString *html;

@property (nonatomic, copy) NSString *time;

@end




//
//  UIBarButtonItem+Extension.h
//  百思不得姐wxy
//
//  Created by wangxiangyu on 16/2/23.
//  Copyright © 2016年 wangxiangyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

+(UIBarButtonItem *)itemWithImage:(NSString *)imageName highlightImage:(NSString *)highlightImageName  target:(id)target action:(SEL)action;
@end

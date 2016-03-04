//
//  UIBarButtonItem+Extension.m
//  百思不得姐wxy
//
//  Created by wangxiangyu on 16/2/23.
//  Copyright © 2016年 wangxiangyu. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)
+(UIBarButtonItem *)itemWithImage:(NSString *)imageName highlightImage:(NSString *)highlightImageName  target:(id)target action:(SEL)action{
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setBackgroundImage:[[UIImage imageNamed:highlightImageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateHighlighted];
    button.adjustsImageWhenHighlighted=NO;
  //  btn.adjustsImageWhenHighlighted = NO;
    [button addTarget:target action:action forControlEvents:(UIControlEventTouchUpInside)];
    button.size=button.currentBackgroundImage.size;
    return [[UIBarButtonItem alloc]initWithCustomView:button];
}
@end

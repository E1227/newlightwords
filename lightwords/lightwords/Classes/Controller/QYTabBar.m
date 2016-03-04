//
//  QYTabBar.m
//  lightwords
//
//  Created by wangxiangyu on 16/3/1.
//  Copyright © 2016年 com.qingyu. All rights reserved.
//

#import "QYTabBar.h"

@interface QYTabBar ()
@property (nonatomic,weak)UIButton *publishButton;
@end

@implementation QYTabBar

-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        UIButton *publishButton=[UIButton buttonWithType:UIButtonTypeCustom];
        [publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [self addSubview:publishButton];
        self.publishButton=publishButton;
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    //    self.publishButton.frame.size=CGSizeMake(self.publishButton.currentBackgroundImage.size.width, self.publishButton.currentBackgroundImage.size.height);
    self.publishButton.bounds=CGRectMake(0, 0, self.publishButton.currentBackgroundImage.size.width, self.publishButton.currentBackgroundImage.size.height);
    self.publishButton.center=CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    NSInteger index=0;
    for (UIView *button in self.subviews) {
        
        // if (![button isKindOfClass:[UIControl class]]||button==self.publishButton) continue;//这也是可以的
        if (![button isKindOfClass:NSClassFromString(@"UITabBarButton")]) continue;
        CGFloat width=self.bounds.size.width/5;
        CGFloat height=self.bounds.size.height;
        CGFloat x=width*(index>1?index+1:index);
        CGFloat y=0;
        button.frame=CGRectMake(x, y, width, height);
        index++;
    }
    
}
@end

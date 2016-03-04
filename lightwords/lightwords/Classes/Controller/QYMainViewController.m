//
//  QYMainViewController.m
//  lightwords
//
//  Created by wangxiangyu on 16/3/1.
//  Copyright © 2016年 com.qingyu. All rights reserved.
//

#import "QYMainViewController.h"
#import "QYNavigationController.h"
#import "QYTabBar.h"
#import "QYLatestNewsViewController.h"

@interface QYMainViewController ()

@end

@implementation QYMainViewController



- (void)viewDidLoad {
    [super viewDidLoad];

    //设置tabbar item的appearance
    [self setTabBarItemAppearance];
    //添加4个控制器
    UIViewController * vc1=[[UIViewController alloc]init];
    [self setChildVc:vc1:@"精华" :@"tabBar_essence_icon":@"tabBar_essence_click_icon"];
    [self setChildVc:[QYLatestNewsViewController new]:@"最新" : @"tabBar_new_icon":@"tabBar_new_click_icon"];
    [self setChildVc:[UIViewController new] :@"关注" : @"tabBar_friendTrends_icon":@"tabBar_friendTrends_click_icon"];
    [self setChildVc:[UIViewController new] :@"我" :@"tabBar_me_icon" :@"tabBar_me_click_icon"];
    [self setValue:[[QYTabBar alloc]init] forKey:@"tabBar"];
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];
}


//设置子控制器
-(void)setChildVc:(UIViewController *)ctrler :(NSString *)title :(NSString *)image :(NSString *)selectedImage{
    ctrler.tabBarItem.title=title;
    ctrler.tabBarItem.image=[UIImage imageNamed:image];
    ctrler.tabBarItem.selectedImage=[[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    QYNavigationController * navVC=[[QYNavigationController alloc]initWithRootViewController:ctrler];
    [navVC.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    [self addChildViewController:navVC];
    
}

//设置UITabBarItem的appearance
-(void)setTabBarItemAppearance{
    NSMutableDictionary *attrs=[[NSMutableDictionary alloc]init];
    attrs[NSForegroundColorAttributeName]=[UIColor grayColor];
    
    NSMutableDictionary *seletedAttrs=[[NSMutableDictionary alloc]init];
    seletedAttrs[NSForegroundColorAttributeName]=[UIColor darkGrayColor];
    
    UITabBarItem *item=[UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:seletedAttrs forState:UIControlStateSelected];
}
@end

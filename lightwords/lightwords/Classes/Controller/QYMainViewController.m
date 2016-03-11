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
#import "QYFocusViewController.h"
#import "QYMineViewController.h"
@interface QYMainViewController ()

@end

@implementation QYMainViewController



- (void)viewDidLoad {
    [super viewDidLoad];

    //设置tabbar item的appearance
//    [self setTabBarItemAppearance];
    //添加4个控制器
    
    [self setChildVc:[QYFocusViewController new]:@"精华" :@"tabBar_essence_icon":@"tabBar_essence_click_icon"];
    [self setChildVc:[QYLatestNewsViewController new]:@"最新" : @"tabBar_new_icon":@"tabBar_new_click_icon"];
    [self setChildVc:[UIViewController new] :@"关注" : @"tabBar_friendTrends_icon":@"tabBar_friendTrends_click_icon"];
    [self setChildVc:[QYMineViewController new] :@"我" :@"tabBar_me_icon" :@"tabBar_me_click_icon"];
    [self setValue:[[QYTabBar alloc]init] forKey:@"tabBar"];

    //    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];
    
    // 设置夜间模式的颜色 和日间模式的颜色
    self.tabBar.dk_barTintColorPicker = DKColorWithColors([UIColor whiteColor], [UIColor colorWithWhite:0.2 alpha:0.8]);
}


//设置子控制器
-(void)setChildVc:(UIViewController *)ctrler :(NSString *)title :(NSString *)image :(NSString *)selectedImage{
    ctrler.tabBarItem.title=title;
    ctrler.tabBarItem.image=[UIImage imageNamed:image];
    ctrler.tabBarItem.selectedImage=[[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    QYNavigationController * navVC=[[QYNavigationController alloc]initWithRootViewController:ctrler];
    navVC.navigationBar.dk_barTintColorPicker = DKColorWithColors([UIColor whiteColor], [UIColor colorWithWhite:0.2 alpha:0.8]);
    [self addChildViewController:navVC];
    
    NSMutableDictionary *attrs=[[NSMutableDictionary alloc]init];
    attrs[NSForegroundColorAttributeName]=[UIColor grayColor];
    
    NSMutableDictionary *seletedAttrs=[[NSMutableDictionary alloc]init];
    seletedAttrs[NSForegroundColorAttributeName]=[UIColor darkGrayColor];
    [ctrler.tabBarItem setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [ctrler.tabBarItem setTitleTextAttributes:seletedAttrs forState:UIControlStateSelected];
    
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

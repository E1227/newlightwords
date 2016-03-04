//
//  QYNavigationController.m
//  lightwords
//
//  Created by wangxiangyu on 16/3/1.
//  Copyright © 2016年 com.qingyu. All rights reserved.
//

#import "QYNavigationController.h"

@interface QYNavigationController ()

@end

@implementation QYNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animate{
    viewController.navigationItem.backBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:nil action:nil];
    [super pushViewController:viewController animated:animate];
}


@end

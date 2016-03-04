//
//  QYAlertViewController.m
//  lightwords
//
//  Created by MacBook on 16/3/4.
//  Copyright © 2016年 com.qingyu. All rights reserved.
//

#import "QYAlertViewController.h"

@implementation QYAlertViewController

+(void)qyAlertViewControllerFrom:(UIViewController *)controller andTitle:(NSString *)title message:(NSString *)message cancleBtnName:(NSString *)cancleBtnName otherAction:(NSString *)actionName handler:(void (^)(UIAlertAction *))handler
{
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:cancleBtnName style:UIAlertActionStyleCancel handler:nil]];
    
    if (actionName) {
        
        [alert addAction:[UIAlertAction actionWithTitle:actionName style:UIAlertActionStyleDefault handler:handler]];
    }
    
    [controller presentViewController:alert animated:YES completion:^{
        
    }];
    
    

}


@end

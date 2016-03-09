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

+ (void)showTitle:(NSString *)title message:(NSString *)message
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:title message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:nil, nil];
    [alert show];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [alert dismissWithClickedButtonIndex:0 animated:YES];
    });
    
}


@end

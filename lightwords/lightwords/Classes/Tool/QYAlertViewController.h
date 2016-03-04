//
//  QYAlertViewController.h
//  lightwords
//
//  Created by MacBook on 16/3/4.
//  Copyright © 2016年 com.qingyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QYAlertViewController : UIAlertController


/**
 *  alert样式
 *
 *  @param controller    当前控制器
 *  @param title         窗口title
 *  @param message       窗口message
 *  @param cancleBtnName 取消按钮显示的文字
 *  @param actionName    其他按钮显示的文字(可无)
 *  @param handler       其他按钮点击事件
 */
+ (void)qyAlertViewControllerFrom:(UIViewController *)controller andTitle:(NSString *)title message:(NSString *)message cancleBtnName:(NSString *)cancleBtnName otherAction:(NSString *)actionName handler:(void (^)(UIAlertAction *action))handler;

// sheet 样式需要再添加

@end

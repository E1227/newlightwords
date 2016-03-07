//
//  QYNewsClassPickView.h
//  lightwords
//
//  Created by MacBook on 16/3/7.
//  Copyright © 2016年 com.qingyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QYNewsClassPickView : UIScrollView


@property (nonatomic ,copy)NSArray *newsClassArray;

@property (nonatomic ,copy)void(^newsClassBtnClickBlock)(NSInteger index);

- (void)setCurrentSelectedBtn:(NSInteger)index;


@end

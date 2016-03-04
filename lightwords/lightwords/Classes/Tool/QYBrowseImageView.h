//
//  QYBrowseImageView.h
//  lightwords
//
//  Created by MacBook on 16/3/3.
//  Copyright © 2016年 com.qingyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QYBrowseImageView : UIView

- (id)initWithCards:(NSArray*)cards andSize:(CGSize)size;
- (void)show;

@end

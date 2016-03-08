//
//  QYFocusCell.h
//  lightwords
//
//  Created by wangxiangyu on 16/3/4.
//  Copyright © 2016年 com.qingyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QYFocusContentList.h"
@interface QYFocusNewsCell : UITableViewCell
@property (nonatomic,strong) QYFocusContentList *model;
+(instancetype)focusNewsCellWithTableView:(UITableView *)tableView reuseIdentifier:(NSString *)reuseIdentifier;
@end

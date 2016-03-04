//
//  QYLatestNewsCell.h
//  lightwords
//
//  Created by MacBook on 16/3/3.
//  Copyright © 2016年 com.qingyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QYLatestNewsModel.h"

@interface QYLatestNewsCell : UITableViewCell


@property (nonatomic ,strong)QYLatestNewsModel *model;

+ (instancetype)latestNewsCellWithTableView:(UITableView *)tableView identifier:(NSString *)identifier;

@end

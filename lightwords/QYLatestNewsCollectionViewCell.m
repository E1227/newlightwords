//
//  QYLatestNewsCollectionViewCell.m
//  lightwords
//
//  Created by MacBook on 16/3/7.
//  Copyright © 2016年 com.qingyu. All rights reserved.
//

#import "QYLatestNewsCollectionViewCell.h"



@implementation QYLatestNewsCollectionViewCell


-(void)setTableView:(QYLatestNewsTableView *)tableView
{
    // 让之前的view删除
    [_tableView.view removeFromSuperview];
    _tableView = tableView;
    // 新传进来的view显示
    [self.contentView addSubview:tableView.view];
    
}



@end

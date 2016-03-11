//
//  QYFocusCollectionViewCell.h
//  lightwords
//
//  Created by wangxiangyu on 16/3/9.
//  Copyright © 2016年 com.qingyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QYFocusDetailViewController.h"
typedef void (^pushDetailBlock)(QYFocusDetailViewController *detailVC);

@interface QYFocusCollectionViewCell : UICollectionViewCell
@property (nonatomic ,copy)NSString *channelId;

@property (nonatomic ,weak)UITableView *tableView;
@property (nonatomic,copy)pushDetailBlock pushDetailBlock;

@property (nonatomic ,strong)NSMutableArray *dataArray;
- (void)loadData;
@end

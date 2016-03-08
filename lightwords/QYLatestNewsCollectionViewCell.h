//
//  QYLatestNewsCollectionViewCell.h
//  lightwords
//
//  Created by MacBook on 16/3/7.
//  Copyright © 2016年 com.qingyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QYLatestNewsCollectionViewCell : UICollectionViewCell



@property (nonatomic ,copy)NSString *channelId;

@property (nonatomic ,weak)UITableView *tableView;

@property (nonatomic ,strong)NSMutableArray *dataArray;
- (void)loadData;


@end

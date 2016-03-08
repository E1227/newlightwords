//
//  QYLatestNewsCollectionViewCell.m
//  lightwords
//
//  Created by MacBook on 16/3/7.
//  Copyright © 2016年 com.qingyu. All rights reserved.
//

#import "QYLatestNewsCollectionViewCell.h"
#import <MJRefresh.h>
#import "QYLatestNewsCell.h"


@interface QYLatestNewsCollectionViewCell ()<UITableViewDataSource,UITableViewDelegate>




@end



@implementation QYLatestNewsCollectionViewCell


- (NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        UITableView * tableView = [[UITableView alloc]initWithFrame:self.bounds style:UITableViewStylePlain];
        [self.contentView addSubview:tableView];
        tableView.backgroundColor = [UIColor colorWithWhite:1 alpha:1];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
        self.tableView = tableView;
        [tableView.mj_header beginRefreshing];
        
        tableView.delegate = self;
        tableView.dataSource = self;
    }
    return self;
}

#pragma mark <===========UITableViewDataSource===========>


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *reusableId = @"LatestNewsCell";
    
    QYLatestNewsCell *cell = [QYLatestNewsCell latestNewsCellWithTableView:tableView identifier:reusableId];
    
    cell.model = self.dataArray[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 290;
}


- (void)loadData {
    
    NSString * url = @"http://route.showapi.com/109-35";
    
    NSDate * date = [NSDate date];
    
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyyMMddHHmmss"];
    NSString * dateStr = [formatter stringFromDate:date];
    
    
    NSDictionary * parametes = @{
                                 @"showapi_appid":@"16332",
                                 @"showapi_sign":@"025a4f865952403eb0c8f1aa67c3c171",
                                 @"showapi_timestamp":dateStr,
                                 @"channelId":self.channelId
                                 };
    
    [QYNetManager getDataWithParam:parametes andPath:url andComplete:^(BOOL success, NSDictionary * result) {
        if (success) {
            
            [self.dataArray removeAllObjects];
            
            NSArray * array = result[@"showapi_res_body"][@"pagebean"][@"contentlist"];
            
            for (NSDictionary * dict in array) {
                
                QYLatestNewsModel * model = [QYLatestNewsModel modelWithDictionary:dict];
                
                [self.dataArray addObject:model];
                
            }
            
            [self.tableView reloadData];
            [self.tableView.mj_header endRefreshing];            
        }else {
            
            [QYAlertViewController showTitle:@"刷新失败" message:@"请检查网络"];
            
        }
        
    }];
    
}




@end

//
//  QYFocusCollectionViewCell.m
//  lightwords
//
//  Created by wangxiangyu on 16/3/9.
//  Copyright © 2016年 com.qingyu. All rights reserved.
//

#import "QYFocusCollectionViewCell.h"
#import <MJRefresh.h>
#import "QYFocusNewsCell.h"


@interface QYFocusCollectionViewCell ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation QYFocusCollectionViewCell
-(NSMutableArray *)dataArray{
    if (_dataArray==nil) {
        _dataArray=[NSMutableArray array];
    }
    return  _dataArray;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        UITableView *tableview=[[UITableView alloc]initWithFrame:self.bounds style:UITableViewStylePlain];
        [self.contentView addSubview:tableview];
        tableview.delegate=self;
        tableview.dataSource=self;
        self.tableView=tableview;
        tableview.backgroundColor=[UIColor whiteColor];
        tableview.separatorStyle=UITableViewCellSeparatorStyleNone;
        tableview.mj_header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
        [tableview.mj_header beginRefreshing];
    }
    return self;
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
                                 @"channelId":self.channelId,
                                 
                                 };
   
    [QYNetManager getDataWithParam:parametes andPath:url andComplete:^(BOOL success, NSDictionary * result) {
        if (success) {
    
            [self.dataArray removeAllObjects];
            
            NSArray * array = result[@"showapi_res_body"][@"pagebean"][@"contentlist"];
            for (NSDictionary * dict in array) {
                
                QYFocusContentList * model = [QYFocusContentList modelWithDictionary:dict];
                
                [self.dataArray addObject:model];
                
            }
            [self.tableView reloadData];
            [self.tableView.mj_header endRefreshing];
            
        }else {
            [QYAlertViewController showTitle:@"刷新失败" message:@"请检查网络"];
        }
        
    }];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    QYFocusContentList *list=self.dataArray[indexPath.row];
    NSString *link=list.link;
    QYFocusDetailViewController *detailVC=[[QYFocusDetailViewController alloc]init];
    [detailVC setLink:link];
    self.pushDetailBlock(detailVC);
    //根据list取到link，根据link push到一个详情页面

    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *reusableId = @"FocusNewsCell";
    
    QYFocusNewsCell *cell = [QYFocusNewsCell focusNewsCellWithTableView:tableView reuseIdentifier:reusableId];
    cell.model = self.dataArray[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 290;
}
@end

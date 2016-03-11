//
//  QYLatestNewsTableView.m
//  lightwords
//
//  Created by MacBook on 16/3/11.
//  Copyright © 2016年 com.qingyu. All rights reserved.
//

#import "QYLatestNewsTableView.h"
#import <MJRefresh.h>
#import "QYLatestNewsCell.h"

@interface QYLatestNewsTableView ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic ,weak)UITableView *tableView;

@property (nonatomic ,strong)NSMutableArray *dataArray;


@end

@implementation QYLatestNewsTableView

- (NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
        UITableView * tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        [self.view addSubview:tableView];
        tableView.dk_backgroundColorPicker = DKColorWithColors([UIColor whiteColor], [UIColor blackColor]);
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
        self.tableView = tableView;
        [tableView.mj_header beginRefreshing];
        
        tableView.delegate = self;
        tableView.dataSource = self;

        self.automaticallyAdjustsScrollViewInsets = NO;
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    
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

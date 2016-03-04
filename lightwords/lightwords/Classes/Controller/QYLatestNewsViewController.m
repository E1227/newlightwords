//
//  QYLatestNewsViewController.m
//  lightwords
//
//  Created by MacBook on 16/3/3.
//  Copyright © 2016年 com.qingyu. All rights reserved.
//

#import "QYLatestNewsViewController.h"
#import "QYLatestNewsCell.h"
#import "QYLatestNewsModel.h"

@interface QYLatestNewsViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic ,weak)UITableView *tableView;

@property (nonatomic ,strong)NSMutableArray *dataArray;


@end

@implementation QYLatestNewsViewController

- (NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.view.backgroundColor = [UIColor whiteColor];
        
#warning 设置分类按钮
        //        self.navigationItem.titleView = [[UIView alloc]init];
        
        // 暂时显示
        self.navigationItem.title = @"最新";
        self.automaticallyAdjustsScrollViewInsets = NO;
        
        
        
    }
    return self;
}

- (void)loadSubViews {
    
    // 创建tableView
    UITableView * tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    self.tableView = tableView;
    [self.view addSubview:tableView];
    
    // 添加约束
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(@64);
        make.top.equalTo(@WNavigationBarHeight);
        make.top.equalTo(@64);
        make.bottom.equalTo(@(-WTabBarHeight));
        make.left.right.equalTo(@0);
        
    }];
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
    
    [self.tableView.mj_header beginRefreshing];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadSubViews];
    
    
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
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
                                 @"channelId":@"5572a108b3cdc86cf39001d8",
                                 
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
            
            [QYAlertViewController qyAlertViewControllerFrom:self andTitle:@"失败" message:@"请检查网络" cancleBtnName:@"确定" otherAction:nil handler:nil];
        }
        
    }];
    
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
    return 160;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end



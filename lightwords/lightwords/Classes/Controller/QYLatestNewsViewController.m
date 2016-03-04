//
//  QYLatestNewsViewController.m
//  lightwords
//
//  Created by MacBook on 16/3/3.
//  Copyright © 2016年 com.qingyu. All rights reserved.
//

#import "QYLatestNewsViewController.h"
#import "QYLatestNewsCell.h"

@interface QYLatestNewsViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic ,weak)UITableView *tableView;

@end

@implementation QYLatestNewsViewController


- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.view.backgroundColor = [UIColor whiteColor];
        
#warning 设置分类按钮
//        self.navigationItem.titleView = [[UIView alloc]init];
        
        // 暂时显示
        self.navigationItem.title = @"最新";
        self.automaticallyAdjustsScrollViewInsets = NO;
        
        [self loadSubViews];
        
        
        
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
    
    tableView.backgroundColor = WArcColor;
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
    
    
}

- (void)loadData {
    
    NSString * url = @"http://route.showapi.com/109-35?showapi_appid=16332&showapi_sign=025a4f865952403eb0c8f1aa67c3c171&showapi_timestamp=20160304102011&channelId=5572a108b3cdc86cf39001d8";
    
    [QYNetManager getDataWithParam:nil andPath:url andComplete:^(BOOL success, id result) {
        if (success) {
            
            NSLog(@"%@",result);
            
        }else {
            
            [QYAlertViewController qyAlertViewControllerFrom:self andTitle:@"失败" message:@"请检查网络" cancleBtnName:@"确定" otherAction:nil handler:nil];
        }
        
    }];
    
}


#pragma mark <===========UITableViewDataSource===========>


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *reusableId = @"LatestNewsCell";
    
    QYLatestNewsCell *cell = [QYLatestNewsCell latestNewsCellWithTableView:tableView identifier:reusableId];
    

    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
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

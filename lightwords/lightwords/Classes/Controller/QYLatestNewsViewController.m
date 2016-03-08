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
#import "QYNewsClassPickView.h"
#import "QYLatestNewsCollectionViewCell.h"


#define QYNesClassPickViewHeight 40

#define QYNEWSCLASSPICKKEY @"QYNEWSCLASSPICKKEY"

@interface QYLatestNewsViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic ,weak)QYNewsClassPickView *newsClassPickView;

@property (nonatomic ,strong)NSArray *newsClassArray;
@property (nonatomic ,weak)UICollectionView *collectionView;


@end

@implementation QYLatestNewsViewController

- (NSArray *)newsClassArray
{
    if (_newsClassArray == nil) {
        
        // 从userdefault中去当前存储的新闻分类
        _newsClassArray = [[NSUserDefaults standardUserDefaults] objectForKey:QYNEWSCLASSPICKKEY];
        if (_newsClassArray == nil) {
            // 如果不存在 则创建,默认的
            
           _newsClassArray =  @[
             @{   @"channelId": @"5572a109b3cdc86cf39001db",
                  @"name": @"国内最新"
             },
             @{
                 @"channelId": @"5572a109b3cdc86cf39001dc",
                 @"name": @"台湾最新"
             },
             @{
                 @"channelId": @"5572a109b3cdc86cf39001dd",
                 @"name": @"港澳最新"
             },
             @{
                 @"channelId": @"5572a109b3cdc86cf39001de",
                 @"name": @"国际最新"
             },
             @{
                 @"channelId": @"5572a109b3cdc86cf39001df",
                 @"name": @"军事最新"
             },
             @{
                 @"channelId": @"5572a109b3cdc86cf39001e0",
                 @"name": @"财经最新"
             },
             @{
                 @"channelId": @"5572a109b3cdc86cf39001e1",
                 @"name": @"理财最新"
             },
             @{
                 @"channelId": @"5572a109b3cdc86cf39001e2",
                 @"name": @"宏观经济最新"
             },
             @{
                 @"channelId": @"5572a109b3cdc86cf39001e3",
                 @"name": @"互联网最新"
             },
             @{
                 @"channelId": @"5572a109b3cdc86cf39001e4",
                 @"name": @"房产最新"
             },
             @{
                 @"channelId": @"5572a109b3cdc86cf39001e5",
                 @"name": @"汽车最新"
             },
             @{
                 @"channelId": @"5572a109b3cdc86cf39001e6",
                 @"name": @"体育最新"
             },
             @{
                 @"channelId": @"5572a10ab3cdc86cf39001e7",
                 @"name": @"国际足球最新"
             },
             @{
                 @"channelId": @"5572a10ab3cdc86cf39001e8",
                 @"name": @"国内足球最新"
             },
             @{
                 @"channelId": @"5572a10ab3cdc86cf39001e9",
                 @"name": @"CBA最新"
             },
             @{
                 @"channelId": @"5572a10ab3cdc86cf39001ea",
                 @"name": @"综合体育最新"
             },
             @{
                 @"channelId": @"5572a10ab3cdc86cf39001eb",
                 @"name": @"娱乐最新"
             },
             @{
                 @"channelId": @"5572a10ab3cdc86cf39001ec",
                 @"name": @"电影最新"
             },
             @{
                 @"channelId": @"5572a10ab3cdc86cf39001ed",
                 @"name": @"电视最新"
             },
             @{
                 @"channelId": @"5572a10ab3cdc86cf39001ee",
                 @"name": @"游戏最新"
             },
             @{
                 @"channelId": @"5572a10ab3cdc86cf39001ef",
                 @"name": @"教育最新"
             },
             @{
                 @"channelId": @"5572a10ab3cdc86cf39001f0",
                 @"name": @"女人最新"
             },
             @{
                 @"channelId": @"5572a10ab3cdc86cf39001f1",
                 @"name": @"美容护肤最新"
             },
             @{
                 @"channelId": @"5572a10ab3cdc86cf39001f2",
                 @"name": @"情感两性最新"
             },
             @{
                 @"channelId": @"5572a10ab3cdc86cf39001f3",
                 @"name": @"健康养生最新"
             },
             @{
                 @"channelId": @"5572a10ab3cdc86cf39001f4",
                 @"name": @"科技最新"
             },
             @{
                 @"channelId": @"5572a10bb3cdc86cf39001f5",
                 @"name": @"数码最新"
             },
             @{
                @"channelId": @"5572a10bb3cdc86cf39001f6",
                 @"name": @"电脑最新"
             },
             @{
                 @"channelId": @"5572a10bb3cdc86cf39001f7",
                 @"name": @"科普最新"
             },
             @{
                 @"channelId": @"5572a10bb3cdc86cf39001f8",
                 @"name": @"社会最新"
             }
             
             ];
            
            // 本地持久化
            [[NSUserDefaults standardUserDefaults]setObject:_newsClassArray forKey:QYNEWSCLASSPICKKEY];
            [[NSUserDefaults standardUserDefaults] synchronize];

            
        }
    }
    return _newsClassArray;
}


- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
        UIButton * titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [titleBtn setTitle:@"推荐" forState:UIControlStateNormal];
        [titleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [titleBtn addTarget:self action:@selector(titleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        self.navigationItem.titleView = titleBtn;
        
        self.automaticallyAdjustsScrollViewInsets = NO;
        
        
    }
    return self;
}

- (void)loadSubViews {
    
    self.view.backgroundColor = [UIColor whiteColor];
    // 创建头部滚动选着新闻种类view
    QYNewsClassPickView * newsClass = [[QYNewsClassPickView alloc]initWithFrame:CGRectMake(0, WNavigationBarHeight, WScreenWidth, QYNesClassPickViewHeight)];
    self.newsClassPickView = newsClass;
    [self.view addSubview:newsClass];
    
    
    NSMutableArray * array = [NSMutableArray array];
    for (NSDictionary * dict in self.newsClassArray) {
        
        [array addObject:dict[@"name"]];
        
    }
    
    newsClass.newsClassArray = array;
    
    [newsClass setNewsClassBtnClickBlock:^(NSInteger index) {
        
        [UIView animateWithDuration:0.25 animations:^{
            [self.collectionView setContentOffset:CGPointMake(index * WScreenWidth, 0) animated:NO];
        }];
        
        
    }];
    
    
    
    // 创建横向滑动的collectionview
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    layout.itemSize = CGSizeMake(WScreenWidth, WScreenHeight - (WNavigationBarHeight + QYNesClassPickViewHeight + WTabBarHeight));

    UICollectionView * collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, WNavigationBarHeight + QYNesClassPickViewHeight, WScreenWidth, WScreenHeight - (WNavigationBarHeight + QYNesClassPickViewHeight + WTabBarHeight)) collectionViewLayout:layout];
    
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.showsVerticalScrollIndicator = NO;
    collectionView.bounces = NO;
    collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView = collectionView;
    [self.view addSubview:collectionView];
    
    collectionView.dataSource = self;
    collectionView.delegate = self;
    collectionView.pagingEnabled = YES;
    [collectionView registerClass:[QYLatestNewsCollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadSubViews];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}





#pragma mark <===========点击titlebtn===========>
- (void)titleBtnClick:(UIButton *)btn {
    // 点击navigationbar 回到最上面
    
//    [self.tableView scrollToTopAnimated:YES];

    
    
}



#pragma mark <===========UICollectionViewDataSource===========>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.newsClassArray.count;
}

//构建单元格
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    QYLatestNewsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];

    cell.channelId = self.newsClassArray[indexPath.row][@"channelId"];
    [cell.tableView.mj_header beginRefreshing];
    
    return cell;
}




- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint point = scrollView.contentOffset;
 
    NSInteger index = (point.x / WScreenWidth + 0.5);
    
    [self.newsClassPickView setCurrentSelectedBtn:index];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end



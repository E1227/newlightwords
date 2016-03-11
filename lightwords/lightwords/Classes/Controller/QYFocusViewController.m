//
//  QYFocusViewController.m
//  lightwords
//
//  Created by wangxiangyu on 16/3/3.
//  Copyright © 2016年 com.qingyu. All rights reserved.
//


#import "QYFocusViewController.h"
#import "QYFocusNewsCell.h"
#import "QYFocusContentList.h"
#import "QYFocusDetail.h"
#import "QYFocusDetailViewController.h"
#import "QYNewsClassPickView.h"
#import "QYFocusCollectionViewCell.h"

#define QYFOCUSCLASSPICKKEY @"QYFOCUSCLASSPICKKEY"
#define QYNesClassPickViewHeight 40
@interface  QYFocusViewController()<UICollectionViewDelegate,UICollectionViewDataSource>


@property (nonatomic ,strong)NSArray *newsClassArray;
@property (nonatomic ,weak)QYNewsClassPickView *newsClassPickView;
@property (nonatomic ,weak)UICollectionView *collectionView;
@end

@implementation QYFocusViewController


- (NSArray *)newsClassArray
{
    if (_newsClassArray == nil) {
        
        // 从userdefault中去当前存储的新闻分类
        _newsClassArray = [[NSUserDefaults standardUserDefaults] objectForKey:QYFOCUSCLASSPICKKEY];
        if (_newsClassArray == nil) {
             //如果不存在 则创建,默认的
                    _newsClassArray   =@[@{
                                            @"channelId": @"5572a108b3cdc86cf39001cd",
                                            @"name": @"国内焦点"
                                            },
                                        @{
                                            @"channelId": @"5572a108b3cdc86cf39001ce",
                                            @"name": @"国际焦点"
                                            },
                                        @{
                                            @"channelId": @"5572a108b3cdc86cf39001cf",
                                            @"name": @"军事焦点"
                                            },
                                        @{
                                            @"channelId": @"5572a108b3cdc86cf39001d0",
                                            @"name": @"财经焦点"
                                            },
                                        @{
                                            @"channelId": @"5572a108b3cdc86cf39001d1",
                                            @"name": @"互联网焦点"
                                            },
                                        @{
                                            @"channelId": @"5572a108b3cdc86cf39001d2",
                                            @"name": @"房产焦点"
                                            },
                                        @{
                                            @"channelId": @"5572a108b3cdc86cf39001d3",
                                            @"name": @"汽车焦点"
                                            },
                                        @{
                                            @"channelId": @"5572a108b3cdc86cf39001d4",
                                            @"name": @"体育焦点"
                                            },
                                        @{
                                            @"channelId": @"5572a108b3cdc86cf39001d5",
                                            @"name": @"娱乐焦点"
                                            },
                                        @{
                                            @"channelId": @"5572a108b3cdc86cf39001d6",
                                            @"name": @"游戏焦点"
                                            },
                                        @{
                                            @"channelId": @"5572a108b3cdc86cf39001d7",
                                            @"name": @"教育焦点"
                                            },
                                        @{
                                            @"channelId": @"5572a108b3cdc86cf39001d8",
                                            @"name": @"女人焦点"
                                            },
                                        @{
                                            @"channelId": @"5572a108b3cdc86cf39001d9",
                                            @"name": @"科技焦点"
                                            },
                                        @{
                                            @"channelId": @"5572a109b3cdc86cf39001da",
                                            @"name": @"社会焦点"
                                            }
                                        
                                        ];
            
            // 本地持久化
            [[NSUserDefaults standardUserDefaults]setObject:_newsClassArray forKey:QYFOCUSCLASSPICKKEY];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            
        }
    }
    return _newsClassArray;
}



//-(NSMutableArray *)detailArray{
//    if (_detailArray==nil) {
//        _detailArray=[NSMutableArray array];
//    }
//    return _detailArray;
//}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.view.backgroundColor = [UIColor whiteColor];
        
#warning 设置分类按钮
        //        self.navigationItem.titleView = [[UIView alloc]init];
        
        // 暂时显示
        self.navigationItem.title = @"焦点";
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
    [collectionView registerClass:[QYFocusCollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadSubViews];
    
    
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}





#pragma mark <===========CollectionView代理===========>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.newsClassArray.count;
}

//构建单元格
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    QYFocusCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    cell.pushDetailBlock=^(QYFocusDetailViewController *detailVC){
        [self.navigationController pushViewController:detailVC animated:YES];
    };
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


@end



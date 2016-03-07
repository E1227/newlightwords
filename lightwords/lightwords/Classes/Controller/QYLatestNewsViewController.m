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
            _newsClassArray = @[@"推荐",@"体育",@"娱乐",@"搞笑",@"内涵",@"音乐",@"推荐",@"体育",@"娱乐",@"搞笑",@"内涵",@"音乐"];
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
    
    [self.view addSubview:newsClass];
    
    newsClass.newsClassArray = self.newsClassArray;
    
    [newsClass setNewsClassBtnClickBlock:^(NSInteger index) {
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:0];
        
        [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
        
        
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
        cell.backgroundColor = WArcColor;
    
        
        return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end



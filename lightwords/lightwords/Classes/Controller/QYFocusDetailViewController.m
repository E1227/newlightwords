//
//  QYFocusDetailViewController.m
//  lightwords
//
//  Created by wangxiangyu on 16/3/8.
//  Copyright © 2016年 com.qingyu. All rights reserved.
//

#import "QYFocusDetailViewController.h"

@interface QYFocusDetailViewController ()
@property (nonatomic,weak)UITextView *mainTextLabel;//正文
@property (nonatomic,weak)UILabel *titleLabel;//标题
@property (nonatomic,weak)UILabel *timeLabel;//发布时间
@property (nonatomic,weak)NSArray<QYFocusDetailImageUrl *> *imageUrl;

@property (nonatomic,strong)QYFocusDetail *detailModel;

@end

@implementation QYFocusDetailViewController

-(NSString *)link{
    if (_link==nil) {
    NSLog(@"该详情页面无法显示");
    }
    return _link;
}

-(void)setLink:(NSString *)link{
    _link=link;
    [self loadDetailDataWithLink];
}


-(void)viewDidLoad{
    [super viewDidLoad];
     self.view.backgroundColor=[UIColor whiteColor];
    [self setupSubviews];
    [self setSubviewsLayout];
}
//初始化子视图
-(void)setupSubviews{
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem allocWithZone:NULL]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(loadDetailDataWithLink)];
    UILabel  *titleLabel=[[UILabel alloc]initWithFrame:CGRectZero];
    self.titleLabel=titleLabel;
    [self.view addSubview:titleLabel];
    
    UITextView *mainTextLabel=[[UITextView alloc]initWithFrame:CGRectZero];
    self.mainTextLabel=mainTextLabel;
    [self.view addSubview:mainTextLabel];
    [mainTextLabel setEditable:NO];
    
    UILabel *timeLabel=[[UILabel alloc]initWithFrame:CGRectZero];
    self.timeLabel=timeLabel;
    [self.view addSubview:timeLabel];
    
}

//设置界面布局
-(void)setSubviewsLayout{
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@74);
        make.left.equalTo(@20);
        make.right.equalTo(@-20);
        make.height.equalTo(@20);
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel).offset(30);
        make.left.right.equalTo(self.titleLabel);
        make.height.equalTo(@20);
    }];
    [self.mainTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.timeLabel).offset(30);
        make.right.left.equalTo(self.titleLabel);
        make.height.equalTo(@300);
    }];
    
    
}
//读取详情页面
-(void)loadDetailDataWithLink{
    
    NSString * url = @"http://route.showapi.com/883-1";
    
    NSDate * date = [NSDate date];
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyyMMddHHmmss"];
    NSString * dateStr = [formatter stringFromDate:date];
    
    NSDictionary * parametes = @{
                                 @"showapi_appid":@"16332",
                                 @"showapi_sign":@"025a4f865952403eb0c8f1aa67c3c171",
                                 @"showapi_timestamp":dateStr,
                                 @"url":_link,
                                 };
    
    [QYNetManager getDataWithParam:parametes andPath:url andComplete:^(BOOL success, NSDictionary * result) {
        
        if (success) {
            NSDictionary *dict = result[@"showapi_res_body"];
            self.detailModel=[QYFocusDetail modelWithDictionary:dict];
            self.titleLabel.text=self.detailModel.title;
            self.mainTextLabel.text=self.detailModel.content;
            self.timeLabel.text=self.detailModel.time;

        }else {
            NSLog(@"获取数据失败");
            //            [QYAlertViewController qyAlertViewControllerFrom:self andTitle:@"失败" message:@"请检查网络" cancleBtnName:@"确定" otherAction:nil handler:nil];
        }
        
    }];
    
}



@end

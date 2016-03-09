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

@end

@implementation QYFocusDetailViewController
-(void)setDetailModel:(QYFocusDetail *)detailModel{
    _detailModel=detailModel;
    self.titleLabel.text=self.detailModel.title;
    self.mainTextLabel.text=self.detailModel.content;
    self.timeLabel.text=self.detailModel.time;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    [self setupSubviews];
    [self setSubviewsLayout];
}
//初始化子视图
-(void)setupSubviews{
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



@end

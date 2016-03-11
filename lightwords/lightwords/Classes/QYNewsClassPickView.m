//
//  QYNewsClassPickView.m
//  lightwords
//
//  Created by MacBook on 16/3/7.
//  Copyright © 2016年 com.qingyu. All rights reserved.
//

#import "QYNewsClassPickView.h"


@interface QYNewsClassPickView ()

@property (nonatomic ,weak)UIView *indexView;
@property (nonatomic ,weak)UIButton *currentBtn;


@end


@implementation QYNewsClassPickView


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.dk_backgroundColorPicker = DKColorWithColors([UIColor whiteColor], [UIColor blackColor]);
        
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        
        
    }
    return self;
}

- (void)setNewsClassArray:(NSArray *)newsClassArray {
    
    _newsClassArray = newsClassArray;
    
    CGFloat btnWidth = 70;
    CGFloat btnHeight = 30;
    CGFloat margin = 10;
    
    
    for (int i = 0 ;i < self.newsClassArray.count ; i++) {
        
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.titleLabel.font = [UIFont systemFontOfSize:12];
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [btn setTitle:self.newsClassArray[i] forState:UIControlStateNormal];
        
        btn.frame = CGRectMake( margin + i *(btnWidth + margin), (self.height - btnHeight )*0.5, btnWidth, btnHeight);
        
        [self addSubview:btn];
        btn.tag = i + 100;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        if (i == 0) {
            
            [self setCurrentBtnStateWithNewBtn:btn];
            
        }
        

    }
    
    
    self.contentSize = CGSizeMake((btnWidth+margin)*self.newsClassArray.count, self.height);
    
    UIView * indexView = [[UIView alloc]initWithFrame:CGRectMake(margin, self.height - 5, btnWidth, 5)];
    self.indexView = indexView;
    
    indexView.dk_backgroundColorPicker = DKColorWithColors([UIColor greenColor], [UIColor grayColor]);
    
    [self addSubview:indexView];
    
    
}


- (void)setCurrentBtnStateWithNewBtn:(UIButton *)btn
{
    if (self.currentBtn == btn) return;
    
    self.currentBtn.transform = CGAffineTransformIdentity;
    [self.currentBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.currentBtn.enabled = YES;
    
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    btn.transform = CGAffineTransformMakeScale(1.1, 1.1);
    btn.enabled = NO;
    self.currentBtn = btn;
}

- (void)btnClick:(UIButton *)btn {
    
    [self setCurrentSelectedBtn:btn.tag - 100];
    
    
    
    if (self.newsClassBtnClickBlock) {
        self.newsClassBtnClickBlock(btn.tag - 100);
    }
    
}

- (void)setCurrentSelectedBtn:(NSInteger)index
{
    
    
    UIButton * btn = [self viewWithTag:index + 100];
    if (self.currentBtn == btn) {
        return;
    }
    
    [self setCurrentBtnStateWithNewBtn:btn];

    [UIView animateWithDuration:0.25 animations:^{
        
        self.indexView.origin = CGPointMake(btn.origin.x, self.indexView.origin.y);
        
    }];

}




@end

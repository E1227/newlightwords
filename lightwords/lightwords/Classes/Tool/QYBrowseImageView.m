//
//  QYBrowseImageView.m
//  lightwords
//
//  Created by MacBook on 16/3/3.
//  Copyright © 2016年 com.qingyu. All rights reserved.
//

#import "QYBrowseImageView.h"

@interface QYBrowseImageView ()
{
    NSArray *_cardArr;
    CGPoint _tmpPoint;
    NSInteger _currentIndex;
}

@end

@implementation QYBrowseImageView

- (id)initWithCards:(NSArray*)cards andSize:(CGSize)size{
    self = [super init];
    if (self) {
        self.frame = [UIScreen mainScreen].bounds;
        self.backgroundColor = [UIColor grayColor];
        _cardArr = [[NSArray alloc]initWithArray:cards];
        
        
        UIButton * closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [closeBtn setTitle:@"关闭" forState:UIControlStateNormal];
        [closeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self addSubview:closeBtn];
        
        [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.bottom.equalTo(@-20);
            make.left.equalTo(@100);
            make.right.equalTo(@-100);
            make.height.equalTo(@50);
        }];
        
        [closeBtn addTarget:self action:@selector(closeClick) forControlEvents:UIControlEventTouchUpInside];
        
        [self drawCardsZoneWithSize:size];
    }
    return self;
}

- (void)show {
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:self];
    
    self.backgroundColor = [UIColor clearColor];
    self.transform = CGAffineTransformMakeScale(0.5f, 0.5f);
    
    [UIView animateWithDuration:.3f animations:^{
        self.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.5f];
    }];
}

- (void)drawCardsZoneWithSize:(CGSize)size {
    
    for (int i = ((int)_cardArr.count-1); i >= 0; i --) {
        int j;
        UIImageView *cardView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,size.width, size.height)];
        cardView.userInteractionEnabled = YES;
        cardView.centerX = WScreenWidth * 0.5;
        cardView.centerY = WScreenHeight * 0.5;
        cardView.tag = 100+i;
        cardView.layer.cornerRadius = 4.f;
        cardView.layer.masksToBounds = YES;
        j = MIN(i, 2);
        cardView.transform = CGAffineTransformMakeScale(1-0.05*j, 1-0.05*j);
        
        cardView.transform = CGAffineTransformTranslate(cardView.transform, 0, j*15);
        //        cardView.backgroundColor = _cardArr[i];
        [cardView setImageWithURL:[NSURL URLWithString: _cardArr[i]] placeholder:[UIImage imageNamed:@"user_placeholder"]];
        _tmpPoint = cardView.center;
        [self addSubview:cardView];
        UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panHandle:)];
        [cardView addGestureRecognizer:pan];
        
    }
    _currentIndex = 0;
}

//手势拖拽
-(void)panHandle:(UIPanGestureRecognizer *)pan {
    
    
    UIView * view = [self viewWithTag:_currentIndex + 100];
    
    if (view != pan.view) {
        return;
    }
    
    if (pan.state == UIGestureRecognizerStateBegan) {
        
    }
    else if (pan.state == UIGestureRecognizerStateChanged) {
        CGPoint offset = [pan translationInView:self];
        [pan.view setCenter:CGPointMake(pan.view.center.x + offset.x, pan.view.center.y + offset.y)];
        [pan setTranslation:CGPointMake(0, 0) inView:self];
    }
    else if (pan.state == UIGestureRecognizerStateEnded) {
        CGPoint last = [pan velocityInView:self];
        if (last.x > 200 || last.x < -200) {
            [UIView animateWithDuration:.3 animations:^{
                pan.view.center = CGPointMake(last.x, last.y);
                pan.view.alpha = 0;
                _currentIndex++;
                [self reloadCardsView];
            } completion:^(BOOL finished) {
                [pan.view removeFromSuperview];
            }];
        }
        else {
            [UIView animateWithDuration:.4 delay:0 usingSpringWithDamping:.7 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                pan.view.center = _tmpPoint;
            } completion:nil];
        }
    }
}

- (void)reloadCardsView {
    if (_currentIndex == _cardArr.count) {
        [UIView animateWithDuration:0.3f animations:^{
            self.alpha = 0;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    }
    for (int i = 0; i < 3; i++) {
        UIView *cardView = [self viewWithTag:100+_currentIndex+i];
        if (cardView) {
            
            [UIView animateWithDuration:.3 animations:^{
                cardView.transform = CGAffineTransformMakeScale(1-0.05*i, 1-0.05*i);
                cardView.transform = CGAffineTransformTranslate(cardView.transform, 0, i*15);
            }];
        }
    }
}


- (void)closeClick
{
    [UIView animateWithDuration:0.3f animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
}


@end

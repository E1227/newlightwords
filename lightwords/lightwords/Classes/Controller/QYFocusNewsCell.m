//
//  QYFocusCell.m
//  lightwords
//
//  Created by wangxiangyu on 16/3/4.
//  Copyright © 2016年 com.qingyu. All rights reserved.
//

#import "QYFocusNewsCell.h"
#import "QYBrowseImageView.h"
#import "QYFocusImageUrl.h"
#define QYImageWidth 90
#define QYImageHeight 70
#define QYCellMargin 20

@interface QYFocusNewsCell ()
@property (nonatomic ,weak)UILabel *titleLabel;
@property (nonatomic ,weak)UIImageView *picture;
@property (nonatomic ,weak)UILabel *fromLabel;
@property (nonatomic ,weak)UILabel *timeLabel;
@property (nonatomic ,weak)UILabel *descLabel;
@property (nonatomic ,weak)UILabel *channelNameLabel;
@end
@implementation QYFocusNewsCell
+(instancetype)focusNewsCellWithTableView:(UITableView *)tableView reuseIdentifier:(NSString *)reuseIdentifier{
    [tableView registerClass:[self class] forCellReuseIdentifier:reuseIdentifier];
    return [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
      //  self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self loadSubViews];
    }
    return  self;
}


- (void)loadSubViews {
    
 
    UILabel * titleLabel = [self labelWithText:nil textColor:WColorFontTitle font:[UIFont systemFontOfSize:15]];
    self.titleLabel = titleLabel;
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(@(QYCellMargin));
        make.left.equalTo(@(QYCellMargin));
        make.right.equalTo(@(QYCellMargin));
        
    }];
    
    
    UIImageView * picture = [[UIImageView alloc]init];
    self.picture = picture;
    picture.userInteractionEnabled = YES;
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(browseImage:)];
    [picture addGestureRecognizer:tap];
    
    [self.contentView addSubview:picture];
    [picture mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(titleLabel.mas_bottom).offset(10);
        make.right.equalTo(@(-QYCellMargin));
        make.width.equalTo(@(QYImageWidth));
        make.height.equalTo(@(QYImageHeight));
        
        
    }];
    
    UILabel *descLabel = [self labelWithText:nil textColor:WColorFontContent font:[UIFont systemFontOfSize:13]];
    self.descLabel = descLabel;
    
    [descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(titleLabel.mas_bottom).offset(10);
        make.left.equalTo(@(QYCellMargin * 1.5));
        make.right.equalTo(picture.mas_left).offset(-15);
        make.bottom.equalTo(picture.mas_bottom).offset(-5);
        
    }];
    
    
    UILabel * fromLabel = [self labelWithText:nil textColor:[UIColor grayColor] font:[UIFont systemFontOfSize:11]];
    self.fromLabel = fromLabel;
    
    [fromLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(picture.mas_bottom).offset(5);
        make.left.equalTo(@(QYCellMargin));
        make.height.equalTo(@15);
        
    }];
    
    UILabel *timeLabel = [self labelWithText:nil textColor:[UIColor grayColor] font:[UIFont systemFontOfSize:11]];
    self.timeLabel = timeLabel;
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(fromLabel.mas_right).offset(5);
        make.top.equalTo(fromLabel.mas_top);
        make.bottom.equalTo(fromLabel.mas_bottom);
    }];
    
    UILabel *channelNameLabel = [self labelWithText:nil textColor:[UIColor darkGrayColor] font:[UIFont systemFontOfSize:12 weight:3]];
    channelNameLabel.textAlignment = NSTextAlignmentRight;
    [channelNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(timeLabel.mas_bottom);
        make.right.equalTo(@(- QYCellMargin));
        make.height.equalTo(@15);
        
    }];
    
    self.channelNameLabel = channelNameLabel;
}
- (void)browseImage:(UITapGestureRecognizer *)tap {
    
    if (self.model.imageurls) {
        NSMutableArray * array = [NSMutableArray array];
        
        for (QYFocusImageUrl * url in self.model.imageurls) {
            
            [array addObject:url.url];
            
        }
        
        
        QYBrowseImageView * browse = [[QYBrowseImageView alloc]initWithCards:array andSize:CGSizeMake(WScreenWidth - 20, 150)];
        
        [browse show];
    }
    
    
    
}


- (void)setModel:(QYFocusContentList *)model
{
    _model = model;
    
    self.titleLabel.text = model.title;
    self.descLabel.text = model.desc;
    self.timeLabel.text = model.pubDate;
    self.channelNameLabel.text = model.channelName;
    self.fromLabel.text = model.source;
    
    if (model.imageurls) {
        
        QYFocusImageUrl * urlModel = [model.imageurls firstObject];
        
        [self.picture setImageWithURL:[NSURL URLWithString:urlModel.url] placeholder:[UIImage imageNamed:@"arrow"] options:YYWebImageOptionSetImageWithFadeAnimation progress:^(NSInteger receivedSize, NSInteger expectedSize) {
            
        } transform:^UIImage *(UIImage *image, NSURL *url) {
            
            image = [image imageByResizeToSize:CGSizeMake(QYImageHeight, QYImageHeight) contentMode:UIViewContentModeCenter];
            return [image imageByRoundCornerRadius:10];
            
        } completion:^(UIImage *image, NSURL *url, YYWebImageFromType from, YYWebImageStage stage, NSError *error) {
            
        }];
        
        
    }else {
        
        self.picture.image = [UIImage imageNamed:@"user_placeholder"];
    }
    
    
}

#pragma mark <===========private method===========>

- (UILabel *)labelWithText:(NSString *)text textColor:(UIColor *)color font:(UIFont *)font
{
    UILabel * label = [[UILabel alloc]init];
    label.text = text;
    label.textColor = color;
    label.font = font;
    label.numberOfLines = 0;
    [self.contentView addSubview:label];
    return label;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end

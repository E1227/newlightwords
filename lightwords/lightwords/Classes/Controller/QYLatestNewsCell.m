//
//  QYLatestNewsCell.m
//  lightwords
//
//  Created by MacBook on 16/3/3.
//  Copyright © 2016年 com.qingyu. All rights reserved.
//

#import "QYLatestNewsCell.h"
#import "QYBrowseImageView.h"

#define QYImageHeight 180
#define QYCellMargin 10
#define QYContainerMargin 10


@interface QYLatestNewsCell()

@property (nonatomic ,weak)UILabel *titleLabel;
@property (nonatomic ,weak)UIImageView *picture;
@property (nonatomic ,weak)UILabel *fromLabel;
@property (nonatomic ,weak)UILabel *timeLabel;
@property (nonatomic ,weak)UILabel *channelNameLabel;

@end



@implementation QYLatestNewsCell


+ (instancetype)latestNewsCellWithTableView:(UITableView *)tableView identifier:(NSString *)identifier
{
    [tableView registerClass:[self class] forCellReuseIdentifier:identifier];
    return [tableView dequeueReusableCellWithIdentifier:identifier];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self loadSubViews];
        
    }
    return self;
}

- (void)loadSubViews {
    
    UIView * container = [[UIView alloc]init];
    
    
    [self.contentView addSubview:container];
    
    container.dk_backgroundColorPicker =  DKColorWithColors([UIColor whiteColor], [UIColor colorWithWhite:0.2 alpha:0.8]);;
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.left.equalTo(@(QYContainerMargin));
        make.bottom.right.equalTo(@(-QYContainerMargin));
        
        
    }];
    
    UIImageView * picture = [[UIImageView alloc]init];
    self.picture = picture;
    picture.contentMode = UIViewContentModeScaleAspectFit;
    [container addSubview:picture];
    [picture mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.equalTo(@(QYCellMargin));
        make.right.equalTo(@(-QYCellMargin));
        make.height.equalTo(@(QYImageHeight));
        
        
    }];
    
    UILabel * titleLabel = [self labelWithText:nil textColor:WColorFontTitle font:[UIFont systemFontOfSize:15]];
    titleLabel.dk_textColorPicker = DKColorWithColors([UIColor grayColor], [UIColor whiteColor]);
    self.titleLabel = titleLabel;
    [container addSubview:titleLabel];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(picture.mas_bottom).offset(QYCellMargin);
        make.left.equalTo(@(QYCellMargin * 2));
        make.right.equalTo(@(-QYCellMargin * 2));
        
    }];
    
    
   
    
    
    UILabel * fromLabel = [self labelWithText:nil textColor:[UIColor grayColor] font:[UIFont systemFontOfSize:11]];
    
    [container addSubview:fromLabel];
    self.fromLabel = fromLabel;
    
    [fromLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(titleLabel.mas_bottom).offset(QYCellMargin * 1.5);
        make.left.equalTo(@(QYCellMargin));
        make.height.equalTo(@15);
        
    }];
    
    UILabel *timeLabel = [self labelWithText:nil textColor:[UIColor grayColor] font:[UIFont systemFontOfSize:11]];
    
    [container addSubview:timeLabel];
    self.timeLabel = timeLabel;
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(fromLabel.mas_right).offset(5);
        make.top.equalTo(fromLabel.mas_top);
        make.bottom.equalTo(fromLabel.mas_bottom);
    }];
    
    UILabel *channelNameLabel = [self labelWithText:nil textColor:[UIColor darkGrayColor] font:[UIFont systemFontOfSize:12 weight:3]];
    
    [container addSubview:channelNameLabel];
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
        
        for (QYImageURL * url in self.model.imageurls) {
            
            [array addObject:url.url];
            
        }
        
        
        QYBrowseImageView * browse = [[QYBrowseImageView alloc]initWithCards:array andSize:CGSizeMake(WScreenWidth - 20, 150)];
        
        [browse show];
    }
    
}

- (void)setModel:(QYLatestNewsModel *)model
{
    _model = model;
    
    self.titleLabel.text = model.title;
    self.timeLabel.text = model.pubDate;
    self.channelNameLabel.text = model.channelName;
    self.fromLabel.text = model.source;
    
    if (model.imageurls) {
        
        QYImageURL * urlModel = [model.imageurls firstObject];
        
        [self.picture setImageWithURL:[NSURL URLWithString:urlModel.url] placeholder:[UIImage imageNamed:@"user_placeholder"]];
        
        
    }else {
        
        self.picture.image = [UIImage imageNamed:@"user_placeholder"];
        
    }
    
    
}

#pragma mark <===========private method===========>

- (UILabel *)labelWithText:(NSString *)text textColor:(UIColor *)color font:(UIFont *)font
{
    UILabel * label = [[UILabel alloc]init];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = text;
    label.textColor = color;
    label.font = font;
    label.numberOfLines = 0;
    return label;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end

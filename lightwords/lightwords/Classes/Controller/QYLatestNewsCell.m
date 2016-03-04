//
//  QYLatestNewsCell.m
//  lightwords
//
//  Created by MacBook on 16/3/3.
//  Copyright © 2016年 com.qingyu. All rights reserved.
//

#import "QYLatestNewsCell.h"
#import "QYBrowseImageView.h"

#define QYImageWidth 90
#define QYImageHeight 70
#define QYCellMargin 20


@interface QYLatestNewsCell()

@property (nonatomic ,weak)UILabel *titleLabel;
@property (nonatomic ,weak)UIImageView *image;
@property (nonatomic ,weak)UILabel *fromLabel;
@property (nonatomic ,weak)UILabel *timeLabel;

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
        
        [self loadSubViews];
        
    }
    return self;
}

- (void)loadSubViews {
    
    
    
    
    
    UILabel * titleLabel = [self labelWithText:@"陈君石：没有“垃圾食品”只有“垃圾搭配" textColor:WColorFontTitle font:[UIFont systemFontOfSize:15]];
    
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(@(QYCellMargin));
        make.left.equalTo(@(QYCellMargin));
        make.right.equalTo(@(QYCellMargin));
        
    }];
    
    
    UIImageView * image = [[UIImageView alloc]init];
    image.userInteractionEnabled = YES;
    
    image.backgroundColor = WArcColor;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(browseImage:)];
    [image addGestureRecognizer:tap];
    
    [self.contentView addSubview:image];
    [image mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(titleLabel.mas_bottom).offset(10);
        make.right.equalTo(@(-QYCellMargin));
        make.width.equalTo(@(QYImageWidth));
        make.height.equalTo(@(QYImageHeight));
       
        
    }];
    
    UILabel *descLabel = [self labelWithText:@"陈君石国家食品安全风险评估中心研究员，中国工程院院士在生活中，我们经常会听到“垃圾食品”这个说法，也会有媒体整理出各种“垃圾食品”名单，而方便面、薯条、可乐、汉堡、炸鸡、火腿等一般都会榜上有名，不少人对“垃圾食品”真是又爱又恨，很多人干脆敬而远之。我并非对“垃圾食品”很有兴..." textColor:WColorFontContent font:[UIFont systemFontOfSize:13]];
    
    
    [descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(titleLabel.mas_bottom).offset(10);
        make.left.equalTo(@(QYCellMargin * 1.5));
        make.right.equalTo(image.mas_left).offset(-15);
        make.bottom.equalTo(image.mas_bottom).offset(-5);
        
    }];
    
    
    UILabel * fromLabel = [self labelWithText:@"环球网" textColor:[UIColor grayColor] font:[UIFont systemFontOfSize:11]];
    
    
    [fromLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(image.mas_bottom).offset(5);
        make.left.equalTo(@(QYCellMargin));
        make.height.equalTo(@15);
        
    }];
    
    UILabel *timeLabel = [self labelWithText:@"2016-03-03 03:41:01" textColor:[UIColor grayColor] font:[UIFont systemFontOfSize:11]];
    
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(fromLabel.mas_right).offset(5);
        make.top.equalTo(fromLabel.mas_top);
        make.bottom.equalTo(fromLabel.mas_bottom);
    }];
    
    UILabel *channelNameLabel = [self labelWithText:@"女人频道" textColor:[UIColor darkGrayColor] font:[UIFont systemFontOfSize:12 weight:3]];
    channelNameLabel.textAlignment = NSTextAlignmentRight;
    [channelNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(timeLabel.mas_bottom);
        make.right.equalTo(@(- QYCellMargin));
        make.height.equalTo(@15);
        
    }];
    
}


- (void)browseImage:(UITapGestureRecognizer *)tap {
    
     NSArray *cardArr = @[[UIColor redColor], [UIColor blueColor], [UIColor yellowColor]];
    
    QYBrowseImageView * browse = [[QYBrowseImageView alloc]initWithCards:cardArr andSize:CGSizeMake(WScreenWidth - 20, 150)];
    
    [browse show];
    
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

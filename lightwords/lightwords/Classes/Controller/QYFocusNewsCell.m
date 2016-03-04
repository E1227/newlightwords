//
//  QYFocusCell.m
//  lightwords
//
//  Created by wangxiangyu on 16/3/4.
//  Copyright © 2016年 com.qingyu. All rights reserved.
//

#import "QYFocusNewsCell.h"

@implementation QYFocusNewsCell
+(instancetype)focusNewsCellWithTableView:(UITableView *)tableView reuseIdentifier:(NSString *)reuseIdentifier{
    [tableView registerClass:[self class] forCellReuseIdentifier:reuseIdentifier];
    return [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self loadSubviews];
    }
    return  self;
}
-(void)loadSubviews{
    
    
    
}
@end

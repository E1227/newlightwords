//
//  QYFocusViewController.m
//  lightwords
//
//  Created by wangxiangyu on 16/3/3.
//  Copyright © 2016年 com.qingyu. All rights reserved.
//

#import "QYFocusViewController.h"
#import "NSDate+Formatter.h"
#define FocusCellReuseId @"FocusCell"
@interface QYFocusViewController(){

}
@property (nonatomic)NSMutableArray *date;//获取模型对象数据
@end
@implementation QYFocusViewController



-(void)viewDidLoad{
    [super viewDidLoad];
    
   NSArray *array=@[
                    @{
                        @"channelId": @"5572a108b3cdc86cf39001cd",
                        @"name": @"国内焦点"
                    },
                    @{
                        @"channelId": @"5572a108b3cdc86cf39001ce",
                        @"name": @"国际焦点"
                        }];
   
//    [manager GET:SHOW_SEARCH_BASEURL parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        
//    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:FocusCellReuseId];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:FocusCellReuseId];
    }
    cell.textLabel.text=@"sssss";
    return cell;
}

@end

//
//  QYFocusViewController.m
//  lightwords
//
//  Created by wangxiangyu on 16/3/3.
//  Copyright © 2016年 com.qingyu. All rights reserved.
//

#import "QYFocusViewController.h"
#import "NSDate+Formatter.h"
#import "QYFocusContentList.h"
#define FocusCellReuseId @"FocusCell"
@interface QYFocusViewController(){
    
}
@property (nonatomic)NSMutableArray *dataArray;//获取模型对象数据

@end
@implementation QYFocusViewController
//
-(NSMutableArray *)dateArray{
    if (_dataArray==nil) {
        NSString *url= @"http://route.showapi.com/109-35?showapi_appid=16332&showapi_sign=025a4f865952403eb0c8f1aa67c3c171&showapi_timestamp=20160304152811&channelId=5572a108b3cdc86cf39001d1";
        [QYNetManager getDataWithParam:nil andPath:url andComplete:^(BOOL success, id result) {
            if (success) {
                NSMutableArray *objs=[NSMutableArray array];
                NSArray *temp=[result objectForKey:@"contentlist"];
                for (QYFocusContentList * list in temp) {
                    [objs addObject:list];
                }
                _dataArray=objs;
            }
            else{
                [QYAlertViewController qyAlertViewControllerFrom:self andTitle:@"数据请求失败" message:@"网络问题" cancleBtnName:@"确定" otherAction:nil handler:nil];
            }
        }];
        
    }
    return _dataArray;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    NSLog(@"1111111%@",self.dataArray);
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

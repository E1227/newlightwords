//
//  QYMineViewController.m
//  lightwords
//
//  Created by MacBook on 16/3/11.
//  Copyright © 2016年 com.qingyu. All rights reserved.
//

#import "QYMineViewController.h"

@interface QYMineViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UISwitch *nightSwitch;

@end

@implementation QYMineViewController
- (IBAction)changeNightOrDay:(UISwitch *)sender {
    
    if (sender.isOn) {
        NSLog(@"night");
        [DKNightVersionManager dawnComing];
    }else {
        NSLog(@"day");
        [DKNightVersionManager nightFalling];
    }
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.label.dk_textColorPicker = DKColorWithColors([UIColor grayColor], [UIColor whiteColor]);
    
    self.view.dk_backgroundColorPicker = DKColorWithColors([UIColor whiteColor], [UIColor blackColor]);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  RootVC.m
//  JS
//
//  Created by ac hu on 2018/6/21.
//  Copyright © 2018年 ac hu. All rights reserved.
//

#import "RootVC.h"
#import "JSCoreVC.h"

@interface RootVC ()

@end

@implementation RootVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)JSCoreClick:(id)sender {
    [self.navigationController pushViewController:[JSCoreVC new] animated:YES];
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

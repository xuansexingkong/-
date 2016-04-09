//
//  NeedReadViewController.m
//  YFrenovate
//
//  Created by qianfeng on 16/1/12.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "NeedReadViewController.h"

@interface NeedReadViewController ()

@end

@implementation NeedReadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.view.backgroundColor = [UIColor redColor];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:[[NeedFirstViewController alloc] init]];
    NeedSecondViewController *leftMenuViewController = [[NeedSecondViewController alloc] init];
    NeedthreeViewController *rightMenuViewController = [[NeedthreeViewController alloc] init];
    
    // Create side menu controller
    //
    RESideMenu *sideMenuViewController = [[RESideMenu alloc] initWithContentViewController:navigationController
                                                                    leftMenuViewController:leftMenuViewController
                                                                   rightMenuViewController:rightMenuViewController];
    sideMenuViewController.backgroundImage = [UIImage imageNamed:@"star1.jpeg"];
    // Do any additional setup after loading the view.
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

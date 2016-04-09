//
//  LoginViewController.m
//  YFrenovate
//
//  Created by qianfeng on 16/1/12.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "LoginViewController.h"
#define kCYLoginURL @"http://10.0.8.8/sns/my/login.php"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
     self.tabBarController.tabBar.hidden=YES;
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
     self.tabBarController.tabBar.hidden=NO;
}
- (IBAction)loginBtn:(UIButton *)sender {
    AFHTTPRequestOperationManager *man = [AFHTTPRequestOperationManager manager];
    man.responseSerializer = [AFHTTPResponseSerializer serializer];
    [man POST:kCYLoginURL parameters:@{@"username":self.username.text,@"password":self.password.text} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        if([dic[@"code"] isEqualToString:@"login_success"])
        {
            //成功 才能跳转界面
          
            [self.navigationController popViewControllerAnimated:YES];
            
            //转化成字符串
           // mainVC.uid = [NSString stringWithFormat:@"%@",dic[@"uid"]];
            
            //[self.navigationController pushViewController:mainVC animated:YES];
        }
        

        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}
- (IBAction)registerBtn:(UIButton *)sender {
    RegisterViewController *reg = [[RegisterViewController alloc]init];
   [self presentViewController:reg animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
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

//
//  RegisterViewController.m
//  YFrenovate
//
//  Created by qianfeng on 16/1/15.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)registerBt:(UIButton *)sender {
    AFHTTPRequestOperationManager *man = [AFHTTPRequestOperationManager manager];
    man.responseSerializer = [AFHTTPResponseSerializer serializer];
    [man POST:kCYRegURL parameters:@{@"username":self.username.text,@"password":self.password.text,@"email":self.email.text} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        UIAlertView *alerView = nil;
        if([dic[@"code"] isEqualToString:@"registered"])
        {
            alerView = [[UIAlertView alloc] initWithTitle:@"注册成功" message:dic[@"message"] delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"ok", nil];
            [self dismissViewControllerAnimated:YES completion:nil];
        }
        else
        {
            alerView = [[UIAlertView alloc] initWithTitle:@"注册失败" message:dic[@"message"] delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"ok", nil];
        }
        
        [alerView show];

        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];

}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
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

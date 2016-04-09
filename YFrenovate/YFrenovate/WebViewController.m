//
//  WebViewController.m
//  YFrenovate
//
//  Created by qianfeng on 15/12/31.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    self.webView.delegate = self;
    
    
     NSRange range = [self.Weburl rangeOfString:@" "];
    if(range.location == NSNotFound)
    {
     //   NSLog(@"没有找到子串");
    }
    else{
        //NSLog(@"location=%ld,length=%ld",range.location,range.length);
        self.Weburl = [self.Weburl substringToIndex:self.Weburl.length-1];
    }
    NSURL *url = [NSURL URLWithString:self.Weburl];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];

    [self.view addSubview:self.webView];
    // Do any additional setup after loading the view.
}
//已经开始加载
-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}
//停止加载
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden =YES;
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden=NO;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
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

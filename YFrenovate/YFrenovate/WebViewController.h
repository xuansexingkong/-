//
//  WebViewController.h
//  YFrenovate
//
//  Created by qianfeng on 15/12/31.
//  Copyright © 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController <UIWebViewDelegate>

@property (nonatomic,strong) UIWebView *webView;
@property(nonatomic,copy)NSString *Weburl;
@end

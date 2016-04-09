//
//  ThiredTopview.m
//  YFrenovate
//
//  Created by qianfeng on 16/1/8.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ThiredTopview.h"

@implementation ThiredTopview
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //1
        UIImageView *backView= [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        backView.image=[UIImage imageNamed:@"MyBG"];
        [self addSubview:backView];
        //backView.backgroundColor=[UIColor clearColor];
        UIControl *login = [[UIControl alloc]initWithFrame:CGRectMake(0, 0, 80, 110)];
        login.backgroundColor=[UIColor clearColor];
        login.center=CGPointMake(backView.center.x, backView.center.y);
        
        
        UIImageView *headview =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
        headview.image=[UIImage imageNamed:@"MYDefault"];
        headview.layer.cornerRadius=40.0;
        headview.clipsToBounds=YES;
        [login addSubview:headview];
        

        
        UIButton *loginBtn= [UIButton buttonWithType:UIButtonTypeCustom];
        loginBtn.frame=CGRectMake(0, 90, 80, 15);
        loginBtn.titleLabel.font=[UIFont systemFontOfSize:14.0];
      //  [loginBtn setTitle:@"点击登录" forState:UIControlStateNormal];
        [login addSubview:loginBtn];
      //  [login addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:login];
        //[backView addSubview:login];
        
//        //2 我的收藏 装修理财
//        UIControl *login2= [[UIControl alloc]initWithFrame:CGRectMake(0, backView.frame.size.height, frame.size.width/2, frame.size.height-backView.frame.size.height)];
//       // login2.backgroundColor = [UIColor redColor];
//        UIImageView *icon2 = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, 26, 26)];
//        icon2.image= [UIImage imageNamed:@"star"];
//        icon2.layer.cornerRadius=13.0;
//        icon2.clipsToBounds=YES;
//        [login2 addSubview:icon2];
//        UILabel *lab2=[[UILabel alloc]initWithFrame:CGRectMake(50, 22, frame.size.width/2-icon2.frame.size.width-5, 26)];
//        lab2.text=@"我的收藏";
//        lab2.font= [UIFont fontWithName:@"TimesNewRomanPSMT" size:15.0];
//        [login2 addSubview:lab2];
//        [self addSubview:login2];
//        
//        
//        UIControl *login3= [[UIControl alloc]initWithFrame:CGRectMake(login2.frame.size.width, backView.frame.size.height, frame.size.width/2, frame.size.height-backView.frame.size.height)];
//        //login3.backgroundColor = [UIColor yellowColor];
//        UIImageView *icon3 = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, 26, 26)];
//        icon3.image= [UIImage imageNamed:@"money"];
//        icon3.layer.cornerRadius=13.0;
//        icon3.clipsToBounds=YES;
//        [login3 addSubview:icon3];
//        UILabel *lab3=[[UILabel alloc]initWithFrame:CGRectMake(50, 22, frame.size.width/2-icon3.frame.size.width-5, 26)];
//        lab3.text=@"装修理财";
//        lab3.font= [UIFont fontWithName:@"TimesNewRomanPSMT" size:15.0];
//        [login3 addSubview:lab3];
//        [self addSubview:login3];
        
        
    }
    return self;
}
-(void)loginClick
{
  //  NSLog(@"15641");
   // LoginViewController *login = [[LoginViewController alloc]init];
    self.login();
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

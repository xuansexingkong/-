//
//  OnetopView.m
//  YFrenovate
//
//  Created by qianfeng on 16/1/11.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "OnetopView.h"

@implementation OnetopView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
   if (self) {
//        self.allcity = [UIButton buttonWithType:UIButtonTypeSystem];
//        self.allcity.frame=CGRectMake(0, 0, frame.size.width/2, 40);
//        [self.allcity setTitle:@"全城" forState:UIControlStateNormal];
//        [self.allcity.layer setBorderColor:[UIColor grayColor].CGColor];
//        [self.allcity.layer setBorderWidth:0.8];
//        [self.allcity.layer setMasksToBounds:YES];
//        [self.allcity addTarget:self action:@selector(btnClickcity:) forControlEvents:UIControlEventTouchUpInside];
//        [self addSubview:self.allcity];
//        self.bestkoubei = [UIButton buttonWithType:UIButtonTypeSystem];
//        self.bestkoubei.frame=CGRectMake(frame.size.width/2, 0, frame.size.width/2, 40);
//        [self.bestkoubei setTitle:@"口碑最好" forState:UIControlStateNormal];
//        [self.bestkoubei.layer setBorderColor:[UIColor grayColor].CGColor];
//        [self.bestkoubei.layer setBorderWidth:0.8];
//        [self.bestkoubei.layer setMasksToBounds:YES];
//        [self.bestkoubei addTarget:self action:@selector(btnClickbest:) forControlEvents:UIControlEventTouchUpInside];
//        [self addSubview:self.bestkoubei];
       self.textSearch = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, frame.size.width-80, 40)];
       self.textSearch.placeholder = @"搜索城市";
       [self addSubview:self.textSearch];
        self.searchBtn = [UIButton buttonWithType:UIButtonTypeSystem];
       self.searchBtn.frame=CGRectMake(frame.size.width-80, 0, 60, 40);
       [self.searchBtn setTitle:@"搜索" forState:UIControlStateNormal];
//       [self.bestkoubei.layer setBorderColor:[UIColor clearColor].CGColor];
//       self.searchBtn.layer.cornerRadius=8.0;
//       [self.searchBtn.layer setBorderWidth:0.8];
//       [self.searchBtn.layer setMasksToBounds:YES];
       [self.searchBtn addTarget:self action:@selector(btnClickSearch:) forControlEvents:UIControlEventTouchUpInside];

       [self addSubview:self.searchBtn];
       
    
    }
    return self;
}

-(void)btnClickcity:(UIButton*)btn
{

}
-(void)btnClickbest:(UIButton*)btn
{
    NSLog(@"255");
}
-(void)btnClickSearch:(UIButton*)btn
{
    
}
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    //[self.view endEditing:YES];
//        [self.textSearch resignFirstResponder];
//    
//}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

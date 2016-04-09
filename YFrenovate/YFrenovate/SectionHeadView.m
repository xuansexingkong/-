//
//  SectionHeadView.m
//  YFrenovate
//
//  Created by qianfeng on 16/1/6.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "SectionHeadView.h"

@implementation SectionHeadView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       
        self.headLab = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, 100, 30)];
        
        //NSLog(@"%@",headData[4][@"title"]);
        self.subLab = [[UILabel alloc] initWithFrame:CGRectMake(11, 45, 100, 20)];
        
        self.subLab.textColor = [UIColor grayColor];
        self.subLab.font=[UIFont boldSystemFontOfSize:12.0];
        self.clickLab = [[UILabel alloc] initWithFrame:CGRectMake(350, 25, 20, 30)];
        
        
        
        
    }
    return self;
}
- (void)headData:(NSDictionary*)headData section:(NSInteger)section
{
    self.isOpenNum = section;
    self.headLab.text=headData[@"title"];
    self.subLab.text=headData[@"subtitle"];
    self.clickLab.text = @">";
    [self addSubview:self.headLab];
    [self addSubview:self.subLab];
    [self addSubview:self.clickLab];
    //self.secArr =headData[];
    //[self addTarget:self action:@selector(sectionHeadClick) forControlEvents:UIControlEventTouchUpInside];
}
-(void)sectionHeadClick
{
//    self.isOpen =!self.isOpen;
//    self.openblock(self.isOpen);

}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end

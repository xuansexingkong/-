//
//  FirstTableViewCell.m
//  YFrenovate
//
//  Created by qianfeng on 16/1/4.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "FirstTableViewCell.h"

@implementation FirstTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.webURL = [NSMutableArray array];
    }
    return self;
}
-(void)refrushUI:(HomeFirstModel*)model
{
   self.webURL = model.imageWebUrl;
//    for (id obj in self.webURL) {
//        NSLog(@"%@",obj);
//    }
    self.lab1.text = model.title[0];
    self.lab2.text = model.title[1];
    self.lab3.text = model.title[2];
    self.lab4.text = model.title[3];
    
    [self.image1 sd_setImageWithURL:[NSURL URLWithString:model.imageUrl[0]] placeholderImage:[UIImage imageNamed:@"B7133241330"]];
    self.image1.userInteractionEnabled=YES;
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(TapClick1:)];
    [self.image1 addGestureRecognizer:tap1];
    
    [self.image2 sd_setImageWithURL:[NSURL URLWithString:model.imageUrl[1]] placeholderImage:[UIImage imageNamed:@"B7133241330"]];
    self.image2.userInteractionEnabled=YES;
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(TapClick2:)];
    [self.image2 addGestureRecognizer:tap2];
    
    [self.image3 sd_setImageWithURL:[NSURL URLWithString:model.imageUrl[2]] placeholderImage:[UIImage imageNamed:@"B7133241330"]];
    self.image3.userInteractionEnabled=YES;
    UITapGestureRecognizer *tap3 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(TapClick3:)];
    [self.image3 addGestureRecognizer:tap3];
    
    [self.image4 sd_setImageWithURL:[NSURL URLWithString:model.imageUrl[3]] placeholderImage:[UIImage imageNamed:@"B7133241330"]];
    self.image4.userInteractionEnabled=YES;
    UITapGestureRecognizer *tap4 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(TapClick4:)];
    [self.image4 addGestureRecognizer:tap4];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)TapClick1:(UITapGestureRecognizer*)tap
{
    self.webblock(tap,self.webURL[0]);
}
-(void)TapClick2:(UITapGestureRecognizer*)tap
{
    self.webblock(tap,self.webURL[1]);
}
-(void)TapClick3:(UITapGestureRecognizer*)tap
{
    self.webblock(tap,self.webURL[2]);
}
-(void)TapClick4:(UITapGestureRecognizer*)tap
{
    self.webblock(tap,self.webURL[3]);
}
@end

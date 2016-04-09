//
//  ThiredTableViewCell.m
//  YFrenovate
//
//  Created by qianfeng on 16/1/5.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ThiredTableViewCell.h"
#import "LibHeader.h"
@implementation ThiredTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)refrushUI:(NSDictionary*)dic
{
    self.title.text= dic[@"title"];
    self.subTitle.text=dic[@"subtitle"];
    self.weburl=dic[@"weburl"];
    [self.headImage sd_setImageWithURL:[NSURL URLWithString:dic[@"headimage"]] placeholderImage:[UIImage imageNamed:@"B7133241330"]];
    self.backimage.userInteractionEnabled =YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(NeedTapClick)];
    [self.backimage addGestureRecognizer:tap];
    
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)NeedTapClick
{
self.webblock(self.weburl);
}
@end

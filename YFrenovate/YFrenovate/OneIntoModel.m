//
//  OneIntoModel.m
//  YFrenovate
//
//  Created by qianfeng on 16/1/14.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "OneIntoModel.h"

@implementation OneIntoModel
- (instancetype)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        self.data=[NSMutableArray array];

        self.cname = dic[@"cname"];
       // NSLog(@"%@",self.cname);
        [self.data addObject:self.cname];
        
        self.payfirst =  dic[@"payfirst"];
        if ([self.payfirst isEqualToString:@"1"]) {
            self.payfirst = @"支持装修后付款";
        }
        else
        {
            self.payfirst =@"暂不支持装修后付款";
        }
        [self.data addObject:self.payfirst];
        
        self.koubei = dic[@"koubei"];
        [self.data addObject:self.koubei];
        
        self.phone = dic[@"phone"];
        [self.data addObject:self.phone];
        
        self.adds = dic[@"adds"];
        [self.data addObject:self.adds];
        
        self.gsgm =  dic[@"details"][@"gsgm"];
        [self.data addObject:self.gsgm];
        
        self.shys =   dic[@"details"][@"shys"];
        [self.data addObject:self.shys];
        
        self.cqys_qtfs =  dic[@"details"][@"cqys_qtfs"];
        [self.data addObject:self.cqys_qtfs];
        
        self.htgfx =   dic[@"details"][@"htgfx"];
        [self.data addObject:self.htgfx];
        
        self.introduce =dic[@"introduce"];
        [self.data addObject:self.introduce];
        
          }
    return self;
}
@end

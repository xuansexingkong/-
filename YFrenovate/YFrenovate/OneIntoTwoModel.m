//
//  OneIntoTwoModel.m
//  YFrenovate
//
//  Created by qianfeng on 16/1/14.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "OneIntoTwoModel.h"

@implementation OneIntoTwoModel
- (instancetype)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
               
        self.gsgm =  dic[@"details"][@"gsgm"];
        self.shys =   dic[@"details"][@"shys"];
        self.cqys_qtfs =  dic[@"details"][@"cqys_qtfs"];
        self.htgfx =   dic[@"details"][@"htgfx"];
        self.introduce =dic[@"introduce"];
    }
    return self;
}

@end

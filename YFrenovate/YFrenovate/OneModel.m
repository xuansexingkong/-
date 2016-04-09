//
//  OneModel.m
//  YFrenovate
//
//  Created by qianfeng on 16/1/11.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "OneModel.h"

@implementation OneModel
- (instancetype)initWithDic:(NSDictionary*)dic

{
    self = [super init];
    if (self) {
        self.name = dic[@"cname"];
        self.cid=dic[@"id"];
        self.distance= dic[@"distance"];
        self.koubeiNum=dic[@"koubei"];
        self.headImage=dic[@"headPhoto"];
        self.designNum=dic[@"casenum"];
        self.peopleNum=dic[@"viewnums"];
        self.baoImage =[NSString stringWithFormat:@"%@",dic[@"security"]];
        
        
    }
    return self;
}
@end

//
//  HomeFirstModel.m
//  YFrenovate
//
//  Created by qianfeng on 16/1/4.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "HomeFirstModel.h"

@implementation HomeFirstModel
- (void)initWithDic:(NSDictionary*)dic
{
        [self.imageUrl addObject:dic[@"info"][0][@"filename"]];
        [self.imageWebUrl addObject: dic[@"webUrl"]];
        [self.title addObject: dic[@"title"]];
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.imageUrl = [NSMutableArray array];
        self.imageWebUrl =[NSMutableArray array];
        self.title = [NSMutableArray array];
    }
    return self;
}
@end

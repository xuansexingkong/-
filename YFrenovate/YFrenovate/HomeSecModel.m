//
//  HomeSecModel.m
//  YFrenovate
//
//  Created by qianfeng on 16/1/4.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "HomeSecModel.h"

@implementation HomeSecModel
- (instancetype)initWithDic:(NSDictionary*)dic
{
    self = [super init];
    if (self) {
        self.imageUrl=dic[@"filename"];
        
        self.imageWebUrl = dic[@"webUrl"];
        self.title = dic[@"title"];
        
        self.subtitle = dic[@"summary"];
    }
    return self;
}
@end

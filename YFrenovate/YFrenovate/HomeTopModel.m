//
//  HomeTopModel.m
//  YFrenovate
//
//  Created by qianfeng on 15/12/30.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "HomeTopModel.h"

@implementation HomeTopModel
//: adid,    linkurl,  imgurl
- (instancetype)initWithDic:(NSDictionary*)dic
{
    self = [super init];
    if (self) {
        
        self.adid = dic[@"adid"];
        
        self.linkurl = dic[@"linkurl"];
        
        self.imgurl = dic[@"imgurl"];
        self.showtime = [NSString stringWithFormat:@"%@", dic[@"showtime"]];
    }
    return self;
}
@end

//
//  HomeThiredModel.m
//  YFrenovate
//
//  Created by qianfeng on 16/1/13.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "HomeThiredModel.h"

@implementation HomeThiredModel
- (instancetype)initWithDic:(NSDictionary*)dic
{
    self = [super init];
    if (self) {
        self.kid=dic[@"kid"];
        self.HeadImage=dic[@"imgurl"];
        self.Title=dic[@"title"];
        self.SubTitle=dic[@"page_description"];
        self.WebURL=[NSString stringWithFormat:path_home_needWebURL,self.kid];
        
    }
    return self;
}
@end

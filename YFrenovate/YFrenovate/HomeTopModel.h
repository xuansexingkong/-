//
//  HomeTopModel.h
//  YFrenovate
//
//  Created by qianfeng on 15/12/30.
//  Copyright © 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeTopModel : NSObject
//:allRows,  adid,    linkurl,  imgurl
@property(nonatomic,copy)NSString *adid;
//@property(nonatomic,copy)NSString *allRows;//
@property(nonatomic,copy)NSString *linkurl;
@property(nonatomic,copy)NSString *imgurl;
@property(nonatomic,copy)NSString *showtime;

- (instancetype)initWithDic:(NSDictionary*)dic;
@end

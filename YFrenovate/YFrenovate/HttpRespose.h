//
//  HttpRespose.h
//  YFrenovate
//
//  Created by qianfeng on 16/1/4.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LibHeader.h"
typedef void (^TextResult)(NSError * err,NSDictionary * response);
@interface HttpRespose : NSObject
- (void)GETTextURL:(NSString *)url result:(TextResult)res;
@end

//
//  HttpRespose.m
//  YFrenovate
//
//  Created by qianfeng on 16/1/4.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "HttpRespose.h"

@implementation HttpRespose
- (void)GETTextURL:(NSString *)url result:(TextResult)res
{
    AFHTTPRequestOperationManager *man = [AFHTTPRequestOperationManager manager];
    man.responseSerializer = [AFHTTPResponseSerializer serializer];

    [man GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        // 只有当服务器做出响应时才会调用
        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
               res(nil,dic);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        res(error,nil);
    }];
}
@end

//
//  OneIntoViewController.h
//  YFrenovate
//
//  Created by qianfeng on 16/1/14.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LibHeader.h"
#import "interfaceHeader.h"
#import "ModelHeader.h"
#import "ViewHeader.h"
#import "ControHeader.h"
@interface OneIntoViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,copy)NSString *cid;
@property(nonatomic,strong)NSMutableArray *data;
@property(nonatomic,strong)NSArray *DefaultData;
@property(nonatomic,strong)UITableView *tableView;

@end

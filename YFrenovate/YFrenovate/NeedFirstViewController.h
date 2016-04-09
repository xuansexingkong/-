//
//  NeedFirstViewController.h
//  YFrenovate
//
//  Created by qianfeng on 16/1/12.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LibHeader.h"
#import "interfaceHeader.h"
#import "ModelHeader.h"
#import "ViewHeader.h"
#import "ControHeader.h"
@interface NeedFirstViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (strong,nonatomic) UITableView *tableView;
@property(nonatomic,assign)NSInteger NUM;
//@property(nonatomic,strong)NSMutableArray *data;
@property(nonatomic,strong)NSMutableArray *Bigdata;
@property(nonatomic,strong)NSMutableArray *namedata;
@property(nonatomic,strong)NSArray *imageArr;

@end

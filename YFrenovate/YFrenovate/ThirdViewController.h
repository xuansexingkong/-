//
//  ThirdViewController.h
//  YFrenovate
//
//  Created by qianfeng on 15/12/30.
//  Copyright © 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LibHeader.h"
#import "interfaceHeader.h"
#import "ModelHeader.h"
#import "ViewHeader.h"
#import "ControHeader.h"

@interface ThirdViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView * TableView;
@property(nonatomic,strong)NSMutableArray *data;

@property(nonatomic,strong)NSMutableArray *serviceData;
@end

//
//  SearchCollectionViewController.h
//  YFrenovate
//
//  Created by qianfeng on 16/1/6.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LibHeader.h"
#import "ViewHeader.h"
#import "ControHeader.h"
#import "interfaceHeader.h"
@interface SearchCollectionViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *TableView;

@property(nonatomic,strong)NSMutableArray *Data;

@property(nonatomic,copy)NSString *strURL;
@end

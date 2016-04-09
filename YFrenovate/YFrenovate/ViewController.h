//
//  ViewController.h
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
@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView * TableView;
@property(nonatomic,strong)NSMutableArray *data;

@property(nonatomic,strong)NSMutableArray *Topdata;
@property(nonatomic,strong)HomeTopView *Topview;
//0
@property(nonatomic,strong)NSMutableArray *InspirationData;

//
@property(nonatomic,strong)NSArray *cells;
//2
@property(nonatomic,strong)NSMutableArray *HotDemoData;
@property(nonatomic,strong)NSArray *secondData;
//3
@property(nonatomic,strong)NSArray *NeedData;
@end


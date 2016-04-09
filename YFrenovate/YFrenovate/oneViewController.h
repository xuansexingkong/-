//
//  oneViewController.h
//  YFrenovate
//
//  Created by qianfeng on 16/1/11.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LibHeader.h"
#import "interfaceHeader.h"
#import "ModelHeader.h"
#import "ViewHeader.h"
#import "ControHeader.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
@interface oneViewController : UIViewController<CLLocationManagerDelegate,UITableViewDelegate,UITableViewDataSource,MJRefreshBaseViewDelegate>
@property(nonatomic,strong)NSMutableArray *data;
@property(nonatomic,strong)UITableView *tableView;

//上/下拉
@property (nonatomic,strong) MJRefreshHeaderView *headView;
@property (nonatomic,strong) MJRefreshFooterView *footView;
@property (nonatomic) BOOL isDown;
@property(nonatomic,assign)NSInteger pageindex;

//位置
@property(nonatomic,copy)NSString *longitude;//经纬度
@property(nonatomic,copy)NSString *latitude;
//@property(nonatomic,copy)NSString *currentLocation;
@property (nonatomic,strong) CLLocationManager *locationManager;
@property (nonatomic,copy) NSString *currentWeiZhi;
@property(nonatomic,copy)NSString *cityName;
@property(nonatomic)BOOL isSrerch;



@property(nonatomic,strong)UITextField *textSearch;
@property(nonatomic,strong)UIButton *searchBtn;

//@property(nonatomic,strong)UIControl *top;
@end

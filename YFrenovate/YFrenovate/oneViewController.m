//
//  oneViewController.m
//  YFrenovate
//
//  Created by qianfeng on 16/1/11.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "oneViewController.h"

@interface oneViewController ()
//@property(nonatomic,assign)NSInteger starPage;

@end

@implementation oneViewController
-(void)creatTop
{
   // self.top= [[UIControl alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
    
//    OnetopView *topview = [[OnetopView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50)];
   // self.tableView.tableHeaderView=self.top;
}
-(void)btnClickSearch
{
    self.isSrerch =YES;
    self.cityName =self.textSearch.text;
     NSLog(@"%@",self.cityName);
    [self loaddata];
//[self.tableView reloadData];
    [self.textSearch resignFirstResponder];//
}
-(void)loaddata
{
    AFHTTPRequestOperationManager *man = [AFHTTPRequestOperationManager manager];
    man.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    NSDictionary *dic=@{@"uid": @"",@"model": @"company",@"cityName": @"深圳",@"imei": @"865198024511152",@"townId": @"0",@"appid": @"29",@"appversion": @"2.1.5",@"perPage": @"30",@"type": @"4",@"appostype": @"1",@"to8to_token": @"",@"version": @"2.5",@"page": @"1",@"action": @"list",@"longitude": @"113.95103",@"latitude": @"22.539645",@"systemversion": @"19",@"channel": @"sanliuling",@"paging": @"true"};
    
    self.longitude=dic[@"longitude"];
    self.latitude=dic[@"latitude"];
    
    NSMutableDictionary *parameter =[[NSMutableDictionary alloc]initWithDictionary:dic];
    //NSInteger temp = self.pageindex;
    [parameter setObject:[NSString stringWithFormat:@"%ld",self.pageindex] forKey:@"page"];
    [parameter setObject:self.cityName forKey:@"cityName"];
    [man POST:path_thired_company parameters:parameter success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if(self.isDown == YES)
        {
            //删除数据
            //1.清空数据库中的数据
            // [[YFshareData sharedInstance] removeQIuModel];
            [self.data removeAllObjects];
            self.isDown = NO;
        }
        if (self.isSrerch) {
            [self.data removeAllObjects];
            self.isSrerch = NO;

        }
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        // [self getLocation];
        for (NSDictionary *obj in dic[@"data"]) {
            OneModel *model = [[OneModel alloc]initWithDic:obj];
            [self.data addObject:model];
        }
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}
-(void)createUI
{
    self.headView = [[MJRefreshHeaderView alloc] initWithScrollView:self.tableView];
    self.footView = [[MJRefreshFooterView alloc] initWithScrollView:self.tableView];
    
    self.headView.delegate = self;
    self.footView.delegate = self;
}
-(void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView
{
    if(refreshView == self.headView)
    {
        self.pageindex = 1;
        
        self.isDown = YES;
        
    }
    else if(refreshView == self.footView)
    {
        self.pageindex += 1;
        self.isDown = NO;
    }
    
    [self loaddata];
    
    //停止刷新
    [refreshView performSelector:@selector(endRefreshing) withObject:nil afterDelay:1.0f];
}
//-(void)loacation
//{
//
//}
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    if ([error code] == kCLErrorDenied)
    {
        //访问被拒绝
        NSLog(@"访问被拒绝");
    }
    if ([error code] == kCLErrorLocationUnknown) {
        //无法获取位置信息
        NSLog(@"无法获取位置信息");
    }
}


-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    
    CLLocation *newLocation = locations[0];
    CLLocationCoordinate2D oldCoordinate = newLocation.coordinate;
    
    NSLog(@"旧的经度：%f,旧的纬度：%f",oldCoordinate.longitude,oldCoordinate.latitude);

    
    [manager stopUpdatingLocation];
    
    //------------------位置反编码-----------------------
    CLGeocoder *geoCoder = [[CLGeocoder alloc] init];
    
    CLLocation *currentlocations = [[CLLocation alloc] initWithLatitude:oldCoordinate.latitude longitude:oldCoordinate.longitude];
    [geoCoder reverseGeocodeLocation:currentlocations completionHandler:^(NSArray *placemarks, NSError *error) {
        CLPlacemark *placeMark = placemarks[0];
        self.currentWeiZhi=placeMark.name;
        self.cityName = placeMark.locality;
        [self.tableView reloadData];
    }];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.cityName= @"深圳";
    self.locationManager = [[CLLocationManager alloc] init];
    // 设置定位精度
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    //定位的频率
    self.locationManager.distanceFilter = 10.0f;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
    {
        
        [_locationManager requestWhenInUseAuthorization];  //弹出允许框.
    }
    if([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
    {
        //requestAlwaysAuthorization  ---->  NSLocationAlwaysUsageDescription  plist.
        [self.locationManager requestAlwaysAuthorization];
    }
    // 开始时时定位
    [self.locationManager startUpdatingLocation];
    self.pageindex=1;
    
    self.edgesForExtendedLayout=NO;
    self.view.backgroundColor=[UIColor redColor];
    self.data=[NSMutableArray array];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerNib:[UINib nibWithNibName:@"OneCell" bundle:nil] forCellReuseIdentifier:@"oneCell"];
    
    [self createUI];
   // [self creatTop];
    [self loaddata];
    
    
    
    // Do any additional setup after loading the view.
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    OneCell *cell = [tableView dequeueReusableCellWithIdentifier:@"oneCell"];
    OneModel *model = self.data[indexPath.row];
    [cell refrushUI:model];
    
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return 70;//section头部高度
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{


    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 70)];
    UIControl *location=[[UIControl alloc]init];
    view.backgroundColor=[UIColor colorWithRed:215/255.0 green:215/255.0 blue:215/255.0 alpha:0.3];
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(20, 45, 60, 20)];
    lab.text=@"当前位置:";
    lab.textColor = [UIColor grayColor];
    lab.font = [UIFont systemFontOfSize:12.0];
    [location addSubview:lab];
    UILabel *currentLocation=[[UILabel alloc]initWithFrame:CGRectMake(80, 45, [UIScreen mainScreen].bounds.size.width-130, 20)];
    currentLocation.text=self.currentWeiZhi;
    currentLocation.textColor=[UIColor grayColor];
    currentLocation.font=[UIFont systemFontOfSize:12.0];
    [location addSubview:currentLocation];
    UIImageView *refrush=[[UIImageView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-30, 50, 13, 13)];
    //refrush.backgroundColor=[UIColor redColor];
    refrush.image=[UIImage imageNamed:@"Refresh"];
    refrush.userInteractionEnabled=YES;
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(refrushLocation)];
    [refrush addGestureRecognizer:tap];
    [view addSubview:refrush];
    [view addSubview:location];
    
    OnetopView *topview = [[OnetopView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40)];
    topview.backgroundColor=[UIColor whiteColor];
    [view addSubview:topview];
    self.textSearch = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width-80, 40)];
    self.textSearch.placeholder = @"搜索城市";
    [view addSubview:self.textSearch];
    self.searchBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.searchBtn.frame=CGRectMake(self.view.frame.size.width-80, 0, 60, 40);
    [self.searchBtn setTitle:@"搜索" forState:UIControlStateNormal];
    [self.searchBtn addTarget:self action:@selector(btnClickSearch) forControlEvents:UIControlEventTouchUpInside];
    
    [view addSubview:self.searchBtn];
    return view;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    OneIntoViewController *into = [[OneIntoViewController alloc]init];
    OneModel *model = self.data[indexPath.row];
    into.cid =model.cid;
    [self.navigationController pushViewController:into animated:YES];

    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)refrushLocation
{
    NSLog(@"666");
    [self.tableView reloadData];
}
- (void)dealloc{
    [self.headView free];
    [self.footView free];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
     self.tabBarController.tabBar.hidden=YES;
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden=NO;
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end

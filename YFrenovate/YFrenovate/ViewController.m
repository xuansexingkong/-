//
//  ViewController.m
//  YFrenovate
//
//  Created by qianfeng on 15/12/30.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "ViewController.h"
#define WIDTH self.view.frame.size.width
@interface ViewController ()
@property(nonatomic,assign)NSInteger CountNum;
@end

@implementation ViewController

-(void)creatTop
{
    AFHTTPRequestOperationManager *man = [AFHTTPRequestOperationManager manager];
    man.responseSerializer = [AFHTTPResponseSerializer serializer];
    [man GET:path_home_top parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"succes");
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        //NSLog(@"%@",dic);
        for (NSDictionary *obj in dic[@"data"]) {
            HomeTopModel *topmodel = [[HomeTopModel alloc] initWithDic:obj];
            
            [self.Topdata addObject:topmodel];
            
        }
        
        HomeTopView *topview = [[HomeTopView alloc]initWithFrame:CGRectMake(0, 64, WIDTH, 260) topdata:self.Topdata];
        topview.webblock = ^(UITapGestureRecognizer*tap,NSMutableArray *weburl,NSInteger tag)
        {
            WebViewController *webcon = [[WebViewController alloc]init];
            
            webcon.Weburl = weburl[tag-200];
            if (tag-200==2) {
                webcon.Weburl=@"http://m.to8to.com/xiaoguotu/topic/";
            }
            [self.navigationController pushViewController:webcon animated:YES];
        };
        
        self.Topview = topview;
        // [self.view addSubview:self.Topview];
        self.TableView.tableHeaderView =self.Topview;
        
        
        [self.TableView reloadData];
        //self.CountNum++;
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"fail");
    }];
    
}
-(void)creatInspirationCell
{
    AFHTTPRequestOperationManager *man = [AFHTTPRequestOperationManager manager];
    man.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSString *str = path_home_first;
    NSString *utf = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [man GET:utf parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"succes");
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        HomeFirstModel *model = [[HomeFirstModel alloc]init];
        for (NSInteger i = 0; i<4; i++) {
            
            NSDictionary *obj = dic[@"data"][i];
            [model initWithDic:obj];
        }
        [self.InspirationData addObject:model];
        [self.data addObject:self.InspirationData];
        [self.TableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"fail");
    }];
    
}
-(void)creatHotDenmo
{
    
    // NSLog(@"%@",self.secondData);
    
    for (NSInteger i = 0; i<self.secondData.count; i++) {
        HomeSecModel *model = [[HomeSecModel alloc]initWithDic:self.secondData[i]];
        
        [self.HotDemoData addObject:model];
    }
    
    //[self.data addObject:self.HotDemoData];
    // NSLog(@"%@",self.HotDemoData[0]);
    //[self.TableView reloadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.cells = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"CellList" ofType:@"plist"]];
    self.secondData = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"SecondDataPlist" ofType:@"plist"]];
    self.NeedData = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ThiredNeedPlist" ofType:@"plist"]];
    
    self.HotDemoData = [NSMutableArray array];
    self.data =[NSMutableArray array];
    self.Topdata = [NSMutableArray array];
    self.InspirationData = [[NSMutableArray alloc]init];
    self.TableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    // self.TableView.sectionFooterHeight = 40;
    self.TableView.backgroundColor = [UIColor grayColor];
    self.TableView.bounces = NO;
    self.TableView.delegate = self;
    self.TableView.dataSource = self;
    self.TableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:self.TableView];
    [self creatTop];
    //0
    [self creatInspirationCell];
    [self.TableView registerNib:[UINib nibWithNibName:@"FirstTableViewCell" bundle:nil] forCellReuseIdentifier:@"inspirationCell"];
    //1
    [self.TableView registerNib:[UINib nibWithNibName:@"SecondZTableViewCell" bundle:nil] forCellReuseIdentifier:@"HotDemoCellZ"];
    //2
    [self creatHotDenmo];
    [self.TableView registerNib:[UINib nibWithNibName:@"SecondTableViewCell" bundle:nil] forCellReuseIdentifier:@"HotDemoCell"];
    
    //3
    //[];
    [self.TableView registerNib:[UINib nibWithNibName:@"ThiredTableViewCell" bundle:nil] forCellReuseIdentifier:@"NeedCell"];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//tableview 协议方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==4) {
        return 5;
    }
    return self.data.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==2) {
        return 287;
    }
    if (indexPath.section==1 ||indexPath.section==3) {
        return 59;
    }
    if (indexPath.section==4) {
        return 97;
    }
    return 427;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==2||section==4 || section==0) {
        return 0;
    }
    return 12;//section头部高度
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    switch (indexPath.section) {
            
        case 0:
        {
            FirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cells[0][0]];
            HomeFirstModel *model = self.data[0][0];
            //         NSLog(@"111%@",model.title[1]);
            cell.webblock = ^(UITapGestureRecognizer *tap,NSString *webUrl)
            {
                WebViewController *webcon = [[WebViewController alloc]init];
                webcon.Weburl = webUrl;
                [self.navigationController pushViewController:webcon animated:YES];
                
            };
            
            [cell refrushUI:model];
            return cell;
            
        }
            break;
        case 1:
        {
            SecondZTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:self.cells[0][1]];
            cell.headImge.userInteractionEnabled = YES;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(TapClickZ:)];
            [cell.headImge addGestureRecognizer:tap];
            return cell;
            
            
        }
            break;
        case 2:
        {
            SecondTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:self.cells[0][2]];
            cell.Title.text = self.secondData[0][@"title"];
            cell.subTitle.text = self.secondData[0][@"summary"];
            [cell.HeadImage sd_setImageWithURL:[NSURL URLWithString:self.secondData[0][@"filename"]] placeholderImage:[UIImage imageNamed:@"B7133241330"]];
            cell.HeadImage.userInteractionEnabled =YES;
            cell.webURL = self.secondData[0][@"webUrl"];
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(TapClick:)];
            [cell.HeadImage addGestureRecognizer:tap];
            
            return cell;
            
            
        }
            break;
        case 3:
        {
            SecondZTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:self.cells[0][1]];
            cell.headImge.userInteractionEnabled = YES;
            cell.title.text = @"装修必读";
            cell.subTitle.text = @"所处阶段:准备";
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(TapClickNeed)];
            [cell.headImge addGestureRecognizer:tap];
            return cell;
            
            
        }
            break;
        case 4:
        {
            ThiredTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:self.cells[0][3]];
            NSDictionary *dic= self.NeedData[indexPath.row];
            cell.webblock = ^(NSString *webUrl)
            {
                WebViewController *webcon = [[WebViewController alloc]init];
                webcon.Weburl = webUrl;
                [self.navigationController pushViewController:webcon animated:YES];
                
            };
            
            [cell refrushUI:dic];
            
            return cell;
            
            
        }
            break;
            
        default:
        {
            
            FirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cells[0][0]];
            HomeFirstModel *model = self.data[0][0];
            cell.webblock = ^(UITapGestureRecognizer *tap,NSString *webUrl)
            {
                WebViewController *webcon = [[WebViewController alloc]init];
                webcon.Weburl = webUrl;
                [self.navigationController pushViewController:webcon animated:YES];
                
            };
            
            [cell refrushUI:model];
            return cell;
            
            
        }
            
            break;
    }
    
    return cell;
    
}
-(void)TapClick:(UITapGestureRecognizer *)tap
{
    WebViewController *webcon = [[WebViewController alloc]init];
    webcon.Weburl = self.secondData[0][@"webUrl"];;
    [self.navigationController pushViewController:webcon animated:YES];
    
}
-(void)TapClickZ:(UITapGestureRecognizer*)tap
{
    HotDemoTableViewController *con=[[HotDemoTableViewController alloc]init];
    con.data = self.HotDemoData;
    //HomeSecModel *model =self.HotDemoData[1];
    //NSLog(@"%@",model.title);
    [self.navigationController pushViewController:con animated:YES];
}
-(void)TapClickNeed
{

    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:[[NeedFirstViewController alloc] init]];
    //NeedSecondViewController *leftMenuViewController = [[NeedSecondViewController alloc] init];
    NeedthreeViewController *rightMenuViewController = [[NeedthreeViewController alloc] init];
    
    // Create side menu controller
    //
    RESideMenu *sideMenuViewController = [[RESideMenu alloc] initWithContentViewController:navigationController
                                                                    leftMenuViewController:nil
                                                                   rightMenuViewController:rightMenuViewController];
    sideMenuViewController.backgroundImage = [UIImage imageNamed:@"first.jpeg"];
    //[self.navigationController pushViewController:sideMenuViewController animated:YES];
    [self presentViewController:sideMenuViewController animated:YES completion:nil];
}
@end

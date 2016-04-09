//
//  NeedthreeViewController.m
//  YFrenovate
//
//  Created by qianfeng on 16/1/12.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "NeedthreeViewController.h"

@interface NeedthreeViewController ()
@property (strong, readwrite, nonatomic) UITableView *tableView;
@end

@implementation NeedthreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, (self.view.frame.size.height - 54 * 8) / 2.0f, self.view.frame.size.width, 54 * 8) style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor clearColor];
  //  self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    
    [self.view addSubview:self.tableView];

    // Do any additional setup after loading the view.
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 54;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:21];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.textLabel.highlightedTextColor = [UIColor lightGrayColor];
        cell.selectedBackgroundView = [[UIView alloc] init];
    }
    
    NSArray *titles = @[@"准备阶段", @"拆改阶段", @"水电阶段", @"泥木阶段",@"油漆阶段",@"竣工阶段",@"软装阶段",@"入住阶段"];
   // NSLog(@"22%ld",indexPath.row);
    cell.textLabel.text = titles[indexPath.row];
    
    cell.textLabel.textAlignment = NSTextAlignmentRight;
    //cell.imageView.image = [UIImage imageNamed:images[indexPath.row]];
    return cell;
}
-(void)creatFirst:(NSInteger)num
{
    NeedFirstViewController *first= [[NeedFirstViewController alloc]init];
    first.NUM=num;
    [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:first] animated:YES];
    [self.sideMenuViewController hideMenuViewController];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self creatFirst:indexPath.row];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

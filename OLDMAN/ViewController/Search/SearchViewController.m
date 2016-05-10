//
//  SearchViewController.m
//  OLDMAN
//
//  Created by 赵晓东 on 16/5/10.
//  Copyright © 2016年 ZXD. All rights reserved.
//

#import "SearchViewController.h"

#import "MJRefresh.h"//上下拉刷新

@interface SearchViewController ()<UISearchBarDelegate>
{
    UITableView * _tableView;//主视图
    
    UISearchBar * _mySearchBar;//搜索框
}
@property(nonatomic,assign)int NewsListPage;
//数据
@property(nonatomic,retain)NSMutableArray * dataSourse;
@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=View_Background_Color;
    
    //设置导航
    [self createNav];
    
    _dataSourse=[[NSMutableArray alloc]init];
    
    //设置页面
    [self createView];
}

#pragma mark 设置导航
-(void)createNav
{
    //设置导航不透明
    self.navigationController.navigationBar.translucent=NO;
    
    //设置导航的标题
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:CREATECOLOR(255, 255, 255, 1),NSFontAttributeName:[UIFont boldSystemFontOfSize:Title_text_font]}];
    self.navigationItem.title = @"北京市老年人评估及服务系统";
    
    //设置导航背景图
    self.navigationController.navigationBar.barTintColor = Nav_Tabbar_backgroundColor;
    
    //返回
    UIButton * returnButton=[ZCControl createButtonWithFrame:CGRectMake(0, 0, Return_button_width, 18) Text:nil ImageName:@"reg_return@2x.png" bgImageName:nil Target:self Method:@selector(returnButtonClick)];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:returnButton];
    returnButton.imageEdgeInsets=UIEdgeInsetsMake(0, 0, 0, Return_button_width/3*2);
}

//返回
-(void)returnButtonClick
{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark 设置页面
-(void)createView
{
    //主视图
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(WIDTH*0, 0, WIDTH, HEIGHT-64-PAGESIZE(46)-65) style:UITableViewStylePlain];
    _tableView.backgroundColor=View_Background_Color;
    _tableView.separatorStyle = UITableViewCellSelectionStyleNone;//去掉分割线
    [_tableView setSeparatorColor:CREATECOLOR(227, 227, 227, 1)];
    [self.view addSubview:_tableView];
//    _tableView.delegate=self;
//    _tableView.dataSource=self;
//    [_tableView registerClass:[RootTableViewCell class] forCellReuseIdentifier:@"ID"];
    
    
    _mySearchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 40)];
    _tableView.tableHeaderView = _mySearchBar;
    _mySearchBar.delegate = self;
    
    
//    //添加上下拉刷新
//    __weak typeof(self) weakSelf = self;
//    [_tableView addLegendHeaderWithRefreshingBlock:^{
//        //当出发下拉刷新的时候
//        _NewsListPage=1;
//        [weakSelf loadData:_NewsListPage];
//    }];
//    
//    //添加上拉刷新
//    [_tableView addLegendFooterWithRefreshingBlock:^{
//        [weakSelf loadData:_NewsListPage];
//    }];
}


-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"%@",searchBar.text);
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

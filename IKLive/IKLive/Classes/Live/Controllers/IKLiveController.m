//
//  IKLiveController.m
//  IKLive
//
//  Created by 吕成翘 on 16/11/5.
//  Copyright © 2016年 Apress. All rights reserved.
//

#import "IKLiveController.h"
#import "NetworkTool.h"
#import "IKLiveModel.h"
#import "IKLiveCell.h"
#import "IKWatchLiveController.h"


static NSString *cellID = @"cellID";


@interface IKLiveController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *liveTableView;

@end


@implementation IKLiveController {
    NSMutableArray<IKLiveModel *> *_liveList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _liveList = [NSMutableArray arrayWithCapacity:200];
    
    [self loadData];
    [self setupUI];
}

#pragma mark - LoadData
- (void)loadData {
    NSString *URLStirng = @"http://116.211.167.106/api/live/aggregation?uid=133825214&interest=1";
    [[NetworkTool sharedNetworkTool] GETWithURLString:URLStirng successBlock:^(NSDictionary *responseObject) {
        NSArray<NSDictionary *> *array = responseObject[@"lives"];
        for (NSDictionary *dictionary in array) {
            IKLiveModel *model = [IKLiveModel new];
            model.city = dictionary[@"city"];
            model.nick = dictionary[@"creator"][@"nick"];
            model.portrait = dictionary[@"creator"][@"portrait"];
            model.online_users = [dictionary[@"online_users"] integerValue];
            model.stream_addr = dictionary[@"stream_addr"];
            [_liveList addObject:model];
        }
        
        [self.liveTableView reloadData];
    } failBlock:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

#pragma mark - SetupUI
- (void)setupUI {
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"热门";
    
    UITableView *liveTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - kStatusBarHeight - kTabBarHeight)];
    liveTableView.rowHeight = UITableViewAutomaticDimension;
    liveTableView.estimatedRowHeight = 400;
    liveTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    liveTableView.dataSource = self;
    liveTableView.delegate = self;
    [self.view addSubview:liveTableView];
    _liveTableView = liveTableView;
    
    [liveTableView registerClass:[IKLiveCell class] forCellReuseIdentifier:cellID];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _liveList.count == 0 ? _liveList.count : 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    IKLiveCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.model = _liveList[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    IKLiveModel *model = _liveList[indexPath.row];
    NSURL *liveURL = [NSURL URLWithString:model.stream_addr];
    NSURL *imageURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://img.meelive.cn/%@",model.portrait]];
    
    IKWatchLiveController *watchLiveController = [IKWatchLiveController new];
    watchLiveController.liveURL = liveURL;
    watchLiveController.imageURL = imageURL;
    [self.navigationController pushViewController:watchLiveController animated:YES];
}

@end

//
//  ViewController.m
//  SDWebImageLoadImageAnimation
//
//  Created by YouXianMing on 15/4/30.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "ViewController.h"
#import "PictureCell.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

/**
 *  数据源
 */
@property (nonatomic, strong) NSMutableArray   *modelsArray;

/**
 *  tableView
 */
@property (nonatomic, strong) UITableView      *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化数据源
    NSArray *picsArray = @[@"http://pic.cnitblog.com/avatar/607542/20140226182241.png",
                           @"http://pic.cnitblog.com/avatar/a49237.png?id=31183139",
                           @"http://pic.cnitblog.com/avatar/751954/20150430140947.png",
                           @"http://pic.cnitblog.com/avatar/680363/20150315172929.png",
                           @"http://pic.cnitblog.com/avatar/490617/20140612182827.png",
                           @"http://pic.cnitblog.com/avatar/77734/20140925202137.png",
                           @"http://pic.cnitblog.com/avatar/726558/20150302212034.png",
                           @"http://pic.cnitblog.com/avatar/619104/20140622195607.png",
                           @"http://pic.cnitblog.com/avatar/695863/20150416154015.png",
                           @"http://pic.cnitblog.com/avatar/526391/20141226102235.png",
                           @"http://pic.cnitblog.com/avatar/485855/20140824172432.png",
                           @"http://pic.cnitblog.com/avatar/741774/20150408141002.png",
                           @"http://pic.cnitblog.com/avatar/618574/20140329230350.png"];
    self.modelsArray = [NSMutableArray array];
    for (int count = 0; count < picsArray.count; count++) {
        [_modelsArray addObject:[PictureModel pictureModelWithPictureUrl:[NSURL URLWithString:picsArray[count]]
                                                            haveAnimated:NO]];
    }
    
    
    // 初始化tableView
    self.tableView            = [[UITableView alloc] initWithFrame:self.view.bounds
                                                             style:UITableViewStylePlain];
    self.tableView.delegate   = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[PictureCell class] forCellReuseIdentifier:FLAG_PictureCell];
    [self.view addSubview:self.tableView];
    
}

#pragma mark - DataSource代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _modelsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PictureCell *cell = [tableView dequeueReusableCellWithIdentifier:FLAG_PictureCell];
    
    // 加载数据
    [cell loadData:_modelsArray[indexPath.row] withIndexPath:indexPath];
    
    return cell;
}

#pragma mark - cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return HEIGHT_PictureCell;
}

@end

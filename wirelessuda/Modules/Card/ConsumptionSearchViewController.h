//
//  ConsumptionSearchViewController.h
//  wirelessuda
//
//  Created by Mac on 13-11-18.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConsumptionSearchViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic)UITableView *tableView;
@property (strong, nonatomic)NSMutableArray *turnover;
@property (strong, nonatomic)NSMutableArray *balance;
@property (strong, nonatomic)NSMutableArray *time;
@property (strong, nonatomic)NSMutableArray *place;
@property (strong, nonatomic)NSMutableArray *type;

@end

//
//  lineDetailViewController.h
//  SchoolBusTest
//
//  Created by Tkey on 13-11-19.
//  Copyright (c) 2013年 TKey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UINavigationController+MHDismissModalView.h"



@interface lineDetailViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic,strong)IBOutlet UITableView *lineDetailTable;
@property (nonatomic,strong) NSArray *detailLineInfo;
@end

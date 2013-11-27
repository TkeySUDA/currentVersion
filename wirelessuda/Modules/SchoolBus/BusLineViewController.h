//
//  BusLineViewController.h
//  SchoolBusTest
//
//  Created by Tkey on 13-11-19.
//  Copyright (c) 2013年 TKey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLMianBusViewController.h"

@interface BusLineViewController : UIViewController
<UITableViewDataSource, UITableViewDelegate,buttonSelectDelegate>

{
    
    __weak IBOutlet UITableView *busLineTable;
    __weak IBOutlet UILabel *descriptionLabel;
}

@property (nonatomic, strong) NSString *selectTitle;
@property (nonatomic, strong) NSMutableArray *lineData;

@end

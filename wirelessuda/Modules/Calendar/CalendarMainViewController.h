//
//  CalendarMainViewController.h
//  WLCalendar
//
//  Created by Tkey on 13-11-21.
//  Copyright (c) 2013年 WL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLSudaCommonViewController.h"

@interface CalendarMainViewController : WLSudaCommonViewController
@property (nonatomic,strong) UISegmentedControl *segController;
@property (nonatomic,strong) UILabel *descriptionLabel;
@property (nonatomic,strong) UIScrollView *monthView;
@property (nonatomic,strong) UIImageView *monthImage;

- (void)monthSelect:(NSInteger)term;
//- (NSInteger)monthOffSet:(NSInteger) term;

@end

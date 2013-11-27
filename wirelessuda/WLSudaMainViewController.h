//
//  WLSudaMainViewController.h
//  wirelessuda
//
//  Created by Mac on 13-10-23.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "mainViewScrollView.h"
#import "CustomButton.h"
#import "WLSudaCommonViewController.h"
#import "CheckNetWork.h"

@interface WLSudaMainViewController : UIViewController<UIScrollViewDelegate>

@property (strong, nonatomic)UIPageControl *pageControl;
@property (strong, nonatomic)mainViewScrollView *topScrollView;
@property (strong, nonatomic)UIView *subView;
@property (strong, nonatomic)CheckNetWork *checkNetWork;

@end

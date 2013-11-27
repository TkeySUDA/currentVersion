//
//  CardViewController.h
//  wirelessuda
//
//  Created by Mac on 13-11-17.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLSudaCommonViewController.h"
#import "PersonInfoView.h"
#import "BtScrollView.h"
#import "DetailInfoView.h"
#import "GuaShiView.h"
#import "ChangePsdView.h"
#import "ConsumptionView.h"

@interface CardViewController : WLSudaCommonViewController<buttonDelegate>

@property (strong, nonatomic)PersonInfoView *personInfoView;
@property (strong, nonatomic)BtScrollView *btScrollView;
@property (strong, nonatomic)UIView *functionScrollView;
@property (strong, nonatomic)DetailInfoView *detailInfoView;
@property (strong, nonatomic)GuaShiView *guaShiView;
@property (strong, nonatomic)ChangePsdView *changePsdView;
@property (strong, nonatomic)ConsumptionView *consumptionView;

@end

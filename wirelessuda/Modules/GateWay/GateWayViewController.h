//
//  GateWayViewController.h
//  wirelessuda
//
//  Created by ivanfee on 13-11-9.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChangePasswordView.h"
#import "BindPhoneView.h"
#import "WLSudaCommonViewController.h"

@interface GateWayViewController : WLSudaCommonViewController<ChangePasswordDelegate,BindPhoneDelegate, GateWayDelegtate>
{
    CGFloat span;
}

@property (strong, nonatomic)UIImageView *userPhoto;
@property (strong, nonatomic)UILabel *userInfo;
@property (strong, nonatomic)UIButton *appButton;
@property (strong, nonatomic)UILabel *appName;
@property (strong, nonatomic)NSString *oldPsd;
@property (strong, nonatomic)NSString *changedPsd;
@property (strong, nonatomic)ChangePasswordView *changePasswordView;
@property (strong, nonatomic)BindPhoneView *bindPhoneView;
@property (strong, nonatomic)NSString *phone;
@property (strong, nonatomic)NSString *code;

@property (strong, nonatomic)NSString *turnOver;
@property (strong, nonatomic)NSString *bindPhone;


@end

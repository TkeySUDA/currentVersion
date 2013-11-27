//
//  ChangePasswordView.h
//  wirelessuda
//
//  Created by Mac on 13-11-19.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GateWayModel.h"

@protocol ChangePasswordDelegate;

@interface ChangePasswordView : UIView<GateWayDelegtate>

@property (nonatomic, strong)UILabel *oldPsdLabel;
@property (nonatomic, strong)UILabel *changedPsdLabel;
@property (nonatomic, strong)UILabel *confirmPsdLabel;
@property (nonatomic, strong)UITextField *oldPsdField;
@property (nonatomic, strong)UITextField *changedPsdField;
@property (nonatomic, strong)UITextField *confirmPsdField;
@property (nonatomic, strong)UIButton *confirmButton;
@property (nonatomic, strong)NSString *status;
@property (nonatomic, strong)id<ChangePasswordDelegate> delegate;

@end
@protocol ChangePasswordDelegate <NSObject>

@optional

-(void)getResult:(NSString *)result;

@end
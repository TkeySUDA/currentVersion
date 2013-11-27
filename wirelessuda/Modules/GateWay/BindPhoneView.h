//
//  BindPhoneView.h
//  wirelessuda
//
//  Created by Mac on 13-11-19.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GateWayModel.h"

@protocol BindPhoneDelegate;

@interface BindPhoneView : UIView<GateWayDelegtate>

@property (nonatomic, strong)UITextField *phoneNumberText;
@property (nonatomic, strong)UITextField *codeText;
@property (nonatomic, strong)UIButton *cancelBind;
@property (nonatomic, strong)UILabel *identifyNumLabel;
@property (nonatomic, strong)UITextField *identifyNumText;
@property (nonatomic, strong)UIButton *confirmCancelBind;
@property (nonatomic, strong)NSString *code;
@property (nonatomic, strong)NSString *onstatus;
@property (nonatomic, strong)NSString *offstatus;
@property (nonatomic, strong)id<BindPhoneDelegate> delegate;

- (id)initWithFrame:(CGRect)frame withTag:(NSString *)tag;

@end

@protocol BindPhoneDelegate <NSObject>

@optional

-(void)getCode:(NSString *)code;
-(void)getOnResult:(NSString *)result;
-(void)getOffResult:(NSString *)result;

@end

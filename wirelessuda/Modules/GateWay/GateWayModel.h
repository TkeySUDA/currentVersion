//
//  GateWayModel.h
//  wirelessuda
//
//  Created by Mac on 13-11-13.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

typedef enum {
    Login,
    ChangePassWord,
    UserInfoTurnOver,
    UserInfoBindPhone,
    Code,
    OnBind,
    OffBind,
} GateWayLine;

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
#import "ASINetworkQueue.h"

@protocol GateWayDelegtate;

@interface GateWayModel : NSObject<ASIHTTPRequestDelegate>

@property (strong, nonatomic) id<GateWayDelegtate> delegate;

+ (GateWayModel *)shareInstance;
- (void) start:(NSString *)tag withUrl:(NSString *)url withParam1:(NSString *)param1 withParam2:(NSString *)param2 withParam3:(NSString *)param3 withParam4:(NSString *)param4;

@end
@protocol GateWayDelegtate <NSObject>

@optional
-(void)getLoginResult:(NSString *)status;
-(void)getChangePasswordResult:(NSString *)status;
-(void)getUserInfoTurnOverResult:(NSString *)status;
-(void)getUserInfoBindPhoneResult:(NSString *)status withPhoneNumber:(NSString *)number;
-(void)getCodeResult:(NSString *)status;
-(void)getOnBindResult:(NSString *)status;
-(void)getOffBindResult:(NSString *)status;

@end



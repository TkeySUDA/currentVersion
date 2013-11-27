//
//  BindPhoneVaildata.h
//  wirelessuda
//
//  Created by 叶帆 on 13-11-22.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GateWayModel.h"

@interface BindPhoneVaildata : NSObject<GateWayDelegtate>

@property(strong, nonatomic)NSString *code;
@property(strong, nonatomic)NSString *onstatus;
@property(strong, nonatomic)NSString *offstatus;

- (NSString *)judgePhoneNum:(UITextField *)phoneNumberText;
- (NSString *)judgeCode:(UITextField *)codeText;
- (NSString *)judgeIdentify:(UITextField *)identifyText;

- (NSString *)validataCode:(NSString *)phoneNum;
- (NSString *)validataOn:(NSString *)username withPhone:(NSString *)phoneNum withCode:(NSString *)code withseqID:(NSString *)seq;
- (NSString *)validataIdentify:(NSString *)username withIdentify:(NSString *)identify;

@end

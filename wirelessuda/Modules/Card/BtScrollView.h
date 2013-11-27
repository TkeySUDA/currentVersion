//
//  BtScrollView.h
//  wirelessuda
//
//  Created by Mac on 13-11-26.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol buttonDelegate;
@interface BtScrollView : UIView

@property(strong, nonatomic)UIButton *detailInfoButton;
@property(strong, nonatomic)UIButton *guaShiButton;
@property(strong, nonatomic)UIButton *changePsdButton;
@property(strong, nonatomic)UIButton *consumptionSearchButton;
@property(strong, nonatomic)UIButton *pickCardButton;
@property(strong, nonatomic)id<buttonDelegate> delegate;

@end
@protocol buttonDelegate <NSObject>

@optional

-(void)buttonClick:(NSString *)which;

@end
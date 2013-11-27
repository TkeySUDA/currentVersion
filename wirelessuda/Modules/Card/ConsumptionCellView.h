//
//  ConsumptionCellView.h
//  wirelessuda
//
//  Created by Mac on 13-11-18.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConsumptionCellView : UITableViewCell

@property(strong, nonatomic)UILabel *turnover;
@property(strong, nonatomic)UILabel *turnoverNumber;
@property(strong, nonatomic)UILabel *balance;
@property(strong, nonatomic)UILabel *balanceNumber;

@property(strong, nonatomic)UILabel *time;
@property(strong, nonatomic)UILabel *place;
@property(strong, nonatomic)UILabel *type;

@end

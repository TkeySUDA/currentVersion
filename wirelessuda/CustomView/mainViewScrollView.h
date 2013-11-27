//
//  mainViewScrollView.h
//  WirelessSudaV1-1.01
//
//  Created by Mac on 13-10-25.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface mainViewScrollView : UIScrollView<UIScrollViewDelegate>

@property (strong, nonatomic)NSMutableArray *imagePage;

-(void)setImage;
@end

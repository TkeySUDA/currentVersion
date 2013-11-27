//
//  WLMianBusViewController.h
//  SchoolBusTest
//
//  Created by Tkey on 13-11-19.
//  Copyright (c) 2013年 TKey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLSudaCommonViewController.h"

@protocol buttonSelectDelegate <NSObject>
@optional
- (void)titleOfSelectButton:(NSString *)title;
@end

@interface WLMianBusViewController : WLSudaCommonViewController

{
    __weak IBOutlet UIButton *campus1;
    
    __weak IBOutlet UIButton *campus2;
}
@property (nonatomic, assign) id<buttonSelectDelegate> delegate;

@end

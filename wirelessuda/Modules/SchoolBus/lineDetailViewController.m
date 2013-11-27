//
//  lineDetailViewController.m
//  SchoolBusTest
//
//  Created by Tkey on 13-11-19.
//  Copyright (c) 2013年 TKey. All rights reserved.
//

#import "lineDetailViewController.h"
#import "BusLineDataSourde.h"





@implementation lineDetailViewController
@synthesize lineDetailTable;
@synthesize detailLineInfo;


-(void)viewDidLoad{
    
    [super viewDidLoad];
    
    lineDetailTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    
    self.title = @"详细线路";
    [self.lineDetailTable setDelegate:self];
    [self.lineDetailTable setDataSource:self];
    
    [[self view] addSubview:lineDetailTable];
    
    [self.navigationController installMHDismissModalViewWithOptions:[[MHDismissModalViewOptions alloc] initWithScrollView:lineDetailTable
                                                                                                               theme:MHModalThemeWhite]];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [detailLineInfo count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    cell.backgroundColor = [UIColor colorWithWhite:1 alpha:0.2];
    cell.selectionStyle = 0;
    if (!cell) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:@"UITableViewCell"];
        cell.backgroundColor = [UIColor colorWithWhite:1 alpha:0.2];
    }
    NSMutableString *p =  [NSMutableString stringWithFormat:@"第%i站   ",[indexPath row] + 1];
    NSLog(@"%@",p);
     [p appendString:[detailLineInfo objectAtIndex:[indexPath row]]];
    
    [[cell textLabel] setText:p];
    return cell;
}


@end

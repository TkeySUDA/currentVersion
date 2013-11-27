//
//  BusLineViewController.m
//  SchoolBusTest
//
//  Created by Tkey on 13-11-19.
//  Copyright (c) 2013年 TKey. All rights reserved.
//

#import "BusLineViewController.h"
#import "lineDetailViewController.h"
#import "BusLineDataSourde.h"

@implementation BusLineViewController

- (id)init
{
    self = [super init];
    return self;
}



//- (void)viewDidLoad
//{
////    CGRect tableRect;
////    tableRect.origin.y = descriptionLabel.bounds.origin.y + 80;
////    busLineTable =  [[UITableView alloc] initWithFrame:tableRect style:UITableViewStyleGrouped];
////    [busLineTable setDataSource:self];
////    [busLineTable setDelegate:self];
////    [[self view] addSubview:busLineTable];
//}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

@synthesize selectTitle;
@synthesize lineData;

- (void)viewDidLoad
{
    [super viewDidLoad];
    lineData = [[[NSMutableArray alloc] initWithArray:[[BusLineDataSourde sharedData] linesArrayAndTimeSorted:selectTitle]] mutableCopy];
    NSLog(@"%i", lineData.count);
}




- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [lineData count];

}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    cell.backgroundColor = [UIColor blueColor];
    if (!cell) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:@"UITableViewCell"];
        cell.backgroundColor = [UIColor blueColor];
    }
    NSMutableDictionary *p = [lineData objectAtIndex:[indexPath row]];
    
    if ([p objectForKey:@"Flag"] == [NSNumber numberWithInt:1]) {
        cell.backgroundColor = [UIColor greenColor];
        NSMutableString *t = [NSMutableString stringWithFormat:@"%@",[p objectForKey:@"Name"]];
        [t appendString:[NSString stringWithFormat:@"  %@分钟后可乘",[p objectForKey:@"Last"]]];
        [[cell textLabel] setText:t];
        
    } else {
        if ([p objectForKey:@"Flag"] == [NSNumber numberWithInt:2]) {
            NSMutableString *t = [NSMutableString stringWithFormat:@"%@",[p objectForKey:@"Name"]];
            [t appendString:@"   今日尚有"];
            [[cell textLabel] setText:t];
            cell.backgroundColor = [UIColor yellowColor];
        }
        else {
            NSMutableString *t = [NSMutableString stringWithFormat:@"%@",[p objectForKey:@"Name"]];
            [t appendString:@"   今日已无"];
            [[cell textLabel] setText:t];

            cell.backgroundColor = [UIColor redColor];
        }
    }
    

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@",indexPath);
    lineDetailViewController *modal = [[lineDetailViewController alloc] init];
    NSDictionary *p = [lineData objectAtIndex:[indexPath row]];
    modal.detailLineInfo = [[NSArray alloc] initWithArray:[p objectForKey:@"DetailLine"]];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:modal];
    [self presentViewController:nav animated:YES completion:nil];
}

- (void)titleOfSelectButton:(NSString *)title
{
    selectTitle = title;
}




@end

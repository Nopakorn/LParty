//
//  ListEventViewController.m
//  LParty
//
//  Created by guild on 1/4/2559 BE.
//  Copyright © 2559 guild. All rights reserved.
//

#import "EventListViewController.h"
#import "EventListCell.h"

@implementation EventListViewController

- (void)viewDidLoad
{
    //[self.navigationController setNavigationBarHidden:YES];
    [self createEventData];
//    self.eventListTableView.dataSource = self;
//    self.eventListTableView.delegate = self;
    self.eventListTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [super viewDidLoad];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"numb = %lu",(unsigned long)[self.eventNameList count]);
    return [self.eventNameList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"Cell";
    EventListCell *cell = (EventListCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[EventListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    NSString *hostDetail = [NSString stringWithFormat:@"by %@",[self.eventHostDetailList objectAtIndex:indexPath.row]];
    
    cell.title.text = [self.eventNameList objectAtIndex:indexPath.row];
    cell.detail.text = hostDetail;
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    //implement push here!
}

- (void)createEventData
{
    NSLog(@"Create data");
    
    //crate calendar here
    calendar = @{@"date" : @[],
                 @"date" : @[],
                 @"date" : @[],
                 @"date" : @[],
                 @"date" : @[]};
    
    
    self.eventNameList = [[NSMutableArray alloc] initWithObjects:@"We Talk and Drink", @"Drink only", @"Dance with girl", @"For men only", @"Drink a tea", @"Beyound The submit", @"Lady night",@"Drink with Dev", nil];
    self.eventHostDetailList = [[NSMutableArray alloc] initWithObjects:@"John Frick @Bar21", @"Michel Moneal @sukhumvit77House", @"Shever @BarJJ", @"Bilgate @microsoft", @"John Frick @Bar21", @"Michel Moneal @sukhumvit77House", @"Shever @BarJJ", @"Bilgate @microsoft", nil];
    
    NSLog(@"count = %lu",(unsigned long)[self.eventNameList count]);
    //[self.eventListTableView reloadData];
}

- (void)viewWillAppear:(BOOL)animated
{
    
    //[self.navigationController setNavigationBarHidden:YES];
    
}
@end

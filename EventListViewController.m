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
//    [self.navigationController setNavigationBarHidden:YES];
    [self createEventData];
//    self.eventListTableView.dataSource = self;
//    self.eventListTableView.delegate = self;
    self.eventListTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [super viewDidLoad];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [dateSectionTitles count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [dateSectionTitles objectAtIndex:section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *sectionTitle = [dateSectionTitles objectAtIndex:section];
    NSArray *listEvent = [calendar objectForKey:sectionTitle];
    return [listEvent count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"EventListCustomCell";
    EventListCell *cell = (EventListCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        NSArray *nib =[[NSBundle mainBundle] loadNibNamed:@"EventListCustomCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    NSString *hostDetail = [NSString stringWithFormat:@"by %@",[self.eventHostDetailList objectAtIndex:indexPath.row]];
    cell.detail.text = hostDetail;
    NSString *sectionTitle = [dateSectionTitles objectAtIndex:indexPath.section];
    NSArray *listEvent = [calendar objectForKey:sectionTitle];
    NSString *event = [listEvent objectAtIndex:indexPath.row];
    cell.title.text = event;
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    //implement push here!
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.eventListTableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)createEventData
{
    NSLog(@"Create data");
    //crate calendar here
    calendar = @{@"Monday, Jan 11" : @[@"We Talk and Drink", @"Drink only", @"Dance with girl"],
                 @"Tuesday, Jan 12" : @[@"For men only", @"Drink a tea", @"Beyound The submit", @"Lady night",@"Drink with Dev"],
                 @"Wednesday, Jan 13" : @[@"We Talk and Drink", @"Drink only"],
                 @"Thursday, Jan 14" : @[@"Drink a tea", @"Beyound The submit", @"Lady night",@"Drink with Dev"],
                 @"Friday, Jan 15" : @[@"For men only", @"Drink a tea", @"We Talk and Drink", @"Drink only", @"Dance with girl"]};
    
    dateSectionTitles = [calendar allKeys];
    
    self.eventNameList = [[NSMutableArray alloc] initWithObjects:@"We Talk and Drink", @"Drink only", @"Dance with girl", @"For men only", @"Drink a tea", @"Beyound The submit", @"Lady night",@"Drink with Dev", nil];
    self.eventHostDetailList = [[NSMutableArray alloc] initWithObjects:@"John Frick @Bar21", @"Michel Moneal @sukhumvit77House", @"Shever @BarJJ", @"Bilgate @microsoft", @"John Frick @Bar21", @"Michel Moneal @sukhumvit77House", @"Shever @BarJJ", @"Bilgate @microsoft", nil];
    
    NSLog(@"count = %lu",(unsigned long)[self.eventNameList count]);
    //[self.eventListTableView reloadData];
}

- (void)viewWillAppear:(BOOL)animated
{
//    NSIndexPath *tableSelection = [self.eventListTableView indexPathForSelectedRow];
//    [self.eventListTableView deselectRowAtIndexPath:tableSelection animated:NO];
//    [self.navigationController setNavigationBarHidden:YES];
    
}
@end

//
//  ListEventViewController.m
//  LParty
//
//  Created by guild on 1/4/2559 BE.
//  Copyright © 2559 guild. All rights reserved.
//

#import "EventListViewController.h"
#import "EventDetailViewController.h"
#import "EventListCell.h"

@implementation EventListViewController

- (id)init
{
    if(self = [super init])
    {
        self.checker = false;
    }
    return self;
}

- (void)viewDidLoad
{
//    [self.navigationController setNavigationBarHidden:NO];
    self.eventList = [[NSMutableArray alloc] initWithCapacity:10];
    [self createEventData];
    
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
//    NSString *sectionTitle = [dateSectionTitles objectAtIndex:section];
//    NSArray *listEvent = [calendar objectForKey:sectionTitle];
//    return [listEvent count];
    return [self.eventList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"EventListCustomCell";
    EventListCell *cell = (EventListCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        NSArray *nib =[[NSBundle mainBundle] loadNibNamed:@"EventListCustomCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    Event *eventObj = [self.eventList objectAtIndex:indexPath.row];
    NSString *hostDetail = [NSString stringWithFormat:@"by %@",eventObj.host.name];
    
    cell.host.text = hostDetail;
    cell.title.text = eventObj.name;
    cell.time.text = eventObj.time;
    if (self.checker) {
        cell.imageChecker.hidden = false;
    }else{
        cell.imageChecker.hidden = true;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if([[segue identifier]isEqualToString:@"showInformation" ])
    {
        EventDetailTableViewController *dest = [segue destinationViewController];
        dest.event = self.eventSelected;
        dest.delegate = self;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.eventSelected = [self.eventList objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"showInformation" sender:self];
    [self.eventListTableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)createEventData
{
    NSLog(@"Create data");
    //crate calendar here
  
    dateSectionTitles = [[NSArray alloc] initWithObjects:@"Monday, Jan 11", @"Tuesday, Jan 12",  @"Wednesday, Jan 13", @"Thursday, Jan 14", @"Friday, Jan 15", nil];
    
    self.eventNameList = [[NSMutableArray alloc] initWithObjects:@"We Talk and Drink", @"Drink only", @"Dance with girl", @"For men only", @"Drink a tea", @"Beyound The submit", @"Lady night",@"Drink with Dev", nil];
    self.eventHostDetailList = [[NSMutableArray alloc] initWithObjects:@"@Bar21", @"@sukhumvit77House", @"@BarJJ", @"@inthebox", @"@Bar21", @"@sukhumvit77House", @"@BarJJ", @"@mimemo", nil];
    
    for (int i = 0; i < [self.eventHostDetailList count]; i++) {
        self.host = [[Host alloc] initWithName:[self.eventHostDetailList objectAtIndex:i] andDetail:nil];
        self.event = [[Event alloc] initWithHost:self.host nameEvent:[self.eventNameList objectAtIndex:i]andAmoutOfMember:10];
        [self.eventList addObject:self.event];
    }
    
    for (Event* x in self.eventList) {
        [x checkData];
    }
    
}
- (void)addCheckPoint:(EventDetailTableViewController *)controller didFinishPressedButton:(Boolean)join
{
    self.checker = join;
    [self.tableView reloadData];
}

- (void)viewWillAppear:(BOOL)animated
{
//    NSIndexPath *tableSelection = [self.eventListTableView indexPathForSelectedRow];
//    [self.eventListTableView deselectRowAtIndexPath:tableSelection animated:NO];
//    [self.navigationController setNavigationBarHidden:YES];
    
}
@end

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
{
    NSString *dateSection;
}
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
    self.sectionList = [[NSMutableArray alloc] initWithCapacity:10];
    self.checkerList = [[NSMutableArray alloc]initWithCapacity:10];
    dateSection = nil;
    [self createEventData];
    
    self.eventListTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [super viewDidLoad];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
       return [self.sectionList count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    SectionEvent *sectionObj = [self.sectionList objectAtIndex:section];
    NSString *titleSection = sectionObj.date;
    return titleSection;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    SectionEvent *sectionObj = [self.sectionList objectAtIndex:section];
    NSArray *sectionEventList = [sectionObj getEventList];
    return [sectionEventList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *simpleTableIdentifier = @"EventListCustomCell";
    EventListCell *cell = (EventListCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        NSArray *nib =[[NSBundle mainBundle] loadNibNamed:@"EventListCustomCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    SectionEvent *sectionObj = [self.sectionList objectAtIndex:indexPath.section];
    NSArray *sectionIndex = [sectionObj getEventList];
    Event *eventObj = [sectionIndex objectAtIndex:indexPath.row];
    NSString *hostDetail = [NSString stringWithFormat:@"by %@",eventObj.host.name];
    
    cell.host.text = hostDetail;
    cell.title.text = eventObj.name;
    cell.time.text = eventObj.time;

    if(eventObj.checkMark == YES)
    {
        
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
        dest.sectionEvent = self.sectionEvent;
        dest.event = self.eventSelected;
        dest.delegate = self;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    SectionEvent *sectionObj = [self.sectionList objectAtIndex:indexPath.section];
    Event *eventObj = [[sectionObj getEventList] objectAtIndex:indexPath.row];
    
    self.sectionEvent = sectionObj;
    self.eventSelected = eventObj;
    
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
    
    NSMutableArray *eventNameList_2 = [[NSMutableArray alloc] initWithObjects:@"WeTEST", @"sfds", @"wer girl", @"ggegad", @"wef", nil];
    NSMutableArray *eventHostDetailList_2 = [[NSMutableArray alloc] initWithObjects:@"@Bar21", @"@sukhumvit77House", @"@BarJJ", @"@inthebox", @"@Bar21",nil];
   
    
    for (int i = 0; i < [self.eventHostDetailList count]; i++) {
        self.host = [[Host alloc] initWithName:[self.eventHostDetailList objectAtIndex:i] andDetail:nil];
        self.event = [[Event alloc] initWithHost:self.host nameEvent:[self.eventNameList objectAtIndex:i]andAmoutOfMember:10];
        [self.eventList addObject:self.event];
        
    }
    
    NSMutableArray *eventList_2 = [[NSMutableArray alloc] initWithCapacity:10];
    for(int i = 0 ; i<[eventNameList_2 count]; i++){
        
        self.host = [[Host alloc] initWithName:[eventHostDetailList_2 objectAtIndex:i] andDetail:nil];
        self.event = [[Event alloc] initWithHost:self.host nameEvent:[eventNameList_2 objectAtIndex:i]andAmoutOfMember:10];
        
        [eventList_2 addObject:self.event];
    }
    
    NSMutableArray *eventList_3 = [[NSMutableArray alloc] initWithCapacity:10];
    for(int i = 0 ; i<[eventNameList_2 count]; i++){
        
        self.host = [[Host alloc] initWithName:[eventHostDetailList_2 objectAtIndex:i] andDetail:nil];
        self.event = [[Event alloc] initWithHost:self.host nameEvent:[eventNameList_2 objectAtIndex:i]andAmoutOfMember:10];
        
        [eventList_3 addObject:self.event];
    }
    
    NSMutableArray *eventList_4 = [[NSMutableArray alloc] initWithCapacity:10];
    for(int i = 0 ; i<[eventNameList_2 count]; i++){
        
        self.host = [[Host alloc] initWithName:[eventHostDetailList_2 objectAtIndex:i] andDetail:nil];
        self.event = [[Event alloc] initWithHost:self.host nameEvent:[eventNameList_2 objectAtIndex:i]andAmoutOfMember:10];
        
        [eventList_4 addObject:self.event];
    }
    
    NSMutableArray *eventList_5 = [[NSMutableArray alloc] initWithCapacity:10];
    for(int i = 0 ; i<[eventNameList_2 count]; i++){
        
        self.host = [[Host alloc] initWithName:[eventHostDetailList_2 objectAtIndex:i] andDetail:nil];
        self.event = [[Event alloc] initWithHost:self.host nameEvent:[eventNameList_2 objectAtIndex:i]andAmoutOfMember:10];
        
        [eventList_5 addObject:self.event];
    }
    
    
    
    for(int i = 0; i < dateSectionTitles.count; i++){
        if(i == 1){
            self.sectionEvent = [[SectionEvent alloc] initWithEventList:eventList_2 andDate:[dateSectionTitles objectAtIndex:i]];
            [self.sectionList addObject:self.sectionEvent];
            continue;
        }
        if(i == 2){
            self.sectionEvent = [[SectionEvent alloc] initWithEventList:eventList_3 andDate:[dateSectionTitles objectAtIndex:i]];
            [self.sectionList addObject:self.sectionEvent];
            continue;
        }
        if(i == 3){
            self.sectionEvent = [[SectionEvent alloc] initWithEventList:eventList_3 andDate:[dateSectionTitles objectAtIndex:i]];
            [self.sectionList addObject:self.sectionEvent];
            continue;
        }
        if(i == 4){
            self.sectionEvent = [[SectionEvent alloc] initWithEventList:eventList_4 andDate:[dateSectionTitles objectAtIndex:i]];
            [self.sectionList addObject:self.sectionEvent];
            continue;
        }
        
        self.sectionEvent = [[SectionEvent alloc] initWithEventList:self.eventList andDate:[dateSectionTitles objectAtIndex:i]];
        [self.sectionList addObject:self.sectionEvent];
        
    }
    
    for (Event* x in self.eventList){
        [x checkData];
    }
    
    for (SectionEvent* x in self.sectionList){
        [x checkData];
    }

}

- (void)addCheckPoint:(EventDetailTableViewController *)controller atSection:(SectionEvent *)sectionEvent andAtEvent:(Event *)event{
    
    NSInteger secCount = 0;
    NSInteger evCount = 0;
    
//    for (int i = 0; i < self.sectionList.count; i++) {
//        SectionEvent *secEv = [self.sectionList objectAtIndex:i];
//        if ([secEv.date isEqualToString:sectionEvent.date]) {
//            dateSection = secEv.date;
//            NSLog(@"date? %@",secEv.date);
//            [self.sectionList replaceObjectAtIndex:i withObject:sectionEvent];
//            evCount+=1;
//        }
//        secCount+=1;
//    }
    NSLog(@"In section %ld in eventAT %ld",(long)secCount, (long)evCount);

    [self.tableView reloadData];
}

- (void)addNotInterested:(EventDetailTableViewController *)controller didFinishPressedButtonNotInterest:(Boolean)interested
{

}

- (void)viewWillAppear:(BOOL)animated
{
//    NSIndexPath *tableSelection = [self.eventListTableView indexPathForSelectedRow];
//    [self.eventListTableView deselectRowAtIndexPath:tableSelection animated:NO];
//    [self.navigationController setNavigationBarHidden:YES];
    
}
@end

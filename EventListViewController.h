//
//  ListEventViewController.h
//  LParty
//
//  Created by guild on 1/4/2559 BE.
//  Copyright © 2559 guild. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EventDetailTableViewController.h"
#import "SectionEvent.h"
#import "Event.h"
#import "Member.h"
#import "Host.h"

@interface EventListViewController : UITableViewController<UITableViewDelegate,UITableViewDataSource,EventDetailViewControllerDelegate>
{
    NSDictionary *calendar;
    NSArray *dateSectionTitles;
}
@property (nonatomic) NSMutableArray *eventNameList;
@property (nonatomic) NSMutableArray *eventHostDetailList;
@property (nonatomic) NSMutableArray *checkerList;
@property (nonatomic, retain) NSMutableArray *sectionList;
@property (nonatomic, retain) NSMutableArray *eventList;
@property (nonatomic) Boolean checker;

@property (nonatomic) NSInteger rowSelected;
@property (nonatomic) NSInteger sectionSelected;

@property (strong, nonatomic) Event *event;
@property (strong, nonatomic) Event *eventSelected;
@property (strong, nonatomic) Host *host;
@property (strong, nonatomic) Member *member;
@property (strong, nonatomic) SectionEvent *sectionEvent;


@property(weak, nonatomic) IBOutlet UITableView *eventListTableView;

@end

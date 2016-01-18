//
//  ListEventViewController.h
//  LParty
//
//  Created by guild on 1/4/2559 BE.
//  Copyright © 2559 guild. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event.h"

@interface EventListViewController : UITableViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSDictionary *calendar;
    NSArray *dateSectionTitles;
}
@property (nonatomic) NSMutableArray *eventNameList;
@property (nonatomic) NSMutableArray *eventDate;
@property (nonatomic) NSMutableArray *eventLocation;
@property (nonatomic) NSMutableArray *eventHostDetailList;

@property (strong, nonatomic) Event *event;
@property(weak, nonatomic) IBOutlet UITableView *eventListTableView;

@end

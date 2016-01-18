//
//  EventDetailTableViewController.h
//  LParty
//
//  Created by guild on 1/14/2559 BE.
//  Copyright © 2559 guild. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event.h"
@interface EventDetailTableViewController : UITableViewController

@property (strong, nonatomic) Event *event;
@property(weak, nonatomic) IBOutlet UITableView *eventDetailTableView;

@end

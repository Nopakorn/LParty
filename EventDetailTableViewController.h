//
//  EventDetailTableViewController.h
//  LParty
//
//  Created by guild on 1/14/2559 BE.
//  Copyright © 2559 guild. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event.h"

@class EventDetailTableViewController;

@protocol EventDetailViewControllerDelegate <NSObject>

- (void)addCheckPoint:(EventDetailTableViewController *)controller didFinishPressedButton:(Boolean )join;

@end

@interface EventDetailTableViewController : UITableViewController

@property (nonatomic, weak) id <EventDetailViewControllerDelegate> delegate;
@property (strong, nonatomic) Event *event;
@property(weak, nonatomic) IBOutlet UITableView *eventDetailTableView;


- (void)addCheckedMark:(id)sender;

@end

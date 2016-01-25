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

- (void)addCheckPoint:(EventDetailTableViewController *)controller didFinishPressedButton:(Boolean )join andRow:(NSInteger )rowSelected andSection:(NSInteger )sectionSelected;

- (void)addNotInterested:(EventDetailTableViewController *)controller didFinishPressedButtonNotInterest:(Boolean )interested;

@end

@interface EventDetailTableViewController : UITableViewController

@property (nonatomic, weak) id <EventDetailViewControllerDelegate> delegate;
@property (strong, nonatomic) Event *event;
@property (weak, nonatomic) IBOutlet UITableView *eventDetailTableView;
@property (nonatomic) NSInteger rowSelected;
@property (nonatomic) NSInteger sectionSelected;
@property (nonatomic) NSMutableArray *checkerList;


- (void)addCheckedMark:(id)sender;
- (void)addNotInterested:(id)sender;

@end

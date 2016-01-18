//
//  EventListCell.h
//  LParty
//
//  Created by guild on 1/4/2559 BE.
//  Copyright © 2559 guild. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventListCell : UITableViewCell

@property(weak,nonatomic) IBOutlet UILabel* title;
@property(weak,nonatomic) IBOutlet UILabel* detail;

@end

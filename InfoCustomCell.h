//
//  InfoCustomCell.h
//  LParty
//
//  Created by guild on 1/14/2559 BE.
//  Copyright © 2559 guild. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfoCustomCell : UITableViewCell

@property(weak,nonatomic) IBOutlet UILabel *information;
@property(weak,nonatomic) IBOutlet UIButton  *joinButton;
@property(weak,nonatomic) IBOutlet UIButton  *notJoinButton;

@end

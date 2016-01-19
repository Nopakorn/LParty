//
//  InfoCustomCell.m
//  LParty
//
//  Created by guild on 1/14/2559 BE.
//  Copyright © 2559 guild. All rights reserved.
//

#import "InfoCustomCell.h"

@implementation InfoCustomCell

@synthesize information = _information;
@synthesize joinButton = _joinButton;
@synthesize notJoinButton = _notJoinButton;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



@end

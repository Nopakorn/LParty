//
//  DateTimeCustomCell.m
//  LParty
//
//  Created by guild on 1/14/2559 BE.
//  Copyright © 2559 guild. All rights reserved.
//

#import "DateTimeCustomCell.h"

@implementation DateTimeCustomCell

@synthesize date = _date;
@synthesize time = _time;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

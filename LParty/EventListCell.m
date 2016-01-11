//
//  EventListCell.m
//  LParty
//
//  Created by guild on 1/4/2559 BE.
//  Copyright © 2559 guild. All rights reserved.
//

#import "EventListCell.h"

@implementation EventListCell

@synthesize title = _title;
@synthesize detail = _detail;

-(void)layoutSubviews
{
    [super layoutSubviews];
//    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
//    self.imageView.clipsToBounds = YES;
//    self.imageView.frame = CGRectMake(self.imageView.frame.origin.x, self.imageView.frame.origin.y, 100, 50);
}
@end

//
//  ImageViewCustomCell.m
//  LParty
//
//  Created by guild on 1/14/2559 BE.
//  Copyright © 2559 guild. All rights reserved.
//

#import "ImageViewCustomCell.h"

@implementation ImageViewCustomCell

@synthesize title = _title;
@synthesize imageHeader = _imageHeader;


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

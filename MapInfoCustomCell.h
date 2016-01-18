//
//  MapInfoCustomCell.h
//  LParty
//
//  Created by guild on 1/18/2559 BE.
//  Copyright © 2559 guild. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MapInfoCustomCell : UITableViewCell

@property(weak,nonatomic) IBOutlet UILabel* host;
@property(weak,nonatomic) IBOutlet UILabel* locationDetail;
@property(weak,nonatomic) IBOutlet UIImageView *mapIcon;

@end

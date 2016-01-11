//
//  ViewController.h
//  LParty
//
//  Created by guild on 1/4/2559 BE.
//  Copyright © 2559 guild. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event.h"

@interface EventDetailViewController : UIViewController
{
    IBOutlet UIImageView *imageEventView;
}
@property(weak,nonatomic) IBOutlet UILabel* titleEvent;
@property(weak,nonatomic) IBOutlet UILabel* detail;
@property(weak,nonatomic) IBOutlet UILabel* detailHost;


@property (strong, nonatomic) Event *event;

@end


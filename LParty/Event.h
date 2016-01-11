//
//  Event.h
//  LParty
//
//  Created by guild on 1/4/2559 BE.
//  Copyright © 2559 guild. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject

@property(nonatomic, copy) NSString* name;
@property(nonatomic, copy) NSString* idEvent;
@property(nonatomic, copy) NSString* location;
@property(nonatomic, copy) NSString* date;
@property(nonatomic, copy) NSString* infomation;
@property(nonatomic, copy) NSString* hostDetail;

@end

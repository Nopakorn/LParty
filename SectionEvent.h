//
//  SectionEvent.h
//  LParty
//
//  Created by guild on 1/25/2559 BE.
//  Copyright © 2559 guild. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Event.h"

@interface SectionEvent : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *date;
@property (nonatomic) NSMutableArray *eventList;
@property (strong, nonatomic) Event *event;

- (id)initWithEventList:(NSMutableArray *)eventList andDate:(NSString *)date;
- (id)initWithDate:(NSString *)date;
- (void)addEvent:(Event *)event;
- (void)checkData;
- (NSMutableArray *)getEventList;

@end

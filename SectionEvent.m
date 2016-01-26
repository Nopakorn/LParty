//
//  SectionEvent.m
//  LParty
//
//  Created by guild on 1/25/2559 BE.
//  Copyright © 2559 guild. All rights reserved.
//

#import "SectionEvent.h"

@implementation SectionEvent

- (id)initWithEventList:(NSMutableArray *)eventList andDate:(NSString *)date
{
    if(self = [super init]){
        self.eventList = [[NSMutableArray alloc] initWithCapacity:10];
        self.date = date;
        self.eventList = eventList;
        
    }
    
    return self;
}
- (id)initWithDate:(NSString *)date
{
    if(self = [super init]){
        self.eventList = [[NSMutableArray alloc] initWithCapacity:10];
        self.date = date;
    }
        
    return self;
}

- (void)addEvent:(Event *)event
{
    [self.eventList addObject:event];
    
}

- (void)checkData
{
    NSLog(@"Section : %@",self.date);
    //NSLog(@"EventList : %lu",(unsigned long)self.eventList.count);
    Event *checkEvent = [self.eventList objectAtIndex:0];
    NSLog(@"EventList : %lu and %@",(unsigned long)self.eventList.count, checkEvent.name);
}

- (NSMutableArray *)getEventList
{
    return self.eventList;
}

@end

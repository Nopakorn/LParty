//
//  Event.m
//  LParty
//
//  Created by guild on 1/4/2559 BE.
//  Copyright © 2559 guild. All rights reserved.
//

#import "Event.h"

@implementation Event
{
    NSInteger amountOfMember;
}
- (id)initWithHost:(Host *)host nameEvent:(NSString *)name andAmoutOfMember:(NSInteger )memberCount
{
    if(self = [super init]){
        //will change later
        self.checkMark = NO;
        self.host = host;
        self.name = name;
        amountOfMember = memberCount;
        self.onGoing = [NSMutableArray arrayWithCapacity:amountOfMember];
    }
    [self createDataSample];
    return self;
}

- (void)createDataSample
{
    self.location = @"159/8 Soi Sukhumvit 10 , Sukhumvit 55 , Klongtannua , Watthana, Bangkok 10110.";
    self.infomation = @"No mess, hassle-free birthday parties packed with science and fun! Mad Science has a laboratory full of interactive ...";
    self.date = @"14 January 2016";
    self.time = @"21:00 to 24:00";
}

- (void)addMemberOnGoing:(Member *)member
{
    [self.onGoing addObject:member];
}

- (void)addMemberNotGoing:(Member *)member
{
    [self.notGoing addObject:member];
}

- (void)checkData
{
    NSLog(@"name: %@",self.name);
    NSLog(@"host name: %@",self.host.name);
}
@end

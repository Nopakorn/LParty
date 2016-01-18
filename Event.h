//
//  Event.h
//  LParty
//
//  Created by guild on 1/4/2559 BE.
//  Copyright © 2559 guild. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Host.h"
#import "Member.h"
@interface Event : NSObject

@property(nonatomic, copy) NSString* name;
@property(nonatomic, copy) NSString* idEvent;
@property(nonatomic, copy) NSString* location;
@property(nonatomic, copy) NSString* date;
@property(nonatomic, copy) NSString* time;
@property(nonatomic, copy) NSString* infomation;
@property(strong, nonatomic) Host* host;
@property(strong, nonatomic) Member* member;
@property(nonatomic, retain) NSMutableArray* onGoing;
@property(nonatomic, retain) NSMutableArray* notGoing;

- (id)initWithHost:(Host *)host nameEvent:(NSString *)name andAmoutOfMember:(NSInteger )memberCount;
- (void)createDataSample;
- (void)addMemberOnGoing:(Member *)member;
- (void)addMemberNotGoing:(Member *)member;
- (void)checkData;
@end

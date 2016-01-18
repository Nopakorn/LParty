//
//  Member.m
//  LParty
//
//  Created by guild on 1/18/2559 BE.
//  Copyright © 2559 guild. All rights reserved.
//

#import "Member.h"

@implementation Member

- (id)initWithName:(NSString *)name andId:(NSString *)id
{
    if(self = [super init]){
        //will change later
        self.name = name;
        self.id = id;
    }
    return self;
}
@end

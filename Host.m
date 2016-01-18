//
//  Host.m
//  LParty
//
//  Created by guild on 1/18/2559 BE.
//  Copyright © 2559 guild. All rights reserved.
//

#import "Host.h"

@implementation Host

- (id)initWithName:(NSString *)name andDetail:(NSString *)detail{
    if(self = [super init]){
        //will change later
        self.name = name;
        self.detail = detail;
    }
    return self;
}

@end

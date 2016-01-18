//
//  Member.h
//  LParty
//
//  Created by guild on 1/18/2559 BE.
//  Copyright © 2559 guild. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Member : NSObject

@property(nonatomic, copy) NSString* name;
@property(nonatomic, copy) NSString* id;

- (id)initWithName:(NSString *)name andId:(NSString *)id;
@end

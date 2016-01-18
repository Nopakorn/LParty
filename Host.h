//
//  Host.h
//  LParty
//
//  Created by guild on 1/18/2559 BE.
//  Copyright © 2559 guild. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Host : NSObject

@property(nonatomic, copy) NSString* name;
@property(nonatomic, copy) NSString* id;
@property(nonatomic, copy) NSString* detail;

- (id)initWithName:(NSString *)name andDetail:(NSString *)detail;

@end

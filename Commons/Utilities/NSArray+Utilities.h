//
//  NSArray+Utilities.h
//  Mars
//
//  Created by chris on 6/19/14.
//  Copyright (c) 2014 lifang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Utilities)

- (NSString*) join:(NSString*) string;
- (NSArray*) sliceFrom: (NSInteger) start to:(NSInteger) end;

@end

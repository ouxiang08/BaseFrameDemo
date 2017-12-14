//
//  NSArray+Utilities.m
//  Mars
//
//  Created by chris on 6/19/14.
//  Copyright (c) 2014 lifang. All rights reserved.
//

#import "NSArray+Utilities.h"

@implementation NSArray (Utilities)

- (NSString*) join:(NSString*) string{
    return [self componentsJoinedByString:string];
}

- (NSArray*) sliceFrom:(NSInteger)start to:(NSInteger)end{
    // There's an important caveat here: specifying the parameters as
    // NSInteger allows negative indexes, but limits the method's
    // (theoretical) use: the maximum size of an NSArray is NSUIntegerMax,
    // which is quite a bit larger than NSIntegerMax.
    NSUInteger count = [self count];
    
    // Due to this caveat, bail if the array is too big.
    if( count >= NSIntegerMax ) return nil;
    
    // Define default start and stop
    NSInteger defaultStart = 0;
    NSInteger defaultStop = count;
    
    // Set start to default if not specified
    if( start == NSNotFound ){
        start = defaultStart;
    }
    else {
        // If start is negative, change it to the correct positive index.
        if( start < 0 ) start += count;
        // Correct for out-of-bounds index:
        // If it's _still_ negative, set it to 0
        if( start < 0 ) start = 0;
        // If it's past the end, set it to just include the last item
        if( start > count ) start = count;
    }
    
    // Perform all the same calculations on stop
    if( end == NSNotFound ){
        end = defaultStop;
    }
    else {
        if( end < 0 ) end += count;
        if( end < 0 ) end = 0;
        if( end > count ) end = count;
    }
    
    // Calculate slice length with corrected indexes
    NSInteger sliceLength = end - start;
    
    // If no slice, return a new empty array
    if( sliceLength <= 0 ){
        return [NSArray array];
    }
    else {
        return [self subarrayWithRange:(NSRange){start, sliceLength}];
    }
}

@end

//
//  NSDictionary+Utilities.m
//  Mars
//
//  Created by chris on 7/21/14.
//  Copyright (c) 2014 lifang. All rights reserved.
//

#import "NSMutableDictionary+Utilities.h"

@implementation NSMutableDictionary (Utilities)

- (id) valid{
    for(NSString *key in self.allKeys){
        id v = [self valueForKey:key];
        [self setValue:[self check:v] forKeyPath:key];
    }
    return self;
}

- (id) check:(id) obj{
    if(!obj || [NSNull null]==obj){
        return @"";
    }
    else if([obj isKindOfClass:[NSMutableDictionary class]]){
        return [obj valid];
    }
    else if([obj isKindOfClass:[NSMutableArray class]]){
        NSMutableArray *arr = [NSMutableArray arrayWithArray: (NSArray*) obj];
        for(int i=0, n = (int)arr.count; i<n; i++){
            id o = [self check:[arr objectAtIndex:i]];
            [arr replaceObjectAtIndex:i withObject:o];
        }
        return arr;
    }
    return obj;
}

@end

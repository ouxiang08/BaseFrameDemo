//
//  NSData+Utilities.m
//  EasyBaking
//
//  Created by chris on 1/4/15.
//  Copyright (c) 2015 iEasyNote. All rights reserved.
//

#import "NSData+Utilities.h"

@implementation NSData (Utilities)

- (NSString*) base64String{
    NSString *s = @"";
    if([self respondsToSelector:@selector(base64EncodedStringWithOptions:)]){
        s = [self base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    }
    else if([self respondsToSelector:@selector(base64Encoding)]){
        s = [self base64Encoding];
    }
    return s;
}

@end

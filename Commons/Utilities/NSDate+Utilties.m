//
//  NSDate+Utilties.m
//  Mars
//
//  Created by chris on 6/22/14.
//  Copyright (c) 2014 lifang. All rights reserved.
//

#import "NSDate+Utilties.h"

@implementation NSDate (Utilties)

- (NSString *)stringWithFormat:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = format;
    return [formatter stringFromDate:self];
}

- (NSDateComponents *)components {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    return [calendar components:unitFlags fromDate:self];
}

- (NSInteger)year {
    return self.components.year;
}

- (NSInteger)month {
    return self.components.month;
}

- (NSInteger)day {
    return self.components.day;
}

- (NSInteger)hour {
    return self.components.hour;
}

- (NSInteger)minute {
    return self.components.day;
}

- (NSInteger)second {
    return self.components.day;
}

+ (NSDate *)dateFromString:(NSString *)string {
    return [NSDate dateFromString:string withFormat:[NSDate dbFormatString]];
}

+ (NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)format {
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:format];
    NSDate *date = [inputFormatter dateFromString:string];
    inputFormatter=nil;
    return date;
}

+ (NSString *)dbFormatString {
    return [NSDate timestampFormatString];
}

+ (NSString *)timestampFormatString {
    return @"yyyy-MM-dd HH:mm:ss";
}

@end

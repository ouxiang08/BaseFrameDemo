//
//  DataStructuresAndAlgorithms.m
//  com.chuanghe.ios.client
//
//  Created by Jimmy on 2017/11/10.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import "DSAAS.h"

@implementation DSAAS

- (NSArray *)bubbleSort:(NSArray *)array {
    if (array.count) {
        NSMutableArray *sortArray = [[NSMutableArray alloc] initWithArray:array];
        BOOL swapped = NO;
        do {
            swapped = NO;
            for (int i = 1; i < sortArray.count; i++) {
                NSInteger num1 = [[sortArray objectAtIndex:i - 1] integerValue];
                NSInteger num2 = [[sortArray objectAtIndex:i] integerValue];
                if (num1 > num2) {
                    [sortArray replaceObjectAtIndex:i - 1 withObject:[NSNumber numberWithInteger:num2]];
                    [sortArray replaceObjectAtIndex:i withObject:[NSNumber numberWithInteger:num1]];
                    swapped = YES;
                }
            }
        } while (swapped);
        return sortArray;
    }
    else {
        return array;
    }
}

- (NSArray *)bubbleSort1:(NSArray *)array {
    if (array.count) {
        NSMutableArray *sortArray = [[NSMutableArray alloc] initWithArray:array];
        for (int i = 0; i < sortArray.count; i++) {
            for (int j = i+1; j < sortArray.count; j++) {
                NSInteger num1 = [[sortArray objectAtIndex:i] integerValue];
                NSInteger num2 = [[sortArray objectAtIndex:j] integerValue];
                if (num1 > num2) {
                    [sortArray replaceObjectAtIndex:i withObject:[NSNumber numberWithInteger:num2]];
                    [sortArray replaceObjectAtIndex:j withObject:[NSNumber numberWithInteger:num1]];
                }
            }
        }
        return sortArray;
    }
    else {
        return array;
    }
}

- (NSArray *)bubbleSort2:(NSArray *)array {
    if (array.count) {
        NSMutableArray *sortArray = [[NSMutableArray alloc] initWithArray:array];
        for (int i = 0; i < sortArray.count; i++) {
            for (int j = (int)sortArray.count - 2; j >= i; j--) {
                NSInteger num1 = [[sortArray objectAtIndex:j] integerValue];
                NSInteger num2 = [[sortArray objectAtIndex:j+1] integerValue];
                if (num1 > num2) {
                    [sortArray replaceObjectAtIndex:j withObject:[NSNumber numberWithInteger:num2]];
                    [sortArray replaceObjectAtIndex:j+1 withObject:[NSNumber numberWithInteger:num1]];
                }
            }
        }
        return sortArray;
    }
    else {
        return array;
    }
}

@end

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

- (NSArray *)simpleSort:(NSArray *)array {
    if (array.count) {
        NSMutableArray *sortArray = [[NSMutableArray alloc] initWithArray:array];
        for (int i = 0; i < sortArray.count; i++) {
            int min = i;
            for (int j = i+1; j < sortArray.count; j++) {
                NSInteger num1 = [[sortArray objectAtIndex:min] integerValue];
                NSInteger num2 = [[sortArray objectAtIndex:j] integerValue];
                if (num1 > num2) {
                    min = j;
                }
            }
            if (i != min) {
                NSInteger num1 = [[sortArray objectAtIndex:i] integerValue];
                NSInteger num2 = [[sortArray objectAtIndex:min] integerValue];
                [sortArray replaceObjectAtIndex:i withObject:[NSNumber numberWithInteger:num2]];
                [sortArray replaceObjectAtIndex:min withObject:[NSNumber numberWithInteger:num1]];
            }
        }
        return sortArray;
    }
    else {
        return array;
    }
}

- (NSArray *)quickSort:(NSArray *)array {
    NSMutableArray *sortArray = [[NSMutableArray alloc] initWithArray:array];
    [self QSort:sortArray low:0 high:(int)sortArray.count];
    NSLog(@"sortArray：%@",sortArray);
    return sortArray;
}

- (void)QSort:(NSMutableArray *)sortArray low:(int)low high:(int)high {
    int pivot;
    if (low < high) {
        pivot = [self partiton:sortArray low:low high:high];
        [self QSort:sortArray low:low high:pivot - 1];
        [self QSort:sortArray low:pivot + 1 high:high];
    }
}

- (int)partiton:(NSMutableArray *)sortArray low:(int)low high:(int)high {
    int pivotkey;
    pivotkey = [[sortArray objectAtIndex:low] intValue];
    while (low < high) {
        while (low < high &&  [[sortArray objectAtIndex:high] intValue] >= pivotkey) {
            high--;
        }
        [self swap:sortArray low:low high:high];
        
        while (low < high &&  [[sortArray objectAtIndex:low] intValue] <= pivotkey) {
            low++;
        }
        [self swap:sortArray low:low high:high];
    }
    return low;
}

- (void)swap:(NSMutableArray *)sortArray low:(int)low high:(int)high {
    NSInteger num1 = [[sortArray objectAtIndex:low] integerValue];
    NSInteger num2 = [[sortArray objectAtIndex:high] integerValue];
    [sortArray replaceObjectAtIndex:low withObject:[NSNumber numberWithInteger:num2]];
    [sortArray replaceObjectAtIndex:high withObject:[NSNumber numberWithInteger:num1]];
}

@end

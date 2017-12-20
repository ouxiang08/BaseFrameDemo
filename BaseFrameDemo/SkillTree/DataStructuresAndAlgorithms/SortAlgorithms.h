//
//  DataStructuresAndAlgorithms.h
//  com.chuanghe.ios.client
//
//  Created by Jimmy on 2017/11/10.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SortAlgorithms : NSObject

//冒泡排序
- (NSArray *)bubbleSort:(NSArray *)array;

- (NSArray *)bubbleSort1:(NSArray *)array;

- (NSArray *)bubbleSort2:(NSArray *)array;
//简单排序
- (NSArray *)simpleSort:(NSArray *)array;
//快速排序
- (NSArray *)quickSort:(NSArray *)array;

@end

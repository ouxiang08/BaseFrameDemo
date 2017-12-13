//
//  BFTableViewDelegate.h
//  BFlient
//
//  Created by Jimmy on 2017/7/12.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, BFTableViewOperationStyle) {
    BFTableViewStyleDefault,            // 默认
    BFTableViewStyleSingle,             // 单选
    BFTableViewStyleMulti,              // 多选
    BFTableViewStyleDelete,             // 删除
    BFTableViewStyleMovie,              // 移动
    BFTableViewStyleEdit,               // 编辑
};

@interface BFTableViewConfiguration : NSObject

@property (nonatomic, strong) NSMutableArray *data;

@property (nonatomic, strong) NSMutableArray *cells;

@property (nonatomic, strong) NSMutableArray *rowsHeight;

@property (nonatomic, strong) NSMutableArray *headerViewClasses;

@property (nonatomic, strong) NSMutableArray *fooderViewClasses;

@property (nonatomic, strong) NSMutableArray *titlesForHeader;

@property (nonatomic, strong) NSMutableArray *titlesForFooter;

@property (nonatomic, strong) NSMutableArray *heightForHeaders;

@property (nonatomic, strong) NSMutableArray *heightForFooters;

@property (nonatomic, strong) NSMutableArray *heightForRows;

@property (nonatomic, copy) NSString *rowCellIdentifier;

@property (nonatomic) BFTableViewOperationStyle operationStyle;

@property (nonatomic, copy) void (^didSelectRowInTableView)(UITableView *tableView, NSIndexPath *indexPath);

@property (nonatomic, copy) void (^onCustomEventInTableView)(UIView *view, NSString * eventName, id parameter);

@end

@interface BFTableViewDelegate : NSObject <UITableViewDataSource, UITableViewDelegate>

- (instancetype)initWithConfiguration:(BFTableViewConfiguration *)configuration;

@end

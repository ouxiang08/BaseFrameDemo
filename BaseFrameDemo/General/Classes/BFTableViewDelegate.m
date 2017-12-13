//
//  BFTableViewDelegate.m
//  BFlient
//
//  Created by Jimmy on 2017/7/12.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import "BFTableViewDelegate.h"
#import "NSString+Utilities.h"
#import "BFTableViewCell.h"
#import "BFView.h"

static NSString *const kDefaultCellIdentifier = @"kDefaultCellIdentifier";

@implementation BFTableViewConfiguration

@end

@implementation BFTableViewDelegate {
    BFTableViewConfiguration *_configuration;
}

#pragma mark - Init

- (instancetype)initWithConfiguration:(BFTableViewConfiguration *)configuration  {
    self = [super init];
    if (self) {
        _configuration = configuration;
    }
    return self;
}

#pragma mark - TableView Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self numberOfSection:tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView.style == UITableViewStylePlain) {
        return self.data.count;
    }
    else {
        return [self numberOfRow:section];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return [self heightForHeaderWithSection:section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return [self heightForFooterWithSection:section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self heightForRow:indexPath];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self titleforHeaderWithSection:section];
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return [self titleforFooterWithSection:section];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [self viewForHeaderWithSection:section];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [self viewForFooterWithSection:section];
}

- (BFTableViewConfiguration *)configuration {
    return _configuration;
}

- (NSArray *)data {
    return [self configuration].data;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger section = [indexPath section];
    NSInteger row = [indexPath row];
    
    NSArray *cells = [self configuration].cells;
    NSArray *data = [self configuration].data;
    NSString *cellClass = @"BFTableViewCell";
    if (cells && cells.count) {
        if (cells.count == 1 && ![[cells objectAtIndex:0] isKindOfClass:[NSArray class]]) {
            cellClass = [cells objectAtIndex:0];
        }
        else {
            if (data.count && [data[section] isKindOfClass:[BFObject class]]) {
                if ([self isShowMoreOne]) {
                    if (row == 0) {
                        cellClass = [cells objectAtIndex:0];
                    }
                    else {
                        cellClass = [cells objectAtIndex:1];
                    }
                }
                else if (section < cells.count)  {
                    cellClass = [cells objectAtIndex:section];
                }
            }
            else if (data.count && [data[section] isKindOfClass:[NSArray class]]) {
                if ([[cells objectAtIndex:section] isKindOfClass:[NSArray class]]) {
                    NSArray *cellItems = [cells objectAtIndex:section];
                    cellClass = [cellItems objectAtIndex:row];
                }
                else {
                    cellClass = [cells objectAtIndex:section];
                }
            }
        }
        BFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellClass];
        if (!cell) {
            cell = [[NSClassFromString(cellClass) alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellClass];
        }
        if (data.count && [data[section] isKindOfClass:[BFObject class]]) {
            if ([NSString isNullOrEmpty:[self rowCellIdentifier]]) {
                BFObject *object = nil;
                if (tableView.style == UITableViewStyleGrouped) {
                    object = data[section];
                }
                else {
                    object = data[row];
                }
                [cell configWithData:object];
            }
            else {
                //应对Model里面有Array决定NumberOfRow的情况
                BFObject *object = self.data[section];
                NSArray *items = [object valueForKey:[self rowCellIdentifier]];
                if ([self isShowMoreOne]) {
                    if (row == 0) {
                        [cell configWithData:object];
                    }
                    else {
                        [cell configWithData:items[row-1]];
                    }
                }
                else {
                    [cell configWithData:items[row]];
                }
            }
        }
        else if (data.count && [data[section] isKindOfClass:[NSArray class]]) {
            NSArray *item = data[section];
            BFObject *object = item[row];
            [cell configWithData:object];
        }
        __weak typeof(self) weakSelf = self;
        cell.onCustomEventInCell = ^(UIView *view, NSString *eventName, id parameter) {
            [weakSelf handleCustomEventInView:view eventName:eventName parameter:parameter];
        };
        return cell;
    }
    else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kDefaultCellIdentifier];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kDefaultCellIdentifier];
        }
        return cell;
    }
}

- (void)handleCustomEventInView:(UIView *)view eventName:(NSString *)eventName parameter:(id)parameter {
    if ([self configuration].onCustomEventInTableView) {
        [self configuration].onCustomEventInTableView(view, eventName, parameter);
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self configuration].didSelectRowInTableView) {
        [self configuration].didSelectRowInTableView(tableView, indexPath);
    }
}

#pragma mark - Private Methods

- (BOOL)isShowMoreOne {
    if ([NSString isNullOrEmpty:[self configuration].rowCellIdentifier]) {
        return NO;
    }
    else {
        if ([[self configuration].rowCellIdentifier rangeOfString:@"<[1-9]>" options:NSRegularExpressionSearch].location != NSNotFound) {
            return YES;
        }
        else {
            return NO;
        }
    }
}

- (NSUInteger)maxLimintNumber {
    NSUInteger location = [[self configuration].rowCellIdentifier rangeOfString:@"<[1-9]>" options:NSRegularExpressionSearch].location;
    if (location != NSNotFound) {
        unichar lastCharacter = [[self configuration].rowCellIdentifier characterAtIndex:location + 1];
        return [[NSString stringWithFormat: @"%C",lastCharacter] integerValue];
    }
    else {
        return 0;
    }
}

- (NSString *)rowCellIdentifier {
    if (![NSString isNullOrEmpty:[self configuration].rowCellIdentifier]) {
        NSUInteger location = [[self configuration].rowCellIdentifier rangeOfString:@"<[1-9]>" options:NSRegularExpressionSearch].location;
        if (location != NSNotFound) {
            return [[self configuration].rowCellIdentifier substringToIndex:location];
        }
        else {
            return [self configuration].rowCellIdentifier;
        }
    }
    return nil;
}

- (NSInteger)numberOfSection:(UITableView *)tableView  {
    if (self.data && self.data.count) {
        if (tableView.style == UITableViewStylePlain) {
            return 1;
        }
        else {
            return self.data.count;
        }
    }
    return 0;
}

- (NSInteger)numberOfRow:(NSInteger)section {
    if ([self.data[section] isKindOfClass:[NSArray class]]) {
        NSArray *items = self.data[section];
        if (items && items.count) {
            return items.count;
        }
    }
    else if ([self.data[section] isKindOfClass:[BFObject class]]) {
        if ([NSString isNullOrEmpty:[self configuration].rowCellIdentifier]) {
            return 1;
        }
        else {
            //应对Model里面有Array决定NumberOfRow的情况
            BFObject *object = self.data[section];
            NSArray *items = [object valueForKey:[self rowCellIdentifier]];
            if ([self isShowMoreOne]) {
                if (items.count > [self maxLimintNumber] && !object.isExpand) {
                    return [self maxLimintNumber] + 1;
                }
                else {
                    return items.count + 1;
                }
            }
            else {
                return items.count;
            }
        }
    }
    return 0;
}

- (CGFloat)heightForHeaderWithSection:(NSInteger)section {
    NSArray *heightForHeaders = [self configuration].heightForHeaders;
    if (heightForHeaders && heightForHeaders.count && self.data.count) {
        if (heightForHeaders.count == 1) {
            NSNumber *heightForHeader = heightForHeaders[0];
            return [heightForHeader floatValue];
        }
        else if (section < heightForHeaders.count) {
            NSNumber *heightForHeader = heightForHeaders[section];
            return [heightForHeader floatValue];
        }
    }
    return 0;
}

- (CGFloat)heightForFooterWithSection:(NSInteger)section {
    NSArray *heightForFooters = [self configuration].heightForFooters;
    if (heightForFooters && heightForFooters.count && self.data.count) {
        if ([self isShowMoreOne]) {
            BFObject *object = self.data[section];
            NSArray *items = [object valueForKey:[self rowCellIdentifier]];
            if (items.count > [self maxLimintNumber]) {
                if (heightForFooters.count) {
                    NSNumber *heightForHeader = heightForFooters[0];
                    return [heightForHeader floatValue];
                }
            }
        }
        else {
            if (heightForFooters.count == 1) {
                NSNumber *heightForHeader = heightForFooters[0];
                return [heightForHeader floatValue];
            }
            else if (section < heightForFooters.count) {
                NSNumber *heightForHeader = heightForFooters[section];
                return [heightForHeader floatValue];
            }
        }
    }
    return 0.1f;
}

- (CGFloat)heightForRow:(NSIndexPath *)indexPath {
    NSInteger section = [indexPath section];
    NSInteger row = [indexPath row];
    if (self.data && self.data.count) {
        if ([self.data[section] isKindOfClass:[BFObject class]]) {
            if ([NSString isNullOrEmpty:[self configuration].rowCellIdentifier]) {  //没有标志显示更多
                if ([self configuration].rowsHeight && [self configuration].rowsHeight.count) {
                    if ([self configuration].rowsHeight.count == 1) {
                        return [[self configuration].rowsHeight[0] intValue];
                    }
                    else {
                        return [[self configuration].rowsHeight[section] intValue];
                    }
                }
                else {
                    BFObject *object = self.data[section];
                    return [object contentHeight];
                }
            }
            else {  //有标志显示更多
                if ([self configuration].rowsHeight && [self configuration].rowsHeight.count) {
                    if ([[self configuration].rowsHeight[section] isKindOfClass:[NSArray class]]) {
                        NSArray *rowsHeight = [self configuration].rowsHeight[section];
                        return [rowsHeight[row] intValue];
                    }
                    else {
                        return [[self configuration].rowsHeight[section] intValue];
                    }
                }
                else {
                    BFObject *data = self.data[section];
                    NSArray *items = [self.data[section] valueForKey:[self rowCellIdentifier]];
                    BFObject *item = [BFObject new];
                    if ([self isShowMoreOne]) {
                        if (row == 0) {
                            item = data;
                        }
                        else {
                            item = items[row-1];
                        }
                    }
                    else {
                        item = items[row];
                    }
                    return [item contentHeight];
                }
            }
        }
        else if([self.data[section] isKindOfClass:[NSArray class]]) {
            if ([self configuration].rowsHeight && [self configuration].rowsHeight.count) {
                if ([[self configuration].rowsHeight[section] isKindOfClass:[NSArray class]]) {
                    NSArray *rowsHeight = [self configuration].rowsHeight[section];
                    return [rowsHeight[row] intValue];
                }
                else {
                    return [[self configuration].rowsHeight[section] intValue];
                }
            }
            else {
                NSArray *items = self.data[section];
                BFObject *object = items[row];
                return [object contentHeight];
            }
        }
    }
    return 44;

}

- (NSString *)titleforHeaderWithSection:(NSInteger)section {
    NSArray *titlesForHeader = [self configuration].titlesForHeader;
    if (titlesForHeader && titlesForHeader.count) {
        if (titlesForHeader.count == 1) {
            return titlesForHeader[0];
        }
        else if (section < titlesForHeader.count) {
            return titlesForHeader[section];
        }
    }
    return nil;
}

- (NSString *)titleforFooterWithSection:(NSInteger)section {
    NSArray *titlesForFooter = [self configuration].titlesForFooter;
    if (titlesForFooter && titlesForFooter.count) {
        if (titlesForFooter.count == 1) {
            return titlesForFooter[0];
        }
        else if (section < titlesForFooter.count) {
            return titlesForFooter[section];
        }
    }
    return nil;
}

- (UIView *)viewForHeaderWithSection:(NSInteger)section {
    NSArray *headerViewClasses = [self configuration].headerViewClasses;
    if (headerViewClasses && headerViewClasses.count && self.data.count) {
        BFObject *object = self.data[section];
        BFView *headerView = [[BFView alloc] init];
        if (headerViewClasses.count == 1) {
            headerView = [[NSClassFromString(headerViewClasses[0]) alloc] init];
        }
        else if (section < headerViewClasses.count) {
            headerView = [[NSClassFromString(headerViewClasses[section]) alloc] init];
        }
        __weak typeof(self) weakSelf = self;
        headerView.onCustomEventInView = ^(UIView *view, NSString *eventName, id parameter) {
            [weakSelf handleCustomEventInView:view eventName:eventName parameter:parameter];
        };
        [headerView configWithData:object];
        return headerView;
    }
    return nil;
}

- (UIView *)viewForFooterWithSection:(NSInteger)section {
    NSArray *footerViewClasses = [self configuration].fooderViewClasses;
    if (footerViewClasses && footerViewClasses.count && self.data.count) {
        BFObject *object = self.data[section];
        BFView *footerView = [[BFView alloc] init];
        if ([self isShowMoreOne]) {
            NSArray *items = [object valueForKey:[self rowCellIdentifier]];
            if (items.count > [self maxLimintNumber]) {
                if (footerViewClasses.count == 1) {
                    footerView = [[NSClassFromString(footerViewClasses[0]) alloc] init];
                }
                else if (section < footerViewClasses.count) {
                    footerView = [[NSClassFromString(footerViewClasses[section]) alloc] init];
                }
                __weak typeof(self) weakSelf = self;
                footerView.onCustomEventInView = ^(UIView *view, NSString *eventName, id parameter) {
                    [weakSelf handleCustomEventInView:view eventName:eventName parameter:parameter];
                };
                [footerView configWithData:object];
                return footerView;
            }
            else {
                return nil;
            }
        }
        else {
            if (footerViewClasses.count == 1) {
                footerView = [[NSClassFromString(footerViewClasses[0]) alloc] init];
            }
            else if (section < footerViewClasses.count) {
                footerView = [[NSClassFromString(footerViewClasses[section]) alloc] init];
            }
            __weak typeof(self) weakSelf = self;
            footerView.onCustomEventInView = ^(UIView *view, NSString *eventName, id parameter) {
                [weakSelf handleCustomEventInView:view eventName:eventName parameter:parameter];
            };
            [footerView configWithData:object];
            return footerView;
        }
    }
    return nil;
}

@end

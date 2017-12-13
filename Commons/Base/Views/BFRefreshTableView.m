//
//  BFRefreshTableView.m
//  BaseFrameDemo
//
//  Created by Jimmy on 2017/12/13.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import "BFRefreshTableView.h"

@implementation BFRefreshTableView {
    BFRefreshType _refreshType;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _refreshType = BFRefreshTypeBoth;
        [self prepareRefresh];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame refreshType:(BFRefreshType)refreshTpye {
    return [self initWithFrame:frame style:UITableViewStylePlain refreshType:refreshTpye];
}

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle) style refreshType:(BFRefreshType)refreshType {
    self = [super initWithFrame:frame style:style];
    if (self) {
        _refreshType = refreshType;
        [self prepareRefresh];
    }
    return self;
}

- (void)setRefreshType:(BFRefreshType)refreshType {
    if (_refreshType != refreshType) {
        _refreshType = refreshType;
        [self prepareRefresh];
    }
}

- (void)prepareRefresh {
    if((_refreshType & BFRefreshTypeTop) == BFRefreshTypeTop){
        __weak typeof(BFRefreshTableView) *weakSelf = self;
        self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [weakSelf refreshHeader];
        }];
    }
    else if((_refreshType & BFRefreshTypeBottom) == BFRefreshTypeBottom){
        __weak typeof(BFRefreshTableView) *weakSelf = self;
        self.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            [weakSelf refreshFooter];
        }];
    }
    else if((_refreshType & BFRefreshTypeBoth) == BFRefreshTypeBoth){
        __weak typeof(BFRefreshTableView) *weakSelf = self;
        self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [weakSelf refreshHeader];
        }];
        self.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            [weakSelf refreshFooter];
        }];
    }
}

- (void)refreshHeader {
    if (self.refreshDelegate && [self.refreshDelegate respondsToSelector:@selector(beginRefreshHeader:)]) {
        [self.refreshDelegate beginRefreshHeader:self];
    }
}

- (void)refreshFooter {
    if (self.refreshDelegate && [self.refreshDelegate respondsToSelector:@selector(beginRefreshFooter:)]) {
        [self.refreshDelegate beginRefreshFooter:self];
    }
}

@end

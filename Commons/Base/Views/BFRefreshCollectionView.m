//
//  BFRefreshCollectionView.m
//  BaseFrameDemo
//
//  Created by Jimmy on 2017/12/13.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import "BFRefreshCollectionView.h"

@implementation BFRefreshCollectionView {
    BFRefreshType _refreshType;
}

- (id)initWithFrame:(CGRect)frame refreshType:(BFRefreshType)refreshType {
    self = [super initWithFrame:frame];
    if (self) {
        _refreshType = refreshType;
        [self prepareRefresh];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout refreshType:(BFRefreshType)refreshType {
    self = [super initWithFrame:frame collectionViewLayout:layout];
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
        __weak typeof(BFRefreshCollectionView) *weakSelf = self;
        self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [weakSelf refreshHeader];
        }];    }
    if((_refreshType & BFRefreshTypeBottom) == BFRefreshTypeBottom){
        __weak typeof(BFRefreshCollectionView) *weakSelf = self;
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

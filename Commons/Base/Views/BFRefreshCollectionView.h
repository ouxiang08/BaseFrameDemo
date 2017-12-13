//
//  BFRefreshCollectionView.h
//  BaseFrameDemo
//
//  Created by Jimmy on 2017/12/13.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BFRefreshType.h"
#import "MJRefresh.h"

@protocol BFCollectionViewRefreshingDelegate;

@interface BFRefreshCollectionView : UICollectionView

//Refresh Delegate
@property (nonatomic, weak) id<BFCollectionViewRefreshingDelegate> refreshDelegate;

@property (nonatomic, assign) BFRefreshType refreshType;

// Constructors
- (id)initWithFrame:(CGRect)frame refreshType:(BFRefreshType)refreshType;

- (id)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout refreshType:(BFRefreshType)refreshType;

@end


@protocol BFCollectionViewRefreshingDelegate <NSObject>

@optional
- (void)beginRefreshHeader:(BFRefreshCollectionView *)tableView;
- (void)beginRefreshFooter:(BFRefreshCollectionView *)tableView;

@end

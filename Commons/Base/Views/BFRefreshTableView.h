//
//  BFRefreshTableView.h
//  BaseFrameDemo
//
//  Created by Jimmy on 2017/12/13.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BFRefreshType.h"
#import "MJRefresh.h"

@protocol  BFTableViewRefreshingDelegate;

@interface BFRefreshTableView : UITableView

//Refresh Delegate
@property (nonatomic, weak) id<BFTableViewRefreshingDelegate> refreshDelegate;

@property (nonatomic, assign) BFRefreshType refreshType;

// Constructors
- (id)initWithFrame:(CGRect)frame refreshType:(BFRefreshType)refreshTpye;
- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle) style refreshType:(BFRefreshType)refreshType;

- (void)refreshHeader;
- (void)refreshFooter;
@end

@protocol BFTableViewRefreshingDelegate <NSObject>

@optional
- (void)beginRefreshHeader:(BFRefreshTableView *)tableView;
- (void)beginRefreshFooter:(BFRefreshTableView *)tableView;

@end

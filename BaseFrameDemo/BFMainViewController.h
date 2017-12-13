//
//  BFMainViewController.h
//  BaseFrameDemo
//
//  Created by Jimmy on 2017/12/13.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, BFTabIndex) {
    BFTabHome = 0,
    BFTabOrder = 1,
    BFTabStore = 2,
    BFTabShoppingCar = 3,
    BFTabMine = 4,
};

@interface BFMainViewController : UITabBarController

- (void)notifyTabChangeAtIndex:(NSUInteger)tabIndex;

@end

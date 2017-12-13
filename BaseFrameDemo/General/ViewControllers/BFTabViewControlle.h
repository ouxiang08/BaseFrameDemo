//
//  BFTabViewControlle.h
//  BFlient
//
//  Created by Jimmy on 2017/6/29.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BFMainViewController.h"

@interface BFTabViewControlle : UIViewController {
    int _viewType;
}

@property (nonatomic,assign) BFTabIndex tabBarIndex;

@end

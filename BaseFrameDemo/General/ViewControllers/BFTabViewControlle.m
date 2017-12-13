//
//  BFTabViewControlle.m
//  BFlient
//
//  Created by Jimmy on 2017/6/29.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import "BFTabViewControlle.h"
#import "NotificationMacro.h"

@interface BFTabViewControlle ()

@end

@implementation BFTabViewControlle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
//        _tabName = kLFTabName;
        // Custom initialization
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(tabbarChanged:)
                                                     name:kNotificationTabbarChanged object:nil];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleTabChanged:) name:kNotificationTabChanged object:nil];
}

- (void) handleTabChanged:(NSNotification *)notification {
//    if (notification.object != self) {
//        _viewType = 1;
//    }
    [self tabDidChanged:notification];
}

- (void)tabDidChanged:(NSNotification *)notification {
    
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kNotificationTabbarChanged object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kNotificationTabChanged object:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.navigationItem.title = self.title;
    
    // Clear all navigation item properties
    self.navigationItem.titleView = nil;
    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.leftBarButtonItems = nil;
    self.navigationItem.rightBarButtonItem = nil;
    self.navigationItem.rightBarButtonItems = nil;
    
    // init navigation items
    [self initNavigationItems];
    
    //[self initNavigationBarWithStyle:BFNavigationBarStyleWhite];
}

- (void)initNavigationItems {
    // Realization by sub classes
}

- (UINavigationController *)navigationController {
    return self.tabBarController.navigationController;
}

- (UINavigationItem *)navigationItem {
    return self.tabBarController.navigationItem;
}

- (id<UILayoutSupport>)topLayoutGuide {
    return self.parentViewController.topLayoutGuide;
}

- (id<UILayoutSupport>)bottomLayoutGuide {
    return self.parentViewController.bottomLayoutGuide;
}

- (void)setTitle:(NSString *)title {
    [super setTitle:title];
    self.tabBarController.title = title;
}

- (UIBarButtonItem *)returnMenuItem {
    return nil;
}

- (void)tabbarChanged:(id)notification {
//    NSArray * arr = [BFApplication sharedApplication].tabBarItemConfigArr;
//    if (arr.count > self.tabBarController.viewControllers.count) {
//        return;
//    }
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"id==%d", self.tabBarIndex+1];
//    arr = [arr filteredArrayUsingPredicate:predicate];
//    if (arr.count) {
//        LFBottomNavigationConfig * config = arr[0];
//        _tabName = config.name;
//        self.tabBarItem.title = config.name;
//        NSString * path = [[TWLocalSettings sharedSettings] getSettings:config.mouseoutIcon];
//        NSString * selectedPath = [[TWLocalSettings sharedSettings] getSettings:config.mouseonIcon];
//        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
//        NSString * documentPath = paths[0];
//        UIImage * image = [UIImage imageWithContentsOfFile:[documentPath stringByAppendingPathComponent:path]];
//        UIImage * selectedImage = [UIImage imageWithContentsOfFile:[documentPath stringByAppendingPathComponent:selectedPath]];
//        
//        self.tabBarItem.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//        self.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//        [self.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
//                                                 kHRGB(strtoul([config.mouseoutColor UTF8String],0,16)), NSForegroundColorAttributeName,
//                                                 nil] forState:UIControlStateNormal];
//        
//        [self.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
//                                                 kHRGB(strtoul([config.mouseonColor UTF8String],0,16)), NSForegroundColorAttributeName,
//                                                 nil] forState:UIControlStateSelected];
//    }
}

- (BOOL)prefersNavigationBarHidden {
    return NO;
}

- (BOOL)prefersNavigationBarHiddenAnimated {
    return _viewType != 1;
}

- (UITabBarItem *)tabBarItem {
    UITabBarItem *tabBarItem = [super tabBarItem];
    tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -2);
    return tabBarItem;
}

@end

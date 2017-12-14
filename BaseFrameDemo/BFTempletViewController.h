//
//  BFTempletViewController.h
//  BaseFrameDemo
//
//  Created by Jimmy on 2017/12/13.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

#pragma mark - Constans（常类型变量）
// This is an inline comment（内嵌注释）
/* This is a block comment  and it can span multiple lines.（块注释，可用于多行注释）*/

@class BFTableViewCell;

extern NSString *const kRPShortDateFormat;

static NSString *const kCellIdentifier = @"kCellIdentifier";
static const NSTimeInterval BFArticleViewControllerNavigationFadeAnimationDuration = 0.3;

@interface BFTempletViewController : UIViewController {
    //外部需要访问的实例变量声明为属性，不需要外部访问的声明为实例变量。
    //对于NSString、NSArray、NSNumber或BOOL类型，变量的命名一般不需要表明其类型。
    @private
    NSString *_name;
    NSString *city;
    
    @protected
    //如果变量不是以上基本常用类型，则变量的命名就应该反映出自身的类型。但有时仅需要某些类的一个实例的情况下，那么只需要基于类名进行命名。
    UIImage *_previewPaneImage;
    CLLocationManager *_locatiomManager;
    
    @public
    NSArray *_items;
}

#pragma mark - Declare Property（属性声明）

@property (nonatomic, assign) BOOL isNoMoreData;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, strong) NSMutableArray *stores;

@property (nonatomic, strong) NSMutableArray<NSString *> *list;

@property (readonly, nonatomic, strong) NSString *fullName;

@property (nonatomic, strong) UIView *welcomeView;

#pragma mark - Class Methods（类方法）

// Call on a class (e.g. [MyClass someClassMethod]);
+ (id)someClassMethod;

#pragma mark - Instance Methods（实例方法）

// Called on an instance of a class (e.g. [[NSString alloc] init]);
- (void)someClassInstanceMethod;

// Does not return anything or take any arguments
- (void)doWork;

- (void)doWorkWithObject:(NSObject *)object;

// Returns an NSString object for the given NSObject arguments
- (NSString *)stringFromObject:(NSObject *)object andSomeOtherObject:(NSObject *)otherObject;

@end

@protocol ViewControllerDelegate

//实现协议，必须要实现的方法
@required

//实现协议，可选的实现方法
@optional

@end

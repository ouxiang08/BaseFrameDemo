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
@protocol ViewControllerDelegate;

extern NSString *const kRPShortDateFormat;

static NSString *const kCellIdentifier = @"kCellIdentifier";
static const NSTimeInterval BFArticleViewControllerNavigationFadeAnimationDuration = 0.3;

@interface BFTempletViewController : UIViewController {
    //外部需要访问的实例变量声明为属性，不需要外部访问的声明为实例变量。
    //对于NSString、NSArray、NSNumber或BOOL类型，变量的命名一般不需要表明其类型。
    
    //默认情况下，没有标识的实例变量比如上面的 name,默认为 @protected.
    NSString *_name;

    //实例变量仅在声明 它的类中可被访问。
    @private
    NSString *city;
    
    //实例变量在声明它的类中以及继承它的子类中可被访问。如果一个实例变量没有任何显式的声明指令，
    @protected
    //如果变量不是以上基本常用类型，则变量的命名就应该反映出自身的类型。但有时仅需要某些类的一个实例的情况下，那么只需要基于类名进行命名。
    UIImage *_previewPaneImage;
    CLLocationManager *_locatiomManager;
    
    //实例变量随处都可以被访问
    @public
    NSArray *_items;
}

#pragma mark - Declare Property（属性声明）
/*
 *@property = ivar + getter + setter
 *@property等同于在.h文件中声明实例变量的get/set方法
 *它们分为三类，分别是：原子性，存取器控制，内存管理。
 */

/*
 *原子性
 *atomic（默认）：atomic意为操作是原子的，意味着只有一个线程访问实例变量。atomic是线程安全的，至少在当前的存取器上是安全的。
 *它是一个默认的特性，但是很少使用，因为比较影响效率，这跟ARM平台和内部锁机制有关。
 *nonatomic：nonatomic跟atomic刚好相反。表示非原子的，可以被多个线程访问。
 *它的效率比atomic快。但不能保证在多线程环境下的安全性，在单线程和明确只有一个线程访问的情况下广泛使用。
 */

@property () CGFloat contentHeight;

/*
 *存取器控制
 *readwrite（默认）：readwrite是默认值，表示该属性同时拥有setter和getter。
 *readonly： readonly表示只有getter没有setter。
 */

@property (nonatomic, setter = mySetter:,getter = myGetter ) NSString *identifier;

@property (nonatomic,getter = isHidden ) BOOL hidden;

@property (readonly, nonatomic, strong) NSString *backgroundView;

/*
 *内存管理
 *assign（默认）：assign用于值类型，如int、float、double和NSInteger，CGFloat等表示单纯的复制。还包括不存在所有权关系的对象，比如常见的delegate。
 *retian：在setter方法中，需要对传入的对象进行引用计数加1的操作。
 *strong：strong是在IOS引入ARC的时候引入的关键字，是retain的一个可选的替代。表示实例变量对传入的对象要有所有权关系，即强引用。strong跟retain的意思相同并产生相同的代码，但是语意上更好更能体现对象的关系。
 *weak：在setter方法中，需要对传入的对象不进行引用计数加1的操作。
 *copy：与strong类似，但区别在于实例变量是对传入对象的副本拥有所有权，而非对象本身
 */

//下面的代码是相同的

//@property (nonatomic) int running;
@property (nonatomic, assign) int running;

@property (nonatomic, retain) NSMutableDictionary *ignorProperty;

//NSString、NSArray、NSDictionary 等等经常使 copy关键字，是因为他们有对应的可 变类型:NSMutableString、NSMutableArray、NSMutableDictionary;他们之间可能进  赋值操作，为确保对象中的字符 值 会 意间变动，应该在设置新属性值时拷一份。
@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSArray *stores;

@property (nonatomic, copy) void (^q)(int num);

@property (nonatomic, strong) NSMutableArray<NSString *> *list;

@property (readonly, nonatomic, strong) NSString *fullName;

//weak关键字是IOS5引入的，IOS5之前是不能使用该关键字的。delegate 和 Outlet 一般用weak来声明。
//weak 表明 种 持有关系，必须 于 OC 对象;assign 于基本数据类型
@property (nonatomic, weak) id<ViewControllerDelegate> delegate;


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



#pragma mark - Formal Protocols（正式协议）

@protocol ViewControllerDelegate <NSObject>

@property (nonatomic, strong) UIFont *defaultFont;

//如果你没有指定任何关键字，那么默认为 @required.
- (void)showAlterInfo:(NSString *)info;

//实现协议，必须实现的方法
@required
- (void)showToastInfo:(NSString *)info;

//实现协议，可选的实现方法
@optional
- (void)showConfirmInfo:(NSString *)info;

@end

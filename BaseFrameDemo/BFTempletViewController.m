//
//  BFTempletViewController.m
//  BaseFrameDemo
//
//  Created by Jimmy on 2017/12/13.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import "BFTempletViewController.h"

#pragma mark - Enmu（枚举）

// Specifying a typed enum with a name (recommended way)用一个别名来指定一个带有typedef关键字的枚举类型（推荐方法）
typedef NS_ENUM(NSInteger, RNCAdRequestState) {
    RNCAdRequestStateInactive,
    RNCAdRequestStateLoading
};

// Specify a bitmask with a name (recommended way)用一个别名来指定一个bitmask（推荐方法

typedef NS_ENUM(NSUInteger, RPBitM) {
    RPOptionNone = 0,
    RPOptionRight = 1 << 0,
    RPOptionBottom = 1 << 1,
    RPOptionLeft = 1 << 2,
    RPOptionTop = 1 << 3
};

// Untyped with a name 用一个别名来定义一个带有typedef关键字将枚举类型
typedef enum {
    BFRefreshTypeTop = 1 << 0,
    BFRefreshTypeBottom = 1 << 1,
    BFRefreshTypeBoth = 1 << 2,
    BFRefreshTypeNone = 1 << 3,
}BFRefreshType;

@interface BFTempletViewController () <UITableViewDataSource, UITableViewDelegate> {
    //不要将私有的实例变量和方法声明在头文件中，应将私有变量和方法声明在实现文件的类扩展内。
    //指针变量的星号指示符应该紧靠变量，比如NSString *text,而不是NSString* text或NSString * text。
    UITableView *_tableView;
}

@property (nonatomic, strong) UIWebView *adXWebView;

@property (readwrite, nonatomic, strong) NSString *fullName;

@end

@implementation BFTempletViewController

#pragma mark - @synthesize and @dynamic

//当你使用@synthesize指令时，编译器会自动为你创建一个下划线_开头的的实例变量，所以不需要同时声明实例变量和属性。
//不要使用@synthesize除非是编译器需要。注意在@protoco协议中的@optional可选属性必须被显式地使用@synthesize指令合成属性。
@synthesize stores;

@dynamic name;

#pragma mark - Init（初始化方法）

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

#pragma mark - Instance（单例）

//应该使用线程安全的模式穿件共享的单例实例
+ (instancetype)sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

#pragma mark - View Cycle（视图的生命周期）

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.stores = [[NSMutableArray alloc] init];
    
    //对于NSString，NSDictionary，NSArray和NSNumber类，当需要创建这些类的不可变实例时，应该使用这些类的字面值表示形式。
    NSArray *names = @[@"Matt", @"Chris", @"Alex", @"Steve", @"Paul"];
    NSDictionary *productManagers = @{@"iPhone":@"Kate" ,@"iPad":@"Kamal" ,@"Mobile Web":@"Bill"};
    NSNumber *buildingZIPCode = @10018;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Example (样例代码)

/*
 *在32位或者64位的系统环境中，允许的数据类型大小是由为具体的类型分配了多少内存字节决定的。32位系统中长整形(long)分配了4字节，64分配了分配8字节
 *Objective-C继承了所有的C语言基本类型，然后又新增了一些其他的类型。
 */
- (void)ShowDataType {
    
    ///C语言基础
    
    /*
     *整数。
     *整数既可以是signed（有符号）的也可以是unsigned（无符号）的。signed（有符号）代表是正整数或者负整数，unsigned（无符号）代表只能是正整数。
     */

    //Char(1 byte of both 32-bit and 64-bit)
    unsigned char anUnnsignedChar = 255;
    NSLog(@"char size:%zu",sizeof(char));
    
    //Char(2 byte of both 32-bit and 64-bit)
    short aShort = -32678;
    unsigned short anUnsignedShort = 65535;
    NSLog(@"short size: %zu", sizeof(short));
    
    //Char(1 byte of both 32-bit and 64-bit)
    int anInt = -2147483648;
    unsigned int anUnsignedInt = 4294967295;
    NSLog(@"int size: %zu", sizeof(int));

    // Long (4 bytes for 32-bit, 8 bytes for 64-bit)
    long aLong = -9223372036854775808; // 32-bit
    unsigned long auUnsignedLong =  18446744073709551615; // 32-bit
    NSLog(@"long size: %zu", sizeof(long));
    
    /*
     *浮点类型。
     *浮点没有signed（有符号）和unsigned（无符号）。
     */
    // Single precision floating-point (4 bytes for both 32-bit and 64-bit)单精度浮点float aFloat = 72.0345f;
    NSLog(@"float size :%zu",sizeof(float));
    
    // Double precision floating-point (8 bytes for both 32-bit and 64-bit)双精度浮点。
    double aDouble = -72.03245f;
    NSLog(@"double size :%zu",sizeof(double));
    
    // Extended precision floating-point (16 bytes for both 32-bit and 64-bit)扩展精度浮点。
    long double aLongDouble = 72.0345e7L;
    NSLog(@"long double size：%zu",sizeof(long double));
    
    ///Objective-C语言基础
    
    //id：被定义为匿名或者动态对象类型，他可以存储任何对象的引用，不需要指定指针的符号。
    id delegate = _tableView.delegate;
    
    //Class：用来表示对象的类，并能用于对象的内省。
    Class class = [UIView class];
    
    //SEL：用于指定一个selector，它是编译器指定的代码，用于识别方法的名称。
    SEL someSelector = @selector(ShowDataType);
    
    //IMP：用于在方法开始时指向内存地址。
    IMP theImplementation = [self methodForSelector:someSelector];
    
    //BOOL：用来制定一个布尔类型，布尔类型中0值被认为NO(false)，任何非零值被认为YES(true)。
    //BOOL / bool / Boolean / NSCFBoolean
    BOOL isBool = YES;  //Or NO
    
    //nil：用来指定一个空对象指针。当类第一次被初始化时，类中所有的属性被设置为0，这意味着都指向空指针。
    //nil / Nil / NULL / NSNull
    
    ///Objective-C中还有很多其他类型，如NSInteger, NSUInteger, CGRect,CGFloat, CGSize, CGPoint等。
    
}

#pragma mark - Data (数据的处理)

#pragma mark - Event（事件的处理）

#pragma mark - Private Methods（私有方法）

#pragma mark - TableView Delegate Methods（表格视图的代理方法）

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.stores.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellIdentifier];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - Setter (Setter方法)

- (void)setName:(NSString *)name {
    _name = name;
}

#pragma mark - Getter (Getter方法)

- (NSString *)name {
    return _name;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

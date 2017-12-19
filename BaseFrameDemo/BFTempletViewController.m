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
    // Instance variable declarations.
    //不要将私有的实例变量和方法声明在头文件中，应将私有变量和方法声明在实现文件的类扩展内。
    //指针变量的星号指示符应该紧靠变量，比如NSString *text,而不是NSString* text或NSString * text。
    UITableView *_tableView;
}

// Method and property declarations.

@property (nonatomic, strong) UIWebView *adXWebView;

@property (readwrite, nonatomic, strong) NSString *fullName;

@end


#pragma mark - Informal Protocols（非正式正式协议）

/*
 *非正式的协议通常声明为 NSObject 类的类别, 因为这将极大的将方法名与任何继承自NSObject类的类联系起来。
 *因为所有的类都是继承自根类，方法在继承树中的任何地方都没有什么严格限制。
 *一个非正式协议改变了类别声明的规则，列出了一组方法，但没有将它们与任何特定类或者实现联系起来。
 */

@interface NSObject (MyXMLSupport)

- initFromXMLRepresentation:(NSString *)XMLElement;

- (NSString *)XMLRepresentation;

@end

extern NSInteger counterGlobal;
static NSUInteger counterStatic;

@implementation BFTempletViewController

#pragma mark - @synthesize and @dynamic

/*
 *在.m文件中我们使用@synthesize自动生成这两个实例变量的存取器，并且隐藏了存取器，虽然我们看不到存取器，但它们确实是存在的。
 *当你使用@synthesize指令时，编译器会自动为你创建一个下划线_开头的的实例变量，所以不需要同时声明实例变量和属性。
 *不要使用@synthesize除非是编译器需要。注意在@protoco协议中的@optional可选属性必须被显式地使用@synthesize指令合成属性。
 */
@synthesize stores;
//@synthesize stores = _items;


/*
 * 你可以使用 @dynamic 关键字来告诉编译器，属性的获取与赋值方法由用户自己实现, 不自动生成，不在这个类中，可能在父类或者别的地方。
 * 只有在你确信运行时这些访问器方法将可用时才使用这个关键字。
 */
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
    
    [names enumerateObjectsUsingBlock:^(NSString *nameOfPerson, NSUInteger idx, BOOL *stop) {
            NSLog(@"Person's name is: %@", nameOfPerson);
    }];
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
    
    //Protocol *myXMLSupportProtocol = @protocol();
    
}

/*
 *闭包是一个函数（或指向函数的指针），再加上该函数执行的外部的上下文变量（有时候也称作自由变量）。
 */
//- (void)useBlock {
//
//    /*
//     *Block定义
//     *同函数一样，有类型化参数列表
//     *有返回结果或者要申明返回类型
//     *能获取同一作用域（定义块的相同作用域）内的状态
//     *可以修改同一作用域的状态（变量）
//     *与同一范围内的其他块同享变量
//     *在作用域释放后能继续共享和改变同一范围内的变量
//     **/
//    
//    //Block声明。块支持可变参数（…）。如果块没有参数，则必需使用void来代替整个参数列表。
//    void (^blockReturningVoidWithVoidArgument)(void);
//    int (^blockReturningIntWintIntAntCharArgument)(int,char);
//    
//    typedef float (^myBlockType)(float,float);
//    //myBlockType myFirstBlock = ^(float,float){};
//    //myBlockType mySecondBlock = ^(float,float){};
//
//    //Block创建。块以^开始，以;结束
//    int (^oneFrom)(int);
//    oneFrom = ^(int anInt) {
//        return anInt - 1;
//    };
//    
//    /*
//     *Block和变量
//     变量类型
//     1.全局变量，包括静态变量。
//     2.全局函数。
//     3.本地变量及参数（在块范围内）。
//     4.在函数级别，是__block变量。它们在块范围内是可变的，如果所引用的块被复制到堆后，它们也是被保护的。
//     5.const imports。
//     使用规则
//     1.可访问在同一范围内的全局变量包括静态变量。
//     2.可以访问传递给块的参数（如同函数参数）。
//     3.同一范围的栈（非static）变量视作const变量。它们的值类似块表达式。嵌套块时，从最近的作用域取值。
//     4.在同一范围内声明的变量，如果有__block修饰符修饰，则值是可变的。在该范围内包括同一范围内的其他块对该变量的改变，都将影响该作用域。具体见“__block 存储类型”。
//     5.在块的范围内（块体）声明的本地变量，类似于函数中的本地变量。块的每次调用都会导致重新拷贝这些变量。这些变量可作为const或参考（by-reference）变量。
//     **/
//    
//    //本地非静态变量的使用
//    int x = 123;
//    void (^printXAndY)(int) = ^(int y) {
//        printf("%d %d/n",x,y);
//    };
//    printXAndY(456);
//    
//    //注意，试图向x进行赋值将导致错误：
////    int x = 123;
////    void (^printXAndY1)(int) = ^(int y) {
////        x = x + y; // error
////        printf("%d %d/n", x, y);
////    };
//    
//    //要想在块内改变x的值，需要使用__block修饰
//    //__block变量在变量声明的作用域、所有同一作用域内的块，以及块拷贝之间同享存储。
//    //作为一种优化，块存储使用栈存储，就如同块自身一样。
//    //__block变量有两个限制：不能是可变长度的数组，也不能是包含C99可变长度数组的结构体。
//    __block int a = 123;//  x lives in block storage
//    void (^printXAndY2)(int) = ^(int b) {
//        a = a + b;
//        printf("%d %d/n",a,b);
//    };
//    printXAndY2(456); // prints: 579 456
//    
//    //在块中使用多种类型的变量
//    
//    NSInteger localCounter = 42;
//    __block char localCharacter;
//    void (^aBlock)(void) = ^(void){
//        ++counterGlobal;
//        ++counterStatic;
//        
//        counterGlobal = localCounter;   // localCounter fixed at block creation
//        localCharacter = 'a';           // sets localCharacter in enclosing scope
//    };
//    ++localCounter;                     // unseen by the block
//    localCharacter = 'b';
//    aBlock();                           // execute the block
//    // localCharacter now 'a'
//    
//    
//    /*块提供了对O-C和C++对象的支持
//    *在引用计数的情况下，当你在块中引用一个O-C对象，对象会被retained。甚至只是简单引用这个对象的实例变量，也是一样的。
//     *如果在方法体中使用块，对象实例变量的内存管理规则 比较微妙：
//     ▪ 如果通过对象引用方式访问实例变量，self 被 retained；
//     ▪ 如果通过值引用方式访问实例变量，变量是retained;
//    */
//    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        // instanceVariable is used by reference, self is retained
//        doSomethingWithString(localCharacter);
//    });
//    
//    id localVariable = @"123";
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        // localVariable is used by value, localVariable is retained (not self)
//        doSomethingWithString(localCharacter);
//    });
//    
//    /*
//     *使用Block
//     */
//    
//    //如果把块申明为变量，可以把它当成函数使用
//    float (^distanceTraveled) (float, float, float) =
//    ^(float startingSpeed, float acceleration, float time) {
//        float distance = (startingSpeed * time) + (0.5 * acceleration * time * time);
//        return distance;
//    };
//    float howFar = distanceTraveled(0.0, 9.8, 1.0);
//    // howFar = 4.9
//    
//    //但时常会将块以参数形式传递给一个函数或方法，这样，就会使用行内（inline）块。
//    char *myCharacters[3] = { "TomJohn", "George", "Charles Condomine" };
//    qsort_b(myCharacters, 3, sizeof(char *), ^(const void *l, const void *r) {
//        char *left = *(char **)l;
//        char *right = *(char **)r;
//        return strncmp(left, right, 1);
//    });
//    // Block implementation ends at "}"
//    // myCharacters is now { "Charles Condomine", "George", TomJohn" }
//    
//    //接下来的例子显示如何在dispath_apply函数中使用块。
//    size_t count = 10;
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_apply(count, queue, ^(size_t i) {
//        printf("%u/n", i);
//    });
//    
//    //把块作为参数使用
//    NSArray *array = [NSArray arrayWithObjects: @"A", @"B", @"C", @"A", @"B", @"Z",@"G", @"are", @"Q", nil];
//    NSSet *filterSet = [NSSet setWithObjects: @"A", @"Z", @"Q", nil];
//    BOOL (^test)(id obj, NSUInteger idx, BOOL *stop);
//    test = ^(id obj, NSUInteger idx, BOOL *stop){
//        if (idx > 5) {
//            if ([filterSet containsObject:obj]) {
//                return YES;
//            }
//        }
//        return NO;
//    };
//    NSIndexSet *indexes = [array indexesOfObjectsPassingTest:test];
//    NSLog(@"indexes:%@",indexes);
//    
//    /*
//     *块复制
//     *一般，你不需要复制块。只有当你希望在这个块申明的范围外使用它时需要复制它。复制将导致块移动到堆中。
//     可以使用C函数释放和复制块。
//     Block_copy();
//     Block_release();
//     对于O-C，则可向块发送copy，retain和release（以及autorelease）消息。
//     为避免内存泄露，一个Block_copy()总是对应一个Block_release()。每个copy/retain总是有对应的release（或autorelease）——使用垃圾回收则例外。
//     */
//    
//    //调试
//    //可以在块内设置断点，并进行单步调试。在GDB会话中，使用invoke-block调用块，比如：
//    //可以在块内设置断点，并进行单步调试。在GDB会话中，使用invoke-block调用块，比如：
//    //$ invoke-block myBlock 10 20
//    //如果需要传递C字符串，必需用双引号把它引住。例如，向doSomethignWithString块传递一个字符串：
//    //$ invoke-block doSomethingWithString "/"this string/"
//}

void dontDoThis() {
    void (^blockArray[3])(void);// array of 3 block   references
    for (int i = 0; i < 3; ++i) {
        blockArray[i] = ^{ printf("hello, %d/n", i); };
        // WRONG: The block literal scope is the "for" loop
    }
}

void doSomethingWithString (char c) {
    
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

//assign
- (void)setRunning:(int)running {
    _running = running;
}

//retain
- (void)setIgnorProperty:(NSMutableDictionary *)ignorProperty {
    //首先判断是否与旧对象一致，如果不一致进行赋值。
    //因为如果是一个对象的话，进行if内的代码会造成一个极端的情况：当此name的retain为1时，使此次的set操作让实例name提前释放，而达不到赋值目的。
//    if (ignorProperty != _ignorProperty) {
//        [ignorProperty release];
//        ignorProperty = [_ignorProperty retain];
//    }
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

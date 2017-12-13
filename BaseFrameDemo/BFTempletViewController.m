//
//  BFTempletViewController.m
//  BaseFrameDemo
//
//  Created by Jimmy on 2017/12/13.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import "BFTempletViewController.h"

#pragma mark - Enmu（枚举）

typedef NS_ENUM(NSInteger, RNCAdRequestState) {
    RNCAdRequestStateInactive,
    RNCAdRequestStateLoading
};


@interface BFTempletViewController () <UITableViewDataSource, UITableViewDelegate> {
    //不要将私有的实例变量和方法声明在头文件中，应将私有变量和方法声明在实现文件的类扩展内。
    //指针变量的星号指示符应该紧靠变量，比如NSString *text,而不是NSString* text或NSString * text。
    UITableView *_tableView;
}

@property (nonatomic, strong) UIWebView *adXWebView;

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

- (void)ShowDataType {
    NSLog(@"float size: %zu", sizeof(float));

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

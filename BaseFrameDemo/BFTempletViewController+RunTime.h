//
//  BFTempletViewController+RunTime.h
//  BaseFrameDemo
//
//  Created by Jimmy on 2017/12/14.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import "BFTempletViewController.h"

/*
 *类别
 *1.声明非正式协议；
 2.为相关的方法分类，似于有多个类
 3.将大型类的实现分解成多个类别，这有助于增量编译
 4.很容易为不同的应用程序配置不同的类
 */

//类别的命名格式为：ClassYouAreExtending + DescriptorForWhatYouAreAdding
@interface BFTempletViewController (RunTime)

@property (nonatomic, strong) UIImage *image;

@property (nonatomic, strong) UIView *myCustomView;

@end

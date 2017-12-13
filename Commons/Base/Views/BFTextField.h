//
//  BFTextField.h
//  BaseFrameDemo
//
//  Created by Jimmy on 2017/12/13.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, BFTextFieldPlaceholderAlignment) {
    BFTextFieldPlaceholderAlignmentLeft,
    BFTextFieldPlaceholderAlignmentCenter,
    BFTextFieldPlaceholderAlignmentRight,
};

@interface BFTextField : UITextField

@property (nonatomic, strong) UIColor *placeholderColor;

@property (nonatomic, assign) BFTextFieldPlaceholderAlignment placeholderAlilgnment;

@end

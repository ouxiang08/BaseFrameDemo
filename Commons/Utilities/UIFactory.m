
//
//  UIFactory.m
//  CHClient
//
//  Created by Jimmy on 2017/7/11.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import "UIFactory.h"
#import "UtilsMacro.h"

@implementation UIFactory

#pragma mark - UILabel

UILabel *UILabelMinFactory(NSString *text, UIColor *textColor, UIFont *font) {
    
    return UILabelMaxFactory(text, textColor, kClearColor, font, NSTextAlignmentLeft, NSLineBreakByTruncatingTail);
}

UILabel *UILabelAlignmentFactory(NSString *text, UIColor *textColor, UIFont *font, NSTextAlignment textAlignment) {
    
    return UILabelMaxFactory(text, textColor, kClearColor, font, textAlignment, NSLineBreakByTruncatingTail);
}

UILabel *UILabelstandardFactory(NSString *text, UIColor *textColor, UIColor *backgroundColor, UIFont *font) {
    
    return UILabelMaxFactory(text, textColor, backgroundColor, font, NSTextAlignmentLeft, NSLineBreakByTruncatingTail);
}

UILabel *UILabelMaxFactory(NSString *text, UIColor *textColor, UIColor *backgroundColor, UIFont *font, NSTextAlignment textAlignment, NSLineBreakMode lineBreakMode) {
    
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.textColor = textColor;
    label.backgroundColor = backgroundColor;
    label.font = font;
    label.textAlignment = textAlignment;
    label.lineBreakMode = lineBreakMode;
    return label;
}

UILabel *UILabelBorderFactory(NSString *text, UIColor *textColor, UIFont *font, CGFloat cornerRadius, UIColor *borderColor) {
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.textColor = textColor;
    label.font = font;
    label.layer.cornerRadius = cornerRadius;
    label.layer.borderColor = borderColor.CGColor;
    label.layer.borderWidth = 1.0f;
    label.layer.masksToBounds = YES;
    return label;
}

#pragma mark - UIButton

UIButton *UIButtonTitleFactory(NSString *title, UIColor *titleColor, UIFont *titleFont, id target, SEL action) {
    
    UIButton *button = [[UIButton alloc] init];
    button.titleLabel.font = titleFont;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

UIButton *UIButtonImageFactory(UIImage *image, UIImage *selectedImage, id target, SEL action) {
    
    UIButton *button = [[UIButton alloc] init];
    [button setImage:image forState:UIControlStateNormal];
    [button setImage:selectedImage forState:UIControlStateSelected];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

UIButton *UIButtonMixFactory(NSString *title, UIColor *titleColor, UIFont *titleFont, UIImage *image, UIImage *selectedImage, id target, SEL action) {
    
    UIButton *button = [[UIButton alloc] init];
    button.titleLabel.font = titleFont;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button setImage:image forState:UIControlStateNormal];
    [button setImage:selectedImage forState:UIControlStateSelected];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

UIButton *UIButtonMixBorderFactory(NSString *title, UIColor *titleColor, UIFont *titleFont, UIImage *image, UIImage *selectedImage,CGFloat cornerRadius, UIColor *borderColor, id target, SEL action) {
    UIButton *button = [[UIButton alloc] init];
    button.titleLabel.font = titleFont;
    button.layer.cornerRadius = cornerRadius;
    button.layer.borderColor = borderColor.CGColor;
    button.layer.borderWidth = 1.0f;
    button.layer.masksToBounds = YES;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button setImage:image forState:UIControlStateNormal];
    [button setImage:selectedImage forState:UIControlStateSelected];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

//TWButton *TWButtonMixFactory(NSString *title, UIColor *titleColor, UIFont *titleFont, UIImage *image, UIImage *selectedImage, id target, SEL action) {
//    TWButton *button = [[TWButton alloc] init];
//    button.titleLabel.font = titleFont;
//    [button setTitle:title forState:UIControlStateNormal];
//    [button setTitleColor:titleColor forState:UIControlStateNormal];
//    [button setImage:image forState:UIControlStateNormal];
//    [button setImage:selectedImage forState:UIControlStateSelected];
//    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
//    return button;
//}

UIButton *UIButtonBorderFactory(NSString *title, UIColor *titleColor, UIFont *titleFont, CGFloat cornerRadius, UIColor *borderColor, id target, SEL action) {
    
    UIButton *button = [[UIButton alloc] init];
    button.titleLabel.font = titleFont;
    button.layer.cornerRadius = cornerRadius;
    button.layer.borderColor = borderColor.CGColor;
    button.layer.borderWidth = 1.0f;
    button.layer.masksToBounds = YES;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

#pragma mark - UIImageView

UIImageView *UIImageViewMinFactory(NSString *imageName) {
    
    return UIImageViewMaxFactory(imageName, UIViewContentModeScaleToFill, UIEdgeInsetsZero);
}

UIImageView *UIImageViewStandardFactory(NSString *imageName, UIViewContentMode contentMode) {
    
    return UIImageViewMaxFactory(imageName, contentMode, UIEdgeInsetsZero);
}

UIImageView *UIImageViewMaxFactory(NSString *imageName, UIViewContentMode contentMode, UIEdgeInsets capInsets) {

    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [[UIImage imageNamed:imageName] resizableImageWithCapInsets:capInsets];
    imageView.contentMode = contentMode;
    return imageView;
}

UITextField *UITextFieldFactory(UIFont *font, UIColor *textColor) {

    UITextField *textField = [[UITextField alloc] init];
    return textField;
}

@end

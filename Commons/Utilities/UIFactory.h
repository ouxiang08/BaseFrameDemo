//
//  UIFactory.h
//  CHClient
//
//  Created by Jimmy on 2017/7/11.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIFactory : NSObject

///UILabel
UILabel *UILabelMinFactory(NSString *text, UIColor *textColor, UIFont *font);

UILabel *UILabelAlignmentFactory(NSString *text, UIColor *textColor, UIFont *font, NSTextAlignment textAlignment);

UILabel *UILabelstandardFactory(NSString *text, UIColor *textColor, UIColor *backgroundColor, UIFont *font);

UILabel *UILabelMaxFactory(NSString *text, UIColor *textColor, UIColor *backgroundColor, UIFont *font, NSTextAlignment textAlignment, NSLineBreakMode lineBreakMode);

UILabel *UILabelBorderFactory(NSString *text, UIColor *textColor, UIFont *font, CGFloat cornerRadius, UIColor *borderColor) ;

///UIButton
UIButton *UIButtonTitleFactory(NSString *title, UIColor *titleColor, UIFont *titleFont, id target, SEL action);

UIButton *UIButtonImageFactory(UIImage *image, UIImage *selectedImage, id target, SEL action);

UIButton *UIButtonMixFactory(NSString *title, UIColor *titleColor, UIFont *titleFont, UIImage *image, UIImage *selectedImage, id target, SEL action);

UIButton *UIButtonBorderFactory(NSString *title, UIColor *titleColor, UIFont *titleFont, CGFloat cornerRadius, UIColor *borderColor, id target, SEL action);

UIButton *UIButtonMixBorderFactory(NSString *title, UIColor *titleColor, UIFont *titleFont, UIImage *image, UIImage *selectedImage,CGFloat cornerRadius, UIColor *borderColor, id target, SEL action);

//TWButton *TWButtonMixFactory(NSString *title, UIColor *titleColor, UIFont *titleFont, UIImage *image, UIImage *selectedImage, id target, SEL action);

///UIImageView
UIImageView *UIImageViewMinFactory(NSString *imageName);

UIImageView *UIImageViewStandardFactory(NSString *imageName, UIViewContentMode contentMode);

UIImageView *UIImageViewMaxFactory(NSString *imageName, UIViewContentMode contentMode, UIEdgeInsets capInsets);

@end

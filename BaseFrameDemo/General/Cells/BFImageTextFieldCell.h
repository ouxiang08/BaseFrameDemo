//
//  BFImageTextFieldCell.h
//  com.chuanghe.ios.client
//
//  Created by Jimmy on 2017/8/17.
//  Copyright © 2017年 hogan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+ConvenienceFrame.h"
#import "BFTextField.h"

@protocol BFImageTextFieldCellDelegate;

@interface BFImageTextFieldCell : UITableViewCell <UITextFieldDelegate> {
    BFTextField*_textField;
    NSString *_value;
}

@property (nonatomic, assign) id<BFImageTextFieldCellDelegate> delegate;
@property (nonatomic, strong) NSString *imageName;
@property (nonatomic, strong, readonly) UIImageView *imageView;
@property (nonatomic, strong) NSString *placeholder;
@property (nonatomic, assign) UIKeyboardType keyboardType;
@property (nonatomic, assign) UIReturnKeyType returnKeyType;
@property (nonatomic, assign) BOOL editEnabled;
@property (nonatomic, strong) NSString *value;
@property (nonatomic, strong, readonly) UITextField *textField;
@property (nonatomic, assign) CGFloat rightSpacing;
@property (nonatomic, assign) CGFloat leftSpacing;

@end

@protocol BFImageTextFieldCellDelegate <NSObject>

@optional
- (void)textFieldDidBeginEditing:(UITextField *)textField imageCell:(BFImageTextFieldCell *)imageCell;
- (void)textFieldTextDidChange:(UITextField *)textField imageCell:(BFImageTextFieldCell *)imageCell;
- (void)textFieldDidEndEditing:(UITextField *)textField imageCell:(BFImageTextFieldCell *)imageCell;
- (BOOL)textFieldShouldReturn:(UITextField *)textField imageCell:(BFImageTextFieldCell *)imageCell;
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string imageCell:(BFImageTextFieldCell *)imageCell;
@end

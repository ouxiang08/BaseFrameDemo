//
//  BFTitleTextFieldCell.h
//  com.chuanghe.ios.client
//
//  Created by Jimmy on 2017/8/17.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import "BFTitleCell.h"
#import "BFTextField.h"

@protocol BFTitleTextFieldCellDelegate;

@interface BFTitleTextFieldCell : BFTitleCell <UITextFieldDelegate> {
    BFTextField *_textField;
    NSString *_value;
}

@property (nonatomic, assign) id<BFTitleTextFieldCellDelegate> delegate;
@property (nonatomic, strong) NSString *placeholder;
@property (nonatomic, assign) UIKeyboardType keyboardType;
@property (nonatomic, assign) UIReturnKeyType returnKeyType;
@property (nonatomic, assign) BOOL editEnabled;
@property (nonatomic, strong) NSString *value;
@property (nonatomic, strong, readonly) BFTextField *textField;
@property (nonatomic, assign) CGFloat rightSpacing;
@property (nonatomic, assign) CGFloat leftSpacing;

@end

@protocol BFTitleTextFieldCellDelegate <NSObject>

@optional
- (void)textFieldDidBeginEditing:(UITextField *)textField cell:(BFTitleTextFieldCell *)cell;
- (void)textFieldTextDidChange:(UITextField *)textField cell:(BFTitleTextFieldCell *)cell;
- (void)textFieldDidEndEditing:(UITextField *)textField cell:(BFTitleTextFieldCell *)cell;
- (BOOL)textFieldShouldReturn:(UITextField *)textField cell:(BFTitleTextFieldCell *)cell;
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string cell:(BFTitleTextFieldCell *)cell;
@end

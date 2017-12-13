//
//  BFTitleValueCell.h
//  com.chuanghe.ios.client
//
//  Created by Jimmy on 2017/11/20.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import "BFTitleCell.h"

@interface BFTitleValueCell : BFTitleCell {
    NSString *_value, *_placeholder;
    UILabel *_valueLabel;
}
@property (nonatomic, strong) NSString *placeholder;
@property (nonatomic, strong) NSString *value;
@property (nonatomic, strong, readonly) UILabel *valueLabel;

@property (nonatomic, assign) CGFloat rightSpacing;
@property (nonatomic, assign) CGFloat leftSpacing;

@end

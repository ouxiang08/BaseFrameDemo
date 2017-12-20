//
//  BFTitleCell.h
//  com.chuanghe.ios.client
//
//  Created by Jimmy on 2017/8/17.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BFTitleCell : UITableViewCell {
    UIView *_contentView;
    UILabel *_titleLabel;
}

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong, readonly) UILabel *titleLabel;
@end

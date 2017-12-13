//
//  BFTableViewCell.m
//  BaseFrameDemo
//
//  Created by Jimmy on 2017/12/13.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import "BFTableViewCell.h"

@implementation BFTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

//- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
//    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
//        [self initView];
//    }
//    return self;
//}
//
//- (void)initView {
//    self.backgroundColor = [UIColor whiteColor];
//    self.selectionStyle = UITableViewCellSelectionStyleNone;
//}

- (void)configWithData:(BFObject *)data {
    
}

@end

//
//  BFTableViewCell.h
//  BaseFrameDemo
//
//  Created by Jimmy on 2017/12/13.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BFObject.h"

@interface BFTableViewCell : UITableViewCell

@property (nonatomic, copy) void (^onCustomEventInCell)(UIView *view,NSString *eventName, id parameter);

- (void)configWithData:(BFObject *)data;

@end

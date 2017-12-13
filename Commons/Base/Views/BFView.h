//
//  BFView.h
//  BaseFrameDemo
//
//  Created by Jimmy on 2017/12/13.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BFObject.h"

@interface BFView : UIView

@property (nonatomic, copy) void (^onCustomEventInView)(UIView *view,NSString *eventName, id parameter);

- (void)configWithData:(BFObject *)data;


@end

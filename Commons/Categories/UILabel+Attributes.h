//
//  UILabel+Attributes.h
//  EasyBaking
//
//  Created by chris on 9/15/14.
//  Copyright (c) 2014 iEasyNote. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Attributes)

-(void) setPartString:(NSString *) str  attributes:(NSDictionary *) attrs;
-(void) addPrefixString:(NSString *) str  attributes:(NSDictionary *) attrs;
-(void) addSuffixString:(NSString *) str  attributes:(NSDictionary *) attrs;

@end

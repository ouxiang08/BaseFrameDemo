//
//  UILabel+Attributes.m
//  EasyBaking
//
//  Created by chris on 9/15/14.
//  Copyright (c) 2014 iEasyNote. All rights reserved.
//

#import "UILabel+Attributes.h"
#import "NSString+Utilities.h"

@implementation UILabel (Attributes)

-(void) setPartString:(NSString *) str  attributes:(NSDictionary *) attrs{
    
    //NSRange range = [self.text rangeOfString:str];
    NSMutableAttributedString *attributedString =[[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    if (attributedString == nil) {
        attributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
    }
    
    NSArray* rangeArray = [self.text rangesArrayOfString:str];
    for (NSValue* value in rangeArray) {
        NSRange range = value.rangeValue;
        [attributedString setAttributes:attrs range:range];
    }
    
    self.attributedText = attributedString;
}


-(void) addPrefixString:(NSString *) str  attributes:(NSDictionary *) attrs{
    
    self.text  = [NSString stringWithFormat:@"%@%@",str,self.text];
    [self setPartString:str attributes:attrs];
}

-(void) addSuffixString:(NSString *) str  attributes:(NSDictionary *) attrs{
    
    self.text  = [NSString stringWithFormat:@"%@%@",self.text,str];
    [self setPartString:str attributes:attrs];
}

@end

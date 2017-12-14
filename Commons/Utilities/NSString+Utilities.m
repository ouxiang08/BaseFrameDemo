//
//  NSString+Utilities.m
//  Mars
//
//  Created by chris on 4/29/14.
//  Copyright (c) 2014 lifang. All rights reserved.
//

#define kMaxEmailLength 64

#import "NSString+Utilities.h"
#import <CommonCrypto/CommonDigest.h>
#import "UtilsMacro.h"

@implementation NSString (Utilities)
- (BOOL)contains:(NSString*)string {
    return [self rangeOfString:string].location != NSNotFound;
}

- (BOOL)containsCaseInsensitive:(NSString*)string {
    return [self rangeOfString:string options:NSCaseInsensitiveSearch].location != NSNotFound;
}

- (BOOL)isValidEmail
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    BOOL validEmail = [emailTest evaluateWithObject:self];
    if(validEmail && self.length <= kMaxEmailLength)
        return YES;
    return NO;
}

- (BOOL) isValidUserName{
    //Only contains chinese characters, numbers, letters, _
    if ([self isValidEmail]) {
        return YES;
    }
    NSString *userNameRegex = @"^[\u4e00-\u9fa5a-zA-Z0-9_]+$";
    NSPredicate *userNameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", userNameRegex];
    BOOL validUserName = [userNameTest evaluateWithObject:self];
    if(validUserName){
        return YES;
    }
    return NO;
}

- (NSArray*) splitBy:(NSString *)splitString{
    return [self componentsSeparatedByString: splitString];
//    return [self componentsSeparatedByCharactersInSet:
//            [NSCharacterSet characterSetWithCharactersInString:splitString]
//            ];
}

- (BOOL) isValidMobile{
    return [self isWildMobile];
//            [self isValidMobile2] ||
//            [self isValidCMMobile] ||
//            [self isValidCUMobile] ||
//            [self isValidCTMobile];
}

- (BOOL) isWildMobile{
    NSString * MOBILE = @"^\\d{11}$";
    NSPredicate *regexTestMobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    return [regexTestMobile evaluateWithObject:self];
}

- (BOOL) isValidMobile2{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    NSPredicate *regexTestMobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    return [regexTestMobile evaluateWithObject:self];
}

- (BOOL) isValidCMMobile{
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188,1705
     12         */
    NSString * CM = @"^1((34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)|705)\\d{7}$";
    NSPredicate *regexTestCM = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    return [regexTestCM evaluateWithObject:self];
}

- (BOOL) isValidCUMobile{
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186,1709
     17         */
    NSString * CU = @"^1(((3[0-2]|5[256]|8[56])\\d)|709)\\d{7}$";
    NSPredicate *regexTestCU = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    return [regexTestCU evaluateWithObject:self];
}

- (BOOL) isValidCTMobile{
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189,1700
     22         */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349|700)\\d{7}$";
    NSPredicate *regexTestCT = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    return [regexTestCT evaluateWithObject:self];
}

- (BOOL) isValidPHSMobile{
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    NSPredicate *regexTestPHS = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHS];
    return [regexTestPHS evaluateWithObject:self];
}

- (NSString*)add:(NSString*)string
{
    if(!string || string.length == 0)
        return self;
    return [self stringByAppendingString:string];
}

- (NSDictionary*)firstAndLastName
{
    NSMutableDictionary *dic = [NSMutableDictionary new];
    NSArray *comps = [self componentsSeparatedByString:@" "];
    if(comps.count > 0) dic[@"firstName"] = comps[0];
    if(comps.count > 1) dic[@"lastName"] = comps[1];
    return dic;
}

- (BOOL)containsOnlyLetters
{
    NSCharacterSet *blockedCharacters = [[NSCharacterSet letterCharacterSet] invertedSet];
    return ([self rangeOfCharacterFromSet:blockedCharacters].location == NSNotFound);
}

- (BOOL)containsOnlyNumbers
{
    NSCharacterSet *numbers = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
    return ([self rangeOfCharacterFromSet:numbers].location == NSNotFound);
}

- (BOOL)containsOnlyNumbersAndLetters
{
    NSCharacterSet *blockedCharacters = [[NSCharacterSet alphanumericCharacterSet] invertedSet];
    return ([self rangeOfCharacterFromSet:blockedCharacters].location == NSNotFound);
}

- (NSString*)safeSubstringToIndex:(NSUInteger)index
{
    if(index >= self.length)
        index = self.length - 1;
    return [self substringToIndex:index];
}

- (NSString*)stringByRemovingPrefix:(NSString*)prefix
{
    NSRange range = [self rangeOfString:prefix];
    if(range.location == 0) {
        return [self stringByReplacingCharactersInRange:range withString:@""];
    }
    return self;
}

- (NSString*)stringByRemovingPrefixes:(NSArray*)prefixes
{
    for(NSString *prefix in prefixes) {
        NSRange range = [self rangeOfString:prefix];
        if(range.location == 0) {
            return [self stringByReplacingCharactersInRange:range withString:@""];
        }
    }
    return self;
}

- (BOOL)hasPrefixes:(NSArray*)prefixes
{
    for(NSString *prefix in prefixes) {
        if([self hasPrefix:prefix])
            return YES;
    }
    return NO;
}

- (BOOL) hasSufixes:(NSArray *)sufixes{
    for (NSString *sufix in sufixes) {
        if([self hasSuffix:sufix]){
            return YES;
        }
    }
    return NO;
}

- (BOOL)isEqualToOneOf:(NSArray*)strings
{
    for(NSString *string in strings) {
        if([self isEqualToString:string]) {
            return YES;
        }
    }
    return NO;
}

- (NSString *) md5
{
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, (unsigned int)strlen(cStr), result ); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

- (NSString*)telephoneWithReformat
{
    if ([self contains:@"-"])
    {
        return [self stringByReplacingOccurrencesOfString:@"-" withString:@""];
    }
    
    if ([self contains:@" "])
    {
        return [self stringByReplacingOccurrencesOfString:@" " withString:@""];
    }
    
    if ([self contains:@"("])
    {
        return [self stringByReplacingOccurrencesOfString:@"(" withString:@""];
    }
    
    if ([self contains:@")"])
    {
        return [self stringByReplacingOccurrencesOfString:@")" withString:@""];
    }
    
    return self;
}

- (NSString*) replace:(NSString *)string withString:(NSString *)replace{
    return [self stringByReplacingOccurrencesOfString:string withString:replace];
}

- (NSString*) trim{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

- (NSInteger) getIntegerValue{
    NSString *newString = [[self componentsSeparatedByCharactersInSet:
                            [[NSCharacterSet decimalDigitCharacterSet] invertedSet]]
                           componentsJoinedByString:@""];
    return [newString integerValue];
}

- (int) getIntValue{
    return (int)[self getIntegerValue];
}

- (int) getLength{
    int length = 0;
    char* p = (char*)[self cStringUsingEncoding:NSUnicodeStringEncoding];
    for (int i=0 ; i<[self lengthOfBytesUsingEncoding:NSUnicodeStringEncoding] ;i++) {
        if (*p) {
            p++;
            length++;
        }
        else {
            p++;
        }
        
    }
    return length;
}

- (int) getLength2{
    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSData* da = [self dataUsingEncoding:enc];
    return (int)[da length];
}

- (NSString*) base64:(BOOL)encoding{
    if([NSString isNullOrEmpty:self]){
        return @"";
    }
    if(encoding){
        NSData *plainData = [self dataUsingEncoding:NSUTF8StringEncoding];
        if([plainData respondsToSelector:@selector(base64EncodedStringWithOptions:)]){
            return [plainData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
        }
        else if([plainData respondsToSelector:@selector(base64Encoding)]){
            return [plainData base64Encoding];
        }
    }
    else{
        NSData *decodedData = nil;
        if([[NSData alloc] respondsToSelector:@selector(initWithBase64EncodedString:options:)]){
            decodedData = [[NSData alloc] initWithBase64EncodedString:self options:NSDataBase64DecodingIgnoreUnknownCharacters];
        }
        else if([[NSData alloc] respondsToSelector:@selector(initWithBase64Encoding:)]){
            decodedData = [[NSData alloc] initWithBase64Encoding:self];
        }
        NSString *decodedString = [[NSString alloc] initWithData:decodedData encoding:NSUTF8StringEncoding];
        return decodedString;
    }
    return self;
}

+ (NSString*) safeString:(NSString*)str{
    return [NSString isNullOrEmpty:str]? @"" : str;
}

+ (BOOL) isNullOrEmpty:(NSString*)str{
    return  !str || str==nil || (NSString*)[NSNull null]==str || [str isEqualToString:@""];
}

+ (BOOL) equals:(NSString *)str1 to:(NSString *)str2{
    if([NSString isNullOrEmpty:str1]){
        return [NSString isNullOrEmpty:str2];
    }
    if([NSString isNullOrEmpty:str2]){
        return [NSString isNullOrEmpty:str1];
    }
    return [str1 isEqualToString:str2];
}

char *appendRandom(char *str, char *alphabet, int amount) {
    for (int i = 0; i < amount; i++) {
        int r = arc4random() % strlen(alphabet);
        *str = alphabet[r];
        str++;
    }
    
    return str;
}

+ (NSString*) generateRandomPassword:(int)length{
    
    // Build the password using C strings - for speed
    int capitals = length/4;
    int digits = length/4;
    int symbols = length/4;
    int letters = length-symbols-capitals-digits;
    
    char *cPassword = calloc(length + 1, sizeof(char));
    char *ptr       = cPassword;
    
    cPassword[length - 1] = '\0';
    
    char *lettersAlphabet = "abcdefghijklmnopqrstuvwxyz";
    ptr = appendRandom(ptr, lettersAlphabet, letters);
    
    char *capitalsAlphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    ptr = appendRandom(ptr, capitalsAlphabet, capitals);
    
    char *digitsAlphabet = "0123456789";
    ptr = appendRandom(ptr, digitsAlphabet, digits);
    
    char *symbolsAlphabet = "!@#$%*[];?()";
    ptr = appendRandom(ptr, symbolsAlphabet, symbols);
    
    // Shuffle the string!
    for (int i = 0; i < length; i++) {
        int  r    = arc4random() % length;
        char temp = cPassword[i];
        cPassword[i] = cPassword[r];
        cPassword[r] = temp;
    }
    
    NSString *password = [NSString stringWithCString:cPassword encoding:NSUTF8StringEncoding];
    
    // Clean up
    free(cPassword);
    
    return password;
}

+ (NSString*) generateRandomString:(int)length{
    static NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    return [self generateRandomString:length fromSource:letters];
}

+ (NSString*) generateRandomString:(int)length fromSource:(NSString *)source {
    if ([NSString isNullOrEmpty:source]) {
        return nil;
    }
    NSMutableString *randomString = [NSMutableString stringWithCapacity: length];
    for (int i=0; i<length; i++) {
        [randomString appendFormat: @"%C", [source characterAtIndex: arc4random() % [source length]]];
    }
    return randomString;
}

- (NSComparisonResult)caseSensitiveCompare:(NSString *)aString {
    return [self compare:aString options:NSLiteralSearch];
}

- (int)countWord {
    int strlength = 0;
    char* p = (char*)[self cStringUsingEncoding:NSUnicodeStringEncoding];
    for (int i=0 ; i<[self lengthOfBytesUsingEncoding:NSUnicodeStringEncoding] ;i++) {
        if (*p) {
            p++;
            strlength++;
        }
        else {
            p++;
        }
        
    }
    return strlength;
}

-(CGSize)returnSize:(UIFont *)fnt{
    CGSize size = [self sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:fnt,NSFontAttributeName, nil]];
    return size;
}

-(CGSize)returnSize:(UIFont *)fnt MaxWidth:(CGFloat)maxWidth{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attributes = @{NSFontAttributeName:fnt, NSParagraphStyleAttributeName:paragraphStyle.copy};
    return [self boundingRectWithSize:CGSizeMake(maxWidth, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
}

-(CGSize)returnSize:(UIFont *)fnt MaxWidth:(CGFloat)maxWidth lineSpacing:(CGFloat)lineSpacing{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    paragraphStyle.lineSpacing = lineSpacing;
    NSDictionary *attributes = @{NSFontAttributeName:fnt, NSParagraphStyleAttributeName:paragraphStyle.copy};
    return [self boundingRectWithSize:CGSizeMake(maxWidth, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
}

- (CGFloat)widthForContentWithFontSize:(UIFont*)font;
{
    if (!font) {
        return 0;
    }
    CGSize textBlockMinSize = CGSizeMake(kDeviceWidth-10*2, CGFLOAT_MAX);
    CGSize size;
    if (IOS6) {
        //size = [self sizeWithFont:font constrainedToSize:textBlockMinSize lineBreakMode:NSLineBreakByCharWrapping];
    }else{
        size = [self boundingRectWithSize:textBlockMinSize options:NSStringDrawingUsesLineFragmentOrigin
                               attributes:@{NSFontAttributeName:font} context:nil].size;
    }
    
    return size.width;
}

- (NSString *)confusedMobileNumber{

    if ([self isValidMobile]) {
        return    [self stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
    } else {
        return self;
    }
}

- (BOOL)isPureInteger {
    NSScanner* scan = [NSScanner scannerWithString:self];
    NSInteger val;
    return [scan scanInteger:&val] && [scan isAtEnd];
}

- (BOOL)isPureFloat {
    NSScanner* scan = [NSScanner scannerWithString:self];
    float val;
    return [scan scanFloat:&val] && [scan isAtEnd];
}

- (BOOL)isPureDouble {
    NSScanner* scan = [NSScanner scannerWithString:self];
    double val;
    return [scan scanDouble:&val] && [scan isAtEnd];
}

- (NSArray*)rangesArrayOfString:(NSString*)str {
    NSMutableArray* rangeArray = [[NSMutableArray alloc] init];
    NSMutableString* tmpStr = [[NSMutableString alloc] initWithString:self];
    NSRange range;
    while (((range = [tmpStr rangeOfString:str]).location != NSNotFound)) {
        [rangeArray addObject:[NSValue valueWithRange:range]];
        NSRange newRange = NSMakeRange(0, range.location+range.length);
        [tmpStr deleteCharactersInRange:newRange];
    }
    
    for (int num = 0; num < rangeArray.count-1 && rangeArray.count > 0; ++num) {
        NSValue* value1 = rangeArray[num];
        NSValue* value2 = rangeArray[num+1];
        NSRange range = NSMakeRange(value2.rangeValue.location + value1.rangeValue.location+value1.rangeValue.length, value2.rangeValue.length);
        [rangeArray replaceObjectAtIndex:num+1 withObject:[NSValue valueWithRange:range]];
    }
    
    return rangeArray;
}

- (id)stringToModel:(Class)model {
    NSError * error;
    NSData *data =[self dataUsingEncoding:NSUTF8StringEncoding];
    if (!data) {
        NSLog(@"%@ of stringToModel failed", NSStringFromClass(self.class));
        return nil;
    }
    NSDictionary *dict = (NSDictionary *)[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    if (error || !dict) {
        NSLog(@"%@ of stringToModel error: %@", NSStringFromClass(self.class), error);
        return nil;
    }
    id modelInstance = [[model alloc] initWithDictionary:dict];
    return modelInstance;
}

//+ (NSString*)modelToString:(id)model {
//    NSError *error;
//    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:[model toDictionary] options:0 error:&error];
//    if (!jsonData || error) {
//        NSLog(@"%@ of modelToString failed", NSStringFromClass(self.class));
//        return nil;
//    }
//    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
//    return jsonString;
//}

@end

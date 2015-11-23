//
//  QMVersionUpChecker.m
//  versionUpChecker
//
//  Created by Muto Nobuhito on 2015/11/22.
//  Copyright © 2015年 Muto Nobuhito. All rights reserved.
//

#import "QMVersionUpChecker.h"

@implementation QMVersionUpChecker

- (BOOL)isNeedUpdate:(NSString *)targetVersion :(NSString *)presentVersion {
    
    NSArray *presentVerArray = [self subStringCodeToArray:presentVersion];
    NSArray *targetVerArray = [self subStringCodeToArray:targetVersion];
    
    int countNum;
    if ([presentVerArray count] < [targetVerArray count]) {
        countNum = [targetVerArray count];
    } else if ([presentVerArray count] > [targetVerArray count]) {
        countNum = [presentVerArray count];
    } else {
        countNum = [presentVerArray count];
    }
    int i = 0;
    
    NSUInteger preCodeTmp;
    NSUInteger tarCodeTmp;
    
    do {
        NSUInteger preCode = [self catchCodeArrayException:presentVerArray :i];
        NSUInteger tarCode = [self catchCodeArrayException:targetVerArray :i];
        preCodeTmp = preCode;
        tarCodeTmp = tarCode;
        
        if (tarCode > preCode) {
            return true;
        } else if (tarCode < preCode) {
            return false;
        }
        i ++;
        
    } while (i < countNum && preCodeTmp == tarCodeTmp);
    
    return false;
}

- (BOOL)isNeedUpdate:(NSString *)targetVersion {
    NSString *presentVersion = [self getPresentVersion];
    BOOL result = [self isNeedUpdate:targetVersion :presentVersion];
    return result;
}

- (NSString *)getPresentVersion{
    NSString *presentVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    return presentVersion;
}

- (NSArray *)subStringCodeToArray:(NSString *)code {
    NSRange codeSeparetor = [code rangeOfString:@"."];
    if (codeSeparetor.length != 0){
        NSArray *codeArray = [code componentsSeparatedByString:@"."];
        return codeArray;
    } else {
        //target version code exception
        NSException* targetException = [NSException
                                        exceptionWithName:@"VersionCodeException"
                                        reason:@"Invalid VersionCode"
                                        userInfo:nil];
        @throw targetException;
    }
}

- (int)catchCodeArrayException:(NSArray *)verArray :(int)i {
    int retCode;
    @try {
        retCode = [verArray[i] intValue];
    }
    @catch (NSException *exception) {
        retCode = 0;
    }
    return retCode;
}


@end

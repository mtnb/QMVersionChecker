//
//  QMVersionUpChecker.h
//  versionUpChecker
//
//  Created by Muto Nobuhito on 2015/11/22.
//  Copyright © 2015年 Muto Nobuhito. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QMVersionUpChecker : NSObject

- (BOOL)isNeedUpdate:(NSString *)targetVersion :(NSString *)presentVersion;
- (BOOL)isNeedUpdate:(NSString *)targetVersion;

@end

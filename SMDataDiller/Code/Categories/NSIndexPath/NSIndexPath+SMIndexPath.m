//
//  NSIndexPath+SMIndexPath.m
//  SMDataDiller
//
//  Created by Max Kuznetsov on 16.02.14.
//  Copyright (c) 2014 SM. All rights reserved.
//

#import "NSIndexPath+SMIndexPath.h"

@implementation NSIndexPath (SMIndexPath)

+ (NSIndexPath *)indexPathZero
{
    return [NSIndexPath indexPathForRow:0 inSection:0];
}

@end

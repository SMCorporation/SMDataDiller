//
//  SMBaseDataSource+PrivateAddons.m
//  SMDataDiller
//
//  Created by Max Kuznetsov on 25.03.14.
//  Copyright (c) 2014 SM. All rights reserved.
//

#import "SMBaseDataSource+PrivateAddons.h"

@implementation SMBaseDataSource (PrivateAddons)

+ (UIView *)loadNibForClass:(Class)className
{
    NSString *classString = NSStringFromClass(className);
    if ([[NSBundle mainBundle] pathForResource:classString ofType:@"nib"].length) {
        return (UICollectionViewCell *)[[[NSBundle mainBundle] loadNibNamed:classString owner:nil options:nil] firstObject];
    }
    return nil;
}

@end

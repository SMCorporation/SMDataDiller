//
//  SMBaseDataSource+PrivateAddons.m
//  SMDataDiller
//
//  Created by Max Kuznetsov on 25.03.14.
//  Copyright (c) 2014 SM. All rights reserved.
//

#import "SMBaseDataSource+PrivateAddons.h"
#import "SMCell.h"

@implementation SMBaseDataSource (PrivateAddons)

+ (UIView *)loadNibForClass:(Class)className
{
    NSString *classString = NSStringFromClass(className);
    return [self loadNibForName:classString];
}

+ (UIView *)loadNibForName:(NSString *)nibName
{
    if ([[NSBundle mainBundle] pathForResource:nibName ofType:@"nib"].length) {
        return [[[NSBundle mainBundle] loadNibNamed:nibName owner:nil options:nil] firstObject];
    }
    return nil;
}

- (NSString *)nibForCellClass:(Class)cellClass
{
    NSString *nibName = NSStringFromClass(cellClass);
    if ([cellClass respondsToSelector:@selector(nibName)]) {
        nibName = [cellClass nibName];
    }
    
    if (![[NSBundle mainBundle] pathForResource:nibName ofType:@"nib"].length) {
        nibName = nil;
    }

    return nibName;
}

@end

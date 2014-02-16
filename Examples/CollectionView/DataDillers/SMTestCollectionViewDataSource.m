//
//  SMTestCollectionViewDataSource.m
//  SMDataDiller
//
//  Created by Max Kuznetsov on 16.02.14.
//  Copyright (c) 2014 SM. All rights reserved.
//

#import "SMTestCollectionViewDataSource.h"
#import "SMCollectionViewCell1.h"

@implementation SMTestCollectionViewDataSource

- (void)fillCell:(UICollectionViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    [super fillCell:cell atIndexPath:indexPath];
    
    if (![cell isKindOfClass:[SMCollectionViewCell1 class]]) {
        cell.backgroundColor = [UIColor redColor];
    }
}

- (NSString *)cellReuseIdentifierAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section % 2) {
        return @"SMCollectionViewCell1";
    }
    return [super cellReuseIdentifierAtIndexPath:indexPath];
}

- (Class)classForCellAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section % 2) {
        return [SMCollectionViewCell1 class];
    }
    return [UICollectionViewCell class];
}

@end

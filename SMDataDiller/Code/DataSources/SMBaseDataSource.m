//
//  SMBaseDataSource.m
//  SMDataDiller
//
//  Created by Max Kuznetsov on 13.02.14.
//  Copyright (c) 2014 SM. All rights reserved.
//

#import "SMBaseDataSource.h"
#import "SMBaseDataSource+PrivateAddons.h"
#import "SMCell.h"

#import "UITableViewCell+Size.h"
#import "UICollectionViewCell+Size.h"


@implementation SMBaseDataSource

- (id)init
{
    NSAssert([self class] != [SMBaseDataSource class], @"Must use SMBaseTableViewDataSource or SMBaseCollectionViewDataSource");
    
    self = [super init];
    if (self) {
        self.shouldAutoDeselectCells = YES;
        [self initialConfigure];
    }
    return self;
}

- (void)initialConfigure
{
    // there is place for any initial configurations of your dataSource
}

- (void)reload
{
    if ([self.dataProvider respondsToSelector:@selector(reload)]) {
        [self.dataProvider reload];
    }
 
    // need to implement in subclasses
}


#pragma mark -
#pragma mark Data Managment

- (Class)classForCellAtIndexPath:(NSIndexPath *)indexPath
{
    return Nil;
}

- (NSString *)cellReuseIdentifierAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *prefix = NSStringFromClass(self.class);
    return [NSString stringWithFormat:@"%@%@", prefix, @"CellReuseIdentefier"];
}

- (CGSize)sizeForCellAtIndexPath:(NSIndexPath *)indexPath
{
    Class cellClass = [self classForCellAtIndexPath:indexPath];
    if ([cellClass respondsToSelector:@selector(size)]) {
        return [cellClass size];
    } else {
        if ([cellClass respondsToSelector:@selector(sizeFromXib)]) {
            return [cellClass sizeFromXib];
        }
    }
    return CGSizeZero;
}

- (void)setupCell:(id)cell atIndexPath:(NSIndexPath *)indexPath
{
    //any things to setup cell (called once)
}

- (void)fillCell:(id)cell atIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(fillWithObject:)]) {
        id domainObject = [self.dataProvider itemAtIndexPath:indexPath];
        [cell performSelector:@selector(fillWithObject:) withObject:domainObject];
    }
}

- (void)didSelectedRowAtIndexPath:(NSIndexPath *)indexPath;
{
    id itemObject = [self.dataProvider itemAtIndexPath:indexPath];
    
    if ([self.delegate respondsToSelector:@selector(dataSource:didSelectRowAtIndexPath:withItem:)]) {
        [self.delegate dataSource:self didSelectRowAtIndexPath:indexPath withItem:itemObject];
    }
    
    if ([self.delegate respondsToSelector:@selector(didSelectRowAtIndexPath:withItem:)]) {
        [self.delegate didSelectRowAtIndexPath:indexPath withItem:itemObject];
    }
}

- (void)didDeselectedRowAtIndexPath:(NSIndexPath *)indexPath
{
    id itemObject = [self.dataProvider itemAtIndexPath:indexPath];
    
    if ([self.delegate respondsToSelector:@selector(dataSource:didDeselectRowAtIndexPath:withItem:)]) {
        [self.delegate dataSource:self didDeselectRowAtIndexPath:indexPath withItem:itemObject];
    }
    
    if ([self.delegate respondsToSelector:@selector(didDeselectRowAtIndexPath:withItem:)]) {
        [self.delegate didDeselectRowAtIndexPath:indexPath withItem:itemObject];
    }
}

@end

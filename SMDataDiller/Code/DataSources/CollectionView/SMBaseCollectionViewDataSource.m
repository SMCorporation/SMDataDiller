//
//  SMBaseCollectionViewDataSource.m
//  SMDataDiller
//
//  Created by Max Kuznetsov on 13.02.14.
//  Copyright (c) 2014 SM. All rights reserved.
//

#import "SMBaseCollectionViewDataSource.h"
#import "SMBaseDataProvider.h"

@implementation SMBaseCollectionViewDataSource

- (void)initialConfigure
{
//    [self.collectionView reg]
}


#pragma mark -
#pragma mark Data Managment

- (void)reload
{
    [super reload];
    [self.collectionView reloadData];
}


#pragma mark -
#pragma mark UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.dataProvider numberOfItemsInSection:section];
}

- (NSInteger)numberOfSectionsInCollectionView
{
    return [self.dataProvider numberOfSections];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellReuseIdentefier = [self cellReuseIdentifierAtIndexPath:indexPath];
    UICollectionViewCell *collectionViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:cellReuseIdentefier
                                                                                         forIndexPath:indexPath];
    [self fillCell:collectionViewCell atIndexPath:indexPath];
    return collectionViewCell;
}


#pragma mark -
#pragma mark UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.shouldAutoDeselectCells) {
        [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    }
    [self didSelectedRowAtIndexPath:indexPath];
}


#pragma mark -
#pragma mark Helpers

- (UICollectionViewCell *)loadNibForClass:(Class)className
{
    NSString *classString = NSStringFromClass(className);
    if ([[NSBundle mainBundle] pathForResource:classString ofType:@"nib"].length) {
        return (UICollectionViewCell *)[[[NSBundle mainBundle] loadNibNamed:classString owner:nil options:nil] firstObject];
    }
    return nil;
}


@end

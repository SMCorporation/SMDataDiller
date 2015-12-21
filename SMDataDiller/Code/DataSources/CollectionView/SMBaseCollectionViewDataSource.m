//
//  SMBaseCollectionViewDataSource.m
//  SMDataDiller
//
//  Created by Max Kuznetsov on 13.02.14.
//  Copyright (c) 2014 SM. All rights reserved.
//

#import "SMBaseCollectionViewDataSource.h"
#import "SMBaseDataProvider.h"
#import "NSIndexPath+SMIndexPath.h"
#import "SMBaseDataSource+PrivateAddons.h"


static CGFloat const kDefaultSize = 60;

@implementation SMBaseCollectionViewDataSource

- (id)initWithDataProvider:(SMBaseDataProvider *)dataProvider collectionView:(UICollectionView *)collectionView
{
    self = [super init];
    if (self) {
        self.dataProvider = dataProvider;
        self.collectionView = collectionView;
    }
    return self;
}

- (void)setCollectionView:(UICollectionView *)collectionView
{
    _collectionView = collectionView;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    
    [self registerCells];
}


#pragma mark -
#pragma mark Data Managment

- (void)reload
{
    [super reload];
    [self.collectionView reloadData];
}

- (Class)classForCellAtIndexPath:(NSIndexPath *)indexPath
{
    return [UICollectionViewCell class];
}

- (void)registerCells
{
    NSDictionary *classesOrNibs = [self classesAndNibsForRegistration];
    if (classesOrNibs.count) {
        for (NSString *cellReuseIdentifier in classesOrNibs) {
            NSArray *cellsNibsOrClasses = [classesOrNibs valueForKey:cellReuseIdentifier];
            
            for (id classOrNib in cellsNibsOrClasses) {
                if ([classOrNib isKindOfClass:[NSString class]]) {
                    UINib *cellNib = [UINib nibWithNibName:classOrNib bundle:[NSBundle mainBundle]];
                    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:cellReuseIdentifier];
                } else {
                    [self.collectionView registerClass:classOrNib forCellWithReuseIdentifier:cellReuseIdentifier];
                }
            }
        }
    } else {
        NSIndexPath *indexPathZero = [NSIndexPath indexPathZero];
        [self.collectionView registerClass:[self classForCellAtIndexPath:indexPathZero]
                forCellWithReuseIdentifier:[self cellReuseIdentifierAtIndexPath:indexPathZero]];
    }
}

- (CGSize)sizeForCellAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize size = [super sizeForCellAtIndexPath:indexPath];
    if (CGSizeEqualToSize(size, CGSizeZero)) {
        size = CGSizeMake(kDefaultSize, kDefaultSize);
    }
    return size;
}


#pragma mark -
#pragma mark UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.dataProvider numberOfItemsInSection:section];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [self.dataProvider numberOfSections];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellReuseIdentifier = [self cellReuseIdentifierAtIndexPath:indexPath];
    UICollectionViewCell *collectionViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:cellReuseIdentifier
                                                                                         forIndexPath:indexPath];
    [self fillCell:collectionViewCell atIndexPath:indexPath];
    return collectionViewCell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [self sizeForCellAtIndexPath:indexPath];
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

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self didDeselectedRowAtIndexPath:indexPath];
}


#pragma mark -
#pragma mark Helpers

- (NSDictionary *)classesAndNibsForRegistration
{
    NSDictionary *cellsNibsOrClassesDictionary = [NSMutableDictionary new];
    for (int sectionIndex = 0; sectionIndex < [self.dataProvider numberOfSections]; sectionIndex++) {
        for (int rowIndex = 0; rowIndex < [self.dataProvider numberOfItemsInSection:sectionIndex]; rowIndex++) {
            
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:rowIndex inSection:sectionIndex];
            NSString *cellReuseIdentifier = [self cellReuseIdentifierAtIndexPath:indexPath];
            Class cellClass = [self classForCellAtIndexPath:indexPath];
            NSString *nibName = [self nibForCellClass:cellClass];
                        
            NSMutableSet *cellsSet = [cellsNibsOrClassesDictionary valueForKey:cellReuseIdentifier];
            if (!cellsSet) {
                cellsSet = [NSMutableSet new];
                [cellsNibsOrClassesDictionary setValue:cellsSet forKey:cellReuseIdentifier];
            }
            
            if (nibName.length) {
                [cellsSet addObject:nibName];
            } else {
                [cellsSet addObject:cellClass];
            }
        }
    }
    return cellsNibsOrClassesDictionary;
}

@end

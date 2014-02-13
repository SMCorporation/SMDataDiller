//
//  SMBaseCollectionViewDataSource.h
//  SMDataDiller
//
//  Created by Max Kuznetsov on 13.02.14.
//  Copyright (c) 2014 SM. All rights reserved.
//

#import "SMBaseDataSource.h"

@interface SMBaseCollectionViewDataSource : SMBaseDataSource <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, weak) UICollectionView *collectionView;

@end

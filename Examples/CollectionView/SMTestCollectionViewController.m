//
//  SMTestCollectionViewController.m
//  SMDataDiller
//
//  Created by Max Kuznetsov on 16.02.14.
//  Copyright (c) 2014 SM. All rights reserved.
//

#import "SMTestCollectionViewController.h"
#import "SMDataDiller.h"
#import "SMTestCollectionViewDataSource.h"

@interface SMTestCollectionViewController () <SMDataSourceDelegate>

@property (nonatomic, strong) SMTestCollectionViewDataSource *collectionViewDataSource;

@end

@implementation SMTestCollectionViewController

- (id)init
{
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.sectionInset = UIEdgeInsetsMake(10, 0, 0, 0);
    
    return [super initWithCollectionViewLayout:layout];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setupDataDillers];
}

- (void)setupDataDillers
{
    SMBaseDataProvider *dataProvider = [[SMBaseDataProvider alloc] init];
    [dataProvider setItems:@[@[@"Item 1", @"Item 2", @"Item 3", @"Item 4"],
                             @[@"Item 1 (section 2)", @"Item 2 (section 2)", @"Item 3 (section 2)"],
                             @[@"Item 1 (section 3)", @"Item 2 (section 3)", @"Item 3 (section 3)", @"Item 4 (section 3)"]]];
    
    self.collectionViewDataSource = [[SMTestCollectionViewDataSource alloc] initWithDataProvider:dataProvider collectionView:self.collectionView];
    self.collectionViewDataSource.delegate = self;
    [self.collectionViewDataSource reload];
}

@end

//
//  SMBaseDataSource.h
//  SMDataDiller
//
//  Created by Max Kuznetsov on 13.02.14.
//  Copyright (c) 2014 SM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SMDataSourceDelegate.h"
#import "SMBaseDataProvider.h"


@interface SMBaseDataSource : NSObject

@property (nonatomic, strong) SMBaseDataProvider *dataProvider;
@property (nonatomic, weak) id<SMDataSourceDelegate> delegate;

@property (nonatomic, assign) BOOL shouldAutoDeselectCells;     // "YES" by default

- (void)initialConfigure;
- (void)reload;

- (Class)classForCellAtIndexPath:(NSIndexPath *)indexPath;
- (NSString *)cellReuseIdentifierAtIndexPath:(NSIndexPath *)indexPath;

- (void)fillCell:(id)cell atIndexPath:(NSIndexPath *)indexPath;
- (void)setupCell:(id)cell atIndexPath:(NSIndexPath *)indexPath;
- (void)didSelectedRowAtIndexPath:(NSIndexPath *)indexPath;

- (CGSize)sizeForCellAtIndexPath:(NSIndexPath *)indexPath;

@end

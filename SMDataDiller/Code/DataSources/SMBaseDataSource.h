//
//  SMBaseDataSource.h
//  SMDataDiller
//
//  Created by Max Kuznetsov on 13.02.14.
//  Copyright (c) 2014 SM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SMBaseDataSourceDelegate.h"

@class SMBaseDataProvider;

@interface SMBaseDataSource : NSObject

@property (nonatomic, strong) SMBaseDataProvider *dataProvider;
@property (nonatomic, weak) id<SMBaseDataSourceDelegate> delegate;

@property (nonatomic, assign) BOOL shouldAutoDeselectCells;     // "YES" by default

- (void)initialConfigure;
- (void)reload;

- (NSString *)cellReuseIdentifierAtIndexPath:(NSIndexPath *)indexPath;
- (void)fillCell:(id)cell atIndexPath:(NSIndexPath *)indexPath;
- (void)didSelectedRowAtIndexPath:(NSIndexPath *)indexPath;

@end

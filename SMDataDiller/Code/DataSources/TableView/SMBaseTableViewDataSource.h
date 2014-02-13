//
//  SMBaseDataSource.h
//  Serg And Max
//
//  Created by SM on 01.02.14.
//  Copyright (c) 2014 SP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SMDataDiller.h"

@interface SMBaseTableViewDataSource : NSObject  <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) SMBaseDataProvider *dataProvider;
@property (nonatomic, weak) id<SMBaseDataSourceDelegate> delegate;

@property (nonatomic, assign) BOOL shouldAutoDeselectCells; // "YES" by default

- (id)initWithDataProvider:(SMBaseDataProvider *)dataProvider tableView:(UITableView *)tableView;

- (NSString *)cellReuseIdentifierAtIndexPath:(NSIndexPath *)indexPath;
- (Class)classForCellAtIndexPath:(NSIndexPath *)indexPath;
- (UITableViewCellStyle)cellsStyle;

- (void)fillCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;
- (void)setupCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;
- (void)didSelectedRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)reload;

@end
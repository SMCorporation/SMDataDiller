//
//  SMBaseDataSource.h
//  Serg And Max
//
//  Created by SM on 01.02.14.
//  Copyright (c) 2014 SP. All rights reserved.
//

#import "SMBaseDataSource.h"

@interface SMBaseTableViewDataSource : SMBaseDataSource  <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, assign) UITableViewCellStyle cellsStyle;  // UITableViewCellStyleDefault by default

- (id)initWithDataProvider:(SMBaseDataProvider *)dataProvider tableView:(UITableView *)tableView;

- (Class)classForCellAtIndexPath:(NSIndexPath *)indexPath;
- (void)setupCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;

@end
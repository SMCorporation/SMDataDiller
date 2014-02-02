//
//  SMBaseDataSource.h
//  Serg And Max
//
//  Created by SM on 01.02.14.
//  Copyright (c) 2014 SP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SMBaseDataProvider.h"

@protocol SMDataSourceDelegate <NSObject>

@optional
- (void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath withItem:(id)item;

@end


@interface SMBaseTableViewDataSource : NSObject  <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, weak) SMBaseDataProvider *dataProvider;
@property (nonatomic, weak) id<SMDataSourceDelegate> delegate;

- (NSString *)cellReuseIdentefireAtIndexPath:(NSIndexPath *)indexPath;
- (Class)classForCellAtIndexPath:(NSIndexPath *)indexPath;
- (UITableViewCellStyle)cellsStyle;

- (void)fillCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;
- (void)setupCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;
- (void)didSelectedRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)reload;

@end
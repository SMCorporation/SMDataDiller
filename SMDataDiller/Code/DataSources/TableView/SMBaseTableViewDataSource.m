//
//  SMBaseDataSource.m
//  Serg And Max
//
//  Created by SM on 01.02.14.
//  Copyright (c) 2014 SP. All rights reserved.
//

#import "SMBaseTableViewDataSource.h"
#import "SMCell.h"

@implementation SMBaseTableViewDataSource

- (id)init
{
    self = [super init];
    if (self) {
        self.shouldAutoDeselectCells = YES;
    }
    return self;
}

- (id)initWithDataProvider:(SMBaseDataProvider *)dataProvider tableView:(UITableView *)tableView
{
    self = [self init];
    if (self) {
        self.dataProvider = dataProvider;
        self.tableView = tableView;
    }
    return self;
}

- (void)setTableView:(UITableView *)tableView
{
    _tableView = tableView;
    _tableView.dataSource = self;
    _tableView.delegate = self;
}


#pragma mark -
#pragma mark Data Managment

- (Class)classForCellAtIndexPath:(NSIndexPath *)indexPath
{
    return [UITableViewCell class];
}

- (NSString *)cellReuseIdentifierAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *prefix = NSStringFromClass(self.class);
    return [NSString stringWithFormat:@"%@%@", prefix, @"cellReuseIdentefier"];
}

- (void)fillCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(fillWithObject:)]) {
        id domainObject = [self.dataProvider itemAtIndexPath:indexPath];
        [cell performSelector:@selector(fillWithObject:) withObject:domainObject];
    }
    else {
        NSAssert(nil, @"need to implement in subclasses");
    }
}

- (void)setupCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    //any things to setup cell (called once)
}

- (void)didSelectedRowAtIndexPath:(NSIndexPath *)indexPath;
{
    if ([self.delegate respondsToSelector:@selector(didSelectRowAtIndexPath:withItem:)]) {
        id itemObject = [self.dataProvider itemAtIndexPath:indexPath];
        [self.delegate didSelectRowAtIndexPath:indexPath withItem:itemObject];
    }
}

- (void)reload
{
    [self.tableView reloadData];
}


#pragma mark -
#pragma mark UITableViewDataSource

- (UITableViewCellStyle)cellsStyle
{
    return UITableViewCellStyleDefault;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.dataProvider numberOfSections];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataProvider numberOfItemsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellReuseIdentefier = [self cellReuseIdentifierAtIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseIdentefier];
    if (!cell) {
        Class cellClass = [self classForCellAtIndexPath:indexPath];
        if(!(cell = [self loadNibForClass:cellClass])) {
            cell = [[cellClass alloc] initWithStyle:[self cellsStyle] reuseIdentifier:cellReuseIdentefier];
        }
        [self setupCell:cell atIndexPath:indexPath];
    }
    
    [self fillCell:cell atIndexPath:indexPath];
    return cell;
}


#pragma mark -
#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(self.shouldAutoDeselectCells) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
    [self didSelectedRowAtIndexPath:indexPath];
}


#pragma mark -
#pragma mark Helpers

- (UITableViewCell *)loadNibForClass:(Class)className
{
    NSString *classString = NSStringFromClass(className);
    if ([[NSBundle mainBundle] pathForResource:classString ofType:@"nib"].length) {
        return (UITableViewCell *)[[[NSBundle mainBundle] loadNibNamed:classString owner:nil options:nil] firstObject];
    }
    return nil;
}

@end
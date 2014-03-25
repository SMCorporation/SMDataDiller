//
//  SMSMTestTableDataSource.m
//  SMDataDiller
//
//  Created by Sergey Pirogov on 03.02.14.
//  Copyright (c) 2014 SM. All rights reserved.
//

#import "SMSMTestTableDataSource.h"
#import "SMTestTableViewCell.h"

@implementation SMSMTestTableDataSource

- (CGSize)sizeForCellAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize size = [super sizeForCellAtIndexPath:indexPath];
    CGFloat cellsCount = [self.dataProvider numberOfItemsInSection:indexPath.section];
    size.height = self.tableView.frame.size.height / cellsCount;
    return size;
}

- (Class)classForCellAtIndexPath:(NSIndexPath *)indexPath
{
    return [SMTestTableViewCell class]; //don't implement this method if need default tableViewCell
}

- (void)fillCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    NSString *record = [self.dataProvider itemAtIndexPath:indexPath];
    cell.textLabel.text = record;
}

- (void)setupCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.font = [UIFont boldSystemFontOfSize:25];
}

@end

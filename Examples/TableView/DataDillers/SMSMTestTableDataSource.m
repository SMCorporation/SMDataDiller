//
//  SMSMTestTableDataSource.m
//  SMDataDiller
//
//  Created by Sergey Pirogov on 03.02.14.
//  Copyright (c) 2014 SM. All rights reserved.
//

#import "SMSMTestTableDataSource.h"
#import "SMTestTableViewCell.h"
#import "SMTestTableViewCell2.h"
#import "SMTestTableViewCell3.h"


@implementation SMSMTestTableDataSource

- (Class)classForCellAtIndexPath:(NSIndexPath *)indexPath //don't implement this method if need default tableViewCell
{
    return (indexPath.row % 2) ? [SMTestTableViewCell2 class] : [SMTestTableViewCell3 class];
}

- (NSString *)cellReuseIdentifierAtIndexPath:(NSIndexPath *)indexPath
{
    return (indexPath.row % 2) ? @"smcell3" : @"smcell33333";
}

- (void)fillCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    [super fillCell:cell atIndexPath:indexPath];
    
    NSString *record = [self.dataProvider itemAtIndexPath:indexPath];
    cell.textLabel.text = record;
}

- (void)setupCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    [super setupCell:cell atIndexPath:indexPath];
    
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.font = [UIFont boldSystemFontOfSize:25];
}

@end

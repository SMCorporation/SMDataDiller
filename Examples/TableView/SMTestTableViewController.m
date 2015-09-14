//
//  SMTestTableViewController.m
//  SMDataDiller
//
//  Created by Sergey Pirogov on 03.02.14.
//  Copyright (c) 2014 SM. All rights reserved.
//

#import "SMTestTableViewController.h"

#import "SMSMTestTableDataSource.h"
#import "SMDataDiller.h"

@interface SMTestTableViewController () <SMDataSourceDelegate>

@property (nonatomic, strong) SMSMTestTableDataSource *dataSource;

@end


@implementation SMTestTableViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setupDataDillers];
}

- (void)setupDataDillers
{
    SMBaseDataProvider *dataProvider = [[SMBaseDataProvider alloc] init];
    [dataProvider setItems:@[@"Title1", @"TItle2", @"TItle3", @"TItle4", @"TItle5"]];
    
    self.dataSource = [[SMSMTestTableDataSource alloc] initWithDataProvider:dataProvider tableView:self.tableView];
    self.dataSource.delegate = self;
    [self.dataSource reload];
}


#pragma mark - 
#pragma mark SMDataSourceDelegate

- (void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath withItem:(id)item
{
    NSLog(@"did selected item: %@", item);
}

@end

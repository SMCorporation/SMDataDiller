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

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupDataDillers];
}

- (void)setupDataDillers
{
    SMBaseDataProvider *dataProvider = [[SMBaseDataProvider alloc] init];
    NSUInteger count = 1000;
    NSMutableArray *titles = [NSMutableArray arrayWithCapacity:count];
    
    for (int i = 0; i < count; i++) {
        NSString *title = [NSString stringWithFormat:@"Title%d", i + 1];
        [titles addObject:title];
    }
    
    [dataProvider setItems:titles];
    
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

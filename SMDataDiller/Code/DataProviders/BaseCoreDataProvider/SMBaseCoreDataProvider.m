//
//  SMBaseCoreDataProvider.m
//  SMDataDiller
//
//  Created by Sergey Pirogov on 12.03.14.
//  Copyright (c) 2014 SM. All rights reserved.
//

#import "SMBaseCoreDataProvider.h"
#import "SMFetchedDataProvider.h"
#import "SMSectionObject.h"


@interface SMBaseCoreDataProvider () <SMFetchedDataProviderDelegate>

@property (nonatomic, strong) SMFetchedDataProvider *fetchedDataProvider;
@property (nonatomic, strong) NSManagedObjectContext *managedOjectContext;

@end


@implementation SMBaseCoreDataProvider

- (id)init
{
    NSAssert(NO, @"SMBaseCoreDataProvider: Use \"-initWithManagedObjectContext:\" instead simple \"-init\"");
    return nil;
}

- (id)initWithManagedObjectContext:(NSManagedObjectContext *)managedOjectContext
{
    self = [super init];
    if (self) {
        self.managedOjectContext = managedOjectContext;
        [self configureFetchedProvider];
    }
    return self;
}

- (void)configureFetchedProvider
{
    self.fetchedDataProvider = [[SMFetchedDataProvider alloc] initWithFetchRequest:self.fetchRequest
                                                                           groupBy:self.sectionNameKeyPath
                                                             inManagedOjectContext:self.managedOjectContext
                                                                    usingCacheName:self.cacheName];
    self.fetchedDataProvider.delegate = self;
}


#pragma mark -
#pragma mark Override Getters

- (NSFetchRequest *)fetchRequest
{
    NSAssert(NO, @"SMBaseCoreDataProvider: \"-fetchRequest\" override in subclasses");
    return nil;
}

- (NSString *)sectionNameKeyPath
{
    return nil;
}

- (NSString *)cacheName
{
    return nil;
}


#pragma mark -
#pragma mark Data Provider

- (NSArray *)items
{
    return [self.fetchedDataProvider objects];
}

- (NSUInteger)numberOfSections
{
    return [self.fetchedDataProvider numberOfSections];
}

- (NSUInteger)numberOfItemsInSection:(NSUInteger)section
{
    return [self.fetchedDataProvider numberOfItemsInSection:section];
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.fetchedDataProvider objectAtIndexPath:indexPath];
}

- (id)sectionObjectForSection:(NSUInteger)section
{
    id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedDataProvider sectionInfoForSection:section];
    
    SMSectionObject *sectionObject = [[SMSectionObject alloc] initWithItems:sectionInfo.objects];
    sectionObject.name = sectionInfo.name;
    return sectionObject;
}

- (NSIndexPath *)indexPathOfItem:(id)item
{
    return [self.fetchedDataProvider indexPathForObject:item];
}

- (void)reload
{
    [self.fetchedDataProvider reload];
}

- (void)save
{
    [self.managedOjectContext save:nil];
}


#pragma mark -
#pragma mark - SAFetchedDataProviderDelegate

- (void)fetchedDataProviderWillChangeContent:(SMFetchedDataProvider *)fetchedDataProvider
{
    self.items = [self.fetchedDataProvider objects];
    if([self.delegate respondsToSelector:@selector(dataProvider:didUpdatedContent:)]) {
        [self.delegate dataProvider:self didUpdatedContent:self.items];
    }
}

- (void)fetchedDataProviderDidChangeContent:(SMFetchedDataProvider *)fetchedDataProvider
{
    self.items = [self.fetchedDataProvider objects];
    if([self.delegate respondsToSelector:@selector(dataProvider:didUpdatedContent:)]) {
        [self.delegate dataProvider:self didUpdatedContent:self.items];
    }
}

@end

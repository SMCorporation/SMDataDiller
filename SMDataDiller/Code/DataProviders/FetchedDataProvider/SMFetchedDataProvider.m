//
//  SMFetchedDataProvider.m
//  SMDataDiller
//
//  Created by Sergey Pirogov on 12.03.14.
//  Copyright (c) 2014 SM. All rights reserved.
//

#import "SMFetchedDataProvider.h"

@interface SMFetchedDataProvider () <NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end


@implementation SMFetchedDataProvider

- (id)initWithFetchRequest:(NSFetchRequest *)fetchRequest groupBy:(NSString *)groupBy inManagedOjectContext:(NSManagedObjectContext *)moc
{
    self = [self initWithFetchRequest:fetchRequest groupBy:groupBy inManagedOjectContext:moc usingCacheName:nil];
    return self;
}

- (id)initWithFetchRequest:(NSFetchRequest *)fetchRequest groupBy:(NSString *)groupBy inManagedOjectContext:(NSManagedObjectContext *)moc
            usingCacheName:(NSString *)cacheName
{
    self = [super init];
    if (self) {
        self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                                                            managedObjectContext:moc
                                                                              sectionNameKeyPath:groupBy
                                                                                       cacheName:cacheName];
        self.fetchedResultsController.delegate = self;
        [self.fetchedResultsController performFetch:nil];
    }
    return self;
}

- (void)dealloc
{
    self.fetchedResultsController.delegate = nil;
}


#pragma mark -
#pragma mark Setters

- (void)setDelegate:(id<SMFetchedDataProviderDelegate>)delegate
{
    if (_delegate != delegate) {
        _delegate = delegate;
        [self.fetchedResultsController performFetch:nil];
    }
}


#pragma mark -
#pragma mark DataProvider's Methods

- (NSInteger)numberOfSections
{
    return [self.fetchedResultsController sections].count;
}

- (NSInteger)numberOfItemsInSection:(NSUInteger)section
{
    id<NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][section];
    return [sectionInfo numberOfObjects];
}

- (id)objectAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.fetchedResultsController objectAtIndexPath:indexPath];
}

- (id <NSFetchedResultsSectionInfo>)sectionInfoForSection:(NSUInteger)section
{
    id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][section];
    return sectionInfo;
}

- (NSIndexPath *)indexPathForObject:(id)object
{
    return [self.fetchedResultsController indexPathForObject:object];
}

- (NSArray *)objects
{
    return [self.fetchedResultsController fetchedObjects];
}

- (void)reload
{
    [self.fetchedResultsController performFetch:nil];
}


#pragma mark -
#pragma mark - NSFetchedResultsControllerDelegate

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath
     forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath
{
    switch (type) {
        case NSFetchedResultsChangeInsert: {
            if ([self.delegate respondsToSelector:@selector(fetchedDataProvider:didInsertObject:atIndexPath:)]) {
                [self.delegate fetchedDataProvider:self didInsertObject:anObject atIndexPath:indexPath];
            }
        }
            break;
        case NSFetchedResultsChangeDelete: {
            if ([self.delegate respondsToSelector:@selector(fetchedDataProvider:didDeleteObject:atIndexPath:)]) {
                [self.delegate fetchedDataProvider:self didDeleteObject:anObject atIndexPath:indexPath];
            }
        }
            break;
        case NSFetchedResultsChangeMove: {
            if ([self.delegate respondsToSelector:@selector(fetchedDataProvider:didMoveObject:fromIndexPath:toIndexPath:)]) {
                [self.delegate fetchedDataProvider:self didMoveObject:anObject fromIndexPath:indexPath toIndexPath:newIndexPath];
            }
        }
            break;
        case NSFetchedResultsChangeUpdate: {
            if ([self.delegate respondsToSelector:@selector(fetchedDataProvider:didUpdateObject:atIndexPath:)]) {
                [self.delegate fetchedDataProvider:self didUpdateObject:anObject atIndexPath:indexPath];
            }
        }
            break;
    }
}

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    if ([self.delegate respondsToSelector:@selector(fetchedDataProviderWillChangeContent:)]) {
        [self.delegate fetchedDataProviderWillChangeContent:self];
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    if ([self.delegate respondsToSelector:@selector(fetchedDataProviderDidChangeContent:)]) {
        [self.delegate fetchedDataProviderDidChangeContent:self];
    }
}

@end

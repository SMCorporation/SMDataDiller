//
//  SMFetchedDataProvider.h
//  SMDataDiller
//
//  Created by Sergey Pirogov on 12.03.14.
//  Copyright (c) 2014 SM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class SMFetchedDataProvider;
@protocol SMFetchedDataProviderDelegate <NSObject>

@optional;
- (void)fetchedDataProviderWillChangeContent:(SMFetchedDataProvider *)fetchedDataProvider;
- (void)fetchedDataProviderDidChangeContent:(SMFetchedDataProvider *)fetchedDataProvider;

- (void)fetchedDataProvider:(SMFetchedDataProvider *)fetchedDataProvider didInsertObject:(id)object atIndexPath:(NSIndexPath *)indexPath;
- (void)fetchedDataProvider:(SMFetchedDataProvider *)fetchedDataProvider didUpdateObject:(id)object atIndexPath:(NSIndexPath *)indexPath;
- (void)fetchedDataProvider:(SMFetchedDataProvider *)fetchedDataProvider didDeleteObject:(id)object atIndexPath:(NSIndexPath *)indexPath;
- (void)fetchedDataProvider:(SMFetchedDataProvider *)fetchedDataProvider
              didMoveObject:(id)object fromIndexPath:(NSIndexPath *)oldIndexPath
                toIndexPath:(NSIndexPath *)newIndexPath;
@end


@interface SMFetchedDataProvider : NSObject

@property (nonatomic, strong, readonly) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong, readonly) NSManagedObjectContext *managedOjectContext;
@property (nonatomic, assign, readonly) NSInteger numberOfSections;
@property (nonatomic, weak) id <SMFetchedDataProviderDelegate> delegate;

- (id)initWithFetchRequest:(NSFetchRequest *)fetchRequest groupBy:(NSString *)groupBy inManagedOjectContext:(NSManagedObjectContext *)moc;
- (id)initWithFetchRequest:(NSFetchRequest *)fetchRequest groupBy:(NSString *)groupBy inManagedOjectContext:(NSManagedObjectContext *)moc
            usingCacheName:(NSString *)cacheName;

- (id)objectAtIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)numberOfItemsInSection:(NSUInteger)section;
- (id <NSFetchedResultsSectionInfo>)sectionInfoForSection:(NSUInteger)section;
- (NSIndexPath *)indexPathForObject:(id)object;
- (NSArray *)objects;
- (void)reload;

@end

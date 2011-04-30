//
//  DataController.h
//  Soaringbook
//
//  Created by Jelle Vandebeeck on 30/04/11.
//  Copyright 2011 10to1. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface DataController : NSObject
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSUndoManager *undoManager;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+ (DataController *)instance;

- (NSString *)applicationDocumentsDirectory;
@end

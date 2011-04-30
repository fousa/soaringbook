//
//  DataController.m
//  Soaringbook
//
//  Created by Jelle Vandebeeck on 30/04/11.
//  Copyright 2011 10to1. All rights reserved.
//

#import "DataController.h"

static DataController *singletonDataController = nil;

@interface DataController () {
	NSManagedObjectContext *managedObjectContext_;
    NSManagedObjectModel *managedObjectModel_;
    NSPersistentStoreCoordinator *persistentStoreCoordinator_;
}
@end

@implementation DataController

#pragma mark - Initialization

+ (DataController *)instance {
	@synchronized(self) {
		if (!singletonDataController) {
			singletonDataController = [[DataController alloc] init];
		}
	}
	return singletonDataController;
}

#pragma mark - Core Data configuration

- (NSManagedObjectContext *)managedObjectContext {
    if (managedObjectContext_ != nil) {
        return managedObjectContext_;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        managedObjectContext_ = [[NSManagedObjectContext alloc] init];
		
		//Undo Support
        NSUndoManager *localUndoManager = [[NSUndoManager  alloc] init];
        [managedObjectContext_ setUndoManager:localUndoManager];
        [localUndoManager release];
		
        [managedObjectContext_ setPersistentStoreCoordinator:coordinator];
    }
    return managedObjectContext_;
}

- (NSManagedObjectModel *)managedObjectModel {
    
    if (managedObjectModel_ != nil) {
        return managedObjectModel_;
    }
    NSString *modelPath = [[NSBundle mainBundle] pathForResource:@"Soaringbook" ofType:@"momd"];
    NSURL *modelURL = [NSURL fileURLWithPath:modelPath];
    managedObjectModel_ = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];    
    return managedObjectModel_;
}

- (NSUndoManager *)undoManager {
	return [self.managedObjectContext undoManager];
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    
    if (persistentStoreCoordinator_ != nil) {
        return persistentStoreCoordinator_;
    }
    
	NSString *storePath = [[self applicationDocumentsDirectory] stringByAppendingPathComponent: @"Soaringbook.sqlite"];
    NSURL *storeURL = [NSURL fileURLWithPath:storePath];
    
    NSError *error = nil;
	NSMutableDictionary *options = [NSMutableDictionary dictionary];
	[options setObject:[NSNumber numberWithBool:YES] forKey:NSMigratePersistentStoresAutomaticallyOption];
	[options setObject:[NSNumber numberWithBool:YES] forKey:NSInferMappingModelAutomaticallyOption];	
    persistentStoreCoordinator_ = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![persistentStoreCoordinator_ addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:options error:&error]) {
		NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    return persistentStoreCoordinator_;
}


#pragma mark - Application's Documents directory

- (NSString *)applicationDocumentsDirectory {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

#pragma mark - Memory

- (void)dealloc {
    [managedObjectContext_ release], managedObjectContext_ = nil;
    [managedObjectModel_ release], managedObjectModel_ = nil;
    [persistentStoreCoordinator_ release], persistentStoreCoordinator_ = nil;
    
	[super dealloc];
}

@end

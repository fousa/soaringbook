// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to TowPlane.m instead.

#import "_TowPlane.h"

@implementation TowPlaneID
@end

@implementation _TowPlane

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"TowPlane" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"TowPlane";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"TowPlane" inManagedObjectContext:moc_];
}

- (TowPlaneID*)objectID {
	return (TowPlaneID*)[super objectID];
}




@dynamic Type;






@dynamic identification;











+ (NSArray*)fetchAllTowPlanes:(NSManagedObjectContext*)moc_ {
	NSError *error = nil;
	NSArray *result = [self fetchAllTowPlanes:moc_ error:&error];
	if (error) {
#if TARGET_OS_IPHONE
		NSLog(@"error: %@", error);
#else
		[NSApp presentError:error];
#endif
	}
	return result;
}
+ (NSArray*)fetchAllTowPlanes:(NSManagedObjectContext*)moc_ error:(NSError**)error_ {
	NSParameterAssert(moc_);
	NSError *error = nil;
	
	NSManagedObjectModel *model = [[moc_ persistentStoreCoordinator] managedObjectModel];
	
	NSDictionary *substitutionVariables = [NSDictionary dictionary];
										
	NSFetchRequest *fetchRequest = [model fetchRequestFromTemplateWithName:@"allTowPlanes"
													 substitutionVariables:substitutionVariables];
	NSAssert(fetchRequest, @"Can't find fetch request named \"allTowPlanes\".");
	
	NSArray *result = [moc_ executeFetchRequest:fetchRequest error:&error];
	if (error_) *error_ = error;
	return result;
}


@end

// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Glider.m instead.

#import "_Glider.h"

@implementation GliderID
@end

@implementation _Glider

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Glider" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Glider";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Glider" inManagedObjectContext:moc_];
}

- (GliderID*)objectID {
	return (GliderID*)[super objectID];
}




@dynamic type;






@dynamic identification;











+ (NSArray*)fetchAllGliders:(NSManagedObjectContext*)moc_ {
	NSError *error = nil;
	NSArray *result = [self fetchAllGliders:moc_ error:&error];
	if (error) {
#if TARGET_OS_IPHONE
		NSLog(@"error: %@", error);
#else
		[NSApp presentError:error];
#endif
	}
	return result;
}
+ (NSArray*)fetchAllGliders:(NSManagedObjectContext*)moc_ error:(NSError**)error_ {
	NSParameterAssert(moc_);
	NSError *error = nil;
	
	NSManagedObjectModel *model = [[moc_ persistentStoreCoordinator] managedObjectModel];
	
	NSDictionary *substitutionVariables = [NSDictionary dictionary];
										
	NSFetchRequest *fetchRequest = [model fetchRequestFromTemplateWithName:@"allGliders"
													 substitutionVariables:substitutionVariables];
	NSAssert(fetchRequest, @"Can't find fetch request named \"allGliders\".");
	
	NSArray *result = [moc_ executeFetchRequest:fetchRequest error:&error];
	if (error_) *error_ = error;
	return result;
}


@end

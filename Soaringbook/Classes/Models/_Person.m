// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Person.m instead.

#import "_Person.h"

@implementation PersonID
@end

@implementation _Person

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Person";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Person" inManagedObjectContext:moc_];
}

- (PersonID*)objectID {
	return (PersonID*)[super objectID];
}




@dynamic name;






@dynamic pilot;



- (BOOL)pilotValue {
	NSNumber *result = [self pilot];
	return [result boolValue];
}

- (void)setPilotValue:(BOOL)value_ {
	[self setPilot:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitivePilotValue {
	NSNumber *result = [self primitivePilot];
	return [result boolValue];
}

- (void)setPrimitivePilotValue:(BOOL)value_ {
	[self setPrimitivePilot:[NSNumber numberWithBool:value_]];
}





@dynamic towPilot;



- (BOOL)towPilotValue {
	NSNumber *result = [self towPilot];
	return [result boolValue];
}

- (void)setTowPilotValue:(BOOL)value_ {
	[self setTowPilot:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveTowPilotValue {
	NSNumber *result = [self primitiveTowPilot];
	return [result boolValue];
}

- (void)setPrimitiveTowPilotValue:(BOOL)value_ {
	[self setPrimitiveTowPilot:[NSNumber numberWithBool:value_]];
}





@dynamic instructor;



- (BOOL)instructorValue {
	NSNumber *result = [self instructor];
	return [result boolValue];
}

- (void)setInstructorValue:(BOOL)value_ {
	[self setInstructor:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveInstructorValue {
	NSNumber *result = [self primitiveInstructor];
	return [result boolValue];
}

- (void)setPrimitiveInstructorValue:(BOOL)value_ {
	[self setPrimitiveInstructor:[NSNumber numberWithBool:value_]];
}










+ (NSArray*)fetchAllPeople:(NSManagedObjectContext*)moc_ {
	NSError *error = nil;
	NSArray *result = [self fetchAllPeople:moc_ error:&error];
	if (error) {
#if TARGET_OS_IPHONE
		NSLog(@"error: %@", error);
#else
		[NSApp presentError:error];
#endif
	}
	return result;
}
+ (NSArray*)fetchAllPeople:(NSManagedObjectContext*)moc_ error:(NSError**)error_ {
	NSParameterAssert(moc_);
	NSError *error = nil;
	
	NSManagedObjectModel *model = [[moc_ persistentStoreCoordinator] managedObjectModel];
	
	NSDictionary *substitutionVariables = [NSDictionary dictionary];
										
	NSFetchRequest *fetchRequest = [model fetchRequestFromTemplateWithName:@"allPeople"
													 substitutionVariables:substitutionVariables];
	NSAssert(fetchRequest, @"Can't find fetch request named \"allPeople\".");
	
	NSArray *result = [moc_ executeFetchRequest:fetchRequest error:&error];
	if (error_) *error_ = error;
	return result;
}


@end

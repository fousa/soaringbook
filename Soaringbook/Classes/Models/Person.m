#import "Person.h"

@implementation Person

#pragma mark - Sorting

+ (NSArray *)fetchAllSortedPeople:(NSManagedObjectContext*)moc_ {
	return [[Person fetchAllPeople:moc_] sortedArrayUsingDescriptors:[Person sorters]];
}

+ (NSArray *)sorters {
	NSSortDescriptor *nameSorting = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
	NSArray *sorters = [NSArray arrayWithObjects:nameSorting, nil];
	[nameSorting release];
	
	return sorters;
}

#pragma mark - Comparison

- (NSComparisonResult)compare:(Person *)aPerson {
    return [self.name compare:aPerson.name];
}

@end

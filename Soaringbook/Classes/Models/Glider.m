#import "Glider.h"

@implementation Glider

#pragma mark - Sorting

+ (NSArray *)fetchAllSortedGliders:(NSManagedObjectContext*)moc_ {
	return [[Glider fetchAllGliders:moc_] sortedArrayUsingDescriptors:[Glider sorters]];
}

+ (NSArray *)sorters {
	NSSortDescriptor *identificationSorting = [[NSSortDescriptor alloc] initWithKey:@"identification" ascending:YES];
	NSArray *sorters = [NSArray arrayWithObjects:identificationSorting, nil];
	[identificationSorting release];
	
	return sorters;
}

#pragma mark - Comparison

- (NSComparisonResult)compare:(Glider *)aGlider {
    return [self.identification compare:aGlider.identification];
}

@end

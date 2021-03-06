#import "TowPlane.h"

@implementation TowPlane

#pragma mark - Sorting

+ (NSArray *)fetchAllSortedTowPlanes:(NSManagedObjectContext*)moc_ {
	return [[TowPlane fetchAllTowPlanes:moc_] sortedArrayUsingDescriptors:[TowPlane sorters]];
}

+ (NSArray *)sorters {
	NSSortDescriptor *identificationSorting = [[NSSortDescriptor alloc] initWithKey:@"identification" ascending:YES];
	NSArray *sorters = [NSArray arrayWithObjects:identificationSorting, nil];
	[identificationSorting release];
	
	return sorters;
}

#pragma mark - Comparison

- (NSComparisonResult)compare:(TowPlane *)aTowPlane {
    return [self.identification compare:aTowPlane.identification];
}

@end

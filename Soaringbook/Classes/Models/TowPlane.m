#import "TowPlane.h"

@implementation TowPlane

#pragma mark - Sorting

+ (NSArray *)fetchAllSortedTowPlanes:(NSManagedObjectContext*)moc_ {
	return [[TowPlane fetchAllTowPlanes:moc_] sortedArrayUsingDescriptors:[TowPlane sorters]];
}

+ (NSArray *)sorters {
	NSSortDescriptor *nameSorting = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
	NSArray *sorters = [NSArray arrayWithObjects:nameSorting, nil];
	[nameSorting release];
	
	return sorters;
}

#pragma mark - Comparison

- (NSComparisonResult)compare:(TowPlane *)aTowPlane {
    return [self.identification compare:aTowPlane.identification];
}

@end

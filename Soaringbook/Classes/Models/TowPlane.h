#import "_TowPlane.h"

@interface TowPlane : _TowPlane
+ (NSArray *)fetchAllSortedTowPlanes:(NSManagedObjectContext*)moc_;
+ (NSArray *)sorters;
@end

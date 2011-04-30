#import "_Glider.h"

@interface Glider : _Glider
+ (NSArray *)fetchAllSortedGliders:(NSManagedObjectContext*)moc_;
+ (NSArray *)sorters;
@end

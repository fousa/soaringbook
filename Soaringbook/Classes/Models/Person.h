#import "_Person.h"

@interface Person : _Person
+ (NSArray *)fetchAllSortedPeople:(NSManagedObjectContext*)moc_;
+ (NSArray *)sorters;
@end

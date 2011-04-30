// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to TowPlane.h instead.

#import <CoreData/CoreData.h>






@interface TowPlaneID : NSManagedObjectID {}
@end

@interface _TowPlane : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (TowPlaneID*)objectID;



@property (nonatomic, retain) NSString *Type;

//- (BOOL)validateType:(id*)value_ error:(NSError**)error_;



@property (nonatomic, retain) NSString *identification;

//- (BOOL)validateIdentification:(id*)value_ error:(NSError**)error_;





+ (NSArray*)fetchAllTowPlanes:(NSManagedObjectContext*)moc_ ;
+ (NSArray*)fetchAllTowPlanes:(NSManagedObjectContext*)moc_ error:(NSError**)error_;



@end

@interface _TowPlane (CoreDataGeneratedAccessors)

@end

@interface _TowPlane (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveType;
- (void)setPrimitiveType:(NSString*)value;


- (NSString*)primitiveIdentification;
- (void)setPrimitiveIdentification:(NSString*)value;



@end

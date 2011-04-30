// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Glider.h instead.

#import <CoreData/CoreData.h>






@interface GliderID : NSManagedObjectID {}
@end

@interface _Glider : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (GliderID*)objectID;



@property (nonatomic, retain) NSString *type;

//- (BOOL)validateType:(id*)value_ error:(NSError**)error_;



@property (nonatomic, retain) NSString *identification;

//- (BOOL)validateIdentification:(id*)value_ error:(NSError**)error_;





+ (NSArray*)fetchAllGliders:(NSManagedObjectContext*)moc_ ;
+ (NSArray*)fetchAllGliders:(NSManagedObjectContext*)moc_ error:(NSError**)error_;



@end

@interface _Glider (CoreDataGeneratedAccessors)

@end

@interface _Glider (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveType;
- (void)setPrimitiveType:(NSString*)value;


- (NSString*)primitiveIdentification;
- (void)setPrimitiveIdentification:(NSString*)value;



@end

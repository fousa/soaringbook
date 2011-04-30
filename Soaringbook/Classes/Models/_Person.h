// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Person.h instead.

#import <CoreData/CoreData.h>








@interface PersonID : NSManagedObjectID {}
@end

@interface _Person : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (PersonID*)objectID;



@property (nonatomic, retain) NSString *name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;



@property (nonatomic, retain) NSNumber *pilot;

@property BOOL pilotValue;
- (BOOL)pilotValue;
- (void)setPilotValue:(BOOL)value_;

//- (BOOL)validatePilot:(id*)value_ error:(NSError**)error_;



@property (nonatomic, retain) NSNumber *towPilot;

@property BOOL towPilotValue;
- (BOOL)towPilotValue;
- (void)setTowPilotValue:(BOOL)value_;

//- (BOOL)validateTowPilot:(id*)value_ error:(NSError**)error_;



@property (nonatomic, retain) NSNumber *instructor;

@property BOOL instructorValue;
- (BOOL)instructorValue;
- (void)setInstructorValue:(BOOL)value_;

//- (BOOL)validateInstructor:(id*)value_ error:(NSError**)error_;





+ (NSArray*)fetchAllPeople:(NSManagedObjectContext*)moc_ ;
+ (NSArray*)fetchAllPeople:(NSManagedObjectContext*)moc_ error:(NSError**)error_;



@end

@interface _Person (CoreDataGeneratedAccessors)

@end

@interface _Person (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;


- (NSNumber*)primitivePilot;
- (void)setPrimitivePilot:(NSNumber*)value;

- (BOOL)primitivePilotValue;
- (void)setPrimitivePilotValue:(BOOL)value_;


- (NSNumber*)primitiveTowPilot;
- (void)setPrimitiveTowPilot:(NSNumber*)value;

- (BOOL)primitiveTowPilotValue;
- (void)setPrimitiveTowPilotValue:(BOOL)value_;


- (NSNumber*)primitiveInstructor;
- (void)setPrimitiveInstructor:(NSNumber*)value;

- (BOOL)primitiveInstructorValue;
- (void)setPrimitiveInstructorValue:(BOOL)value_;



@end

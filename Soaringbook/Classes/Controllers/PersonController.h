//
//  PersonController.h
//  Soaringbook
//
//  Created by Jelle Vandebeeck on 29/04/11.
//  Copyright 2011 10to1. All rights reserved.
//

#import "Person.h"

@protocol PersonControllerDelegate <NSObject>
@optional
- (void)addPerson:(Person *)person;
- (void)editPerson:(Person *)person;
@end

@interface PersonController : UIViewController
@property (nonatomic, retain) Person *person;
@property (nonatomic, retain) id<PersonControllerDelegate> delegate;
@property (nonatomic, retain) IBOutlet UITextField *name;
@property (nonatomic, retain) IBOutlet UISwitch *pilot;
@property (nonatomic, retain) IBOutlet UISwitch *towPilot;
@property (nonatomic, retain) IBOutlet UISwitch *instructor;
@end

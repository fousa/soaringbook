//
//  PeopleController.h
//  Soaringbook
//
//  Created by Jelle Vandebeeck on 29/04/11.
//  Copyright 2011 10to1. All rights reserved.
//

#import "PersonController.h"

@interface PeopleController : UITableViewController <PersonControllerDelegate>
@property (nonatomic, retain) NSMutableArray *people;

- (IBAction)add:(id)sender;
- (IBAction)edit:(id)sender;
@end

//
//  GlidersController.h
//  Soaringbook
//
//  Created by Jelle Vandebeeck on 30/04/11.
//  Copyright 2011 10to1. All rights reserved.
//

#import "GliderController.h"

@interface GlidersController : UITableViewController <GliderControllerDelegate>
@property (nonatomic, retain) NSMutableArray *gliders;

- (IBAction)add:(id)sender;
- (IBAction)edit:(id)sender;
@end

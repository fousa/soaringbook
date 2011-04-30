//
//  TowPlanesController.h
//  Soaringbook
//
//  Created by Jelle Vandebeeck on 30/04/11.
//  Copyright 2011 10to1. All rights reserved.
//

#import "TowPlaneController.h"

@interface TowPlanesController : UITableViewController <TowPlaneControllerDelegate>
@property (nonatomic, retain) NSMutableArray *towPlanes;

- (IBAction)add:(id)sender;
- (IBAction)edit:(id)sender;
@end

//
//  TowPlaneController.h
//  Soaringbook
//
//  Created by Jelle Vandebeeck on 30/04/11.
//  Copyright 2011 10to1. All rights reserved.
//

#import "TowPlane.h"

@protocol TowPlaneControllerDelegate <NSObject>
@optional
- (void)addTowPlane:(TowPlane *)towPlane;
- (void)editTowPlane:(TowPlane *)towPlane;
@end

@interface TowPlaneController : UIViewController
@property (nonatomic, retain) TowPlane *towPlane;
@property (nonatomic, retain) id<TowPlaneControllerDelegate> delegate;
@property (nonatomic, retain) IBOutlet UITextField *identification;
@property (nonatomic, retain) IBOutlet UITextField *type;

- (IBAction)change:(id)sender;
@end


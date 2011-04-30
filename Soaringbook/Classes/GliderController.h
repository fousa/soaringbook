//
//  GliderController.h
//  Soaringbook
//
//  Created by Jelle Vandebeeck on 30/04/11.
//  Copyright 2011 10to1. All rights reserved.
//

#import "Glider.h"

@protocol GliderControllerDelegate <NSObject>
@optional
- (void)addGlider:(Glider *)glider;
- (void)editGlider:(Glider *)glider;
@end

@interface GliderController : UIViewController
@property (nonatomic, retain) Glider *glider;
@property (nonatomic, retain) id<GliderControllerDelegate> delegate;
@property (nonatomic, retain) IBOutlet UITextField *identification;
@property (nonatomic, retain) IBOutlet UITextField *type;

- (IBAction)change:(id)sender;
@end

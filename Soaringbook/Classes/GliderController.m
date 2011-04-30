//
//  GliderController.m
//  Soaringbook
//
//  Created by Jelle Vandebeeck on 30/04/11.
//  Copyright 2011 10to1. All rights reserved.
//

#import "GliderController.h"

#import "GlidersController.h"

#import "DataController.h"

@interface GliderController (SheetActions)
- (void)close;
- (void)validate;
@end

@implementation GliderController
@synthesize glider, delegate, identification, type;

#pragma mark - Memory

- (void)dealloc {
    self.glider = nil;
    self.identification = nil;
    self.type = nil;
    
    [super dealloc];
}

#pragma mark - View flow

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Move away to createBarButtons
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(save:)];
    self.navigationItem.rightBarButtonItem = saveButton;
    [saveButton release];
    
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(cancel:)];
    self.navigationItem.leftBarButtonItem = cancelButton;
    [cancelButton release];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (self.glider == nil) {
        self.title = @"Add glider";
    } else {
        self.title = @"Edit glider";
        self.identification.text = self.glider.identification;
        self.type.text = self.glider.type;
    }
    
    [self validate];
    
    [self.identification becomeFirstResponder];
}

#pragma mark - Actions

- (IBAction)cancel:(id)sender {
    [self close];
}

- (IBAction)save:(id)sender {
    BOOL edit = self.glider != nil;
    if (!edit) self.glider = [Glider insertInManagedObjectContext:MOC];
    
    self.glider.identification = self.identification.text;
    self.glider.type = self.type.text;
    [MOC save:nil];
    
    if (!edit && [self.delegate respondsToSelector:@selector(addGlider:)]) {
        [self.delegate performSelector:@selector(addGlider:) withObject:self.glider];
    } else if (edit && [self.delegate respondsToSelector:@selector(editTowPlane:)]) {
        [self.delegate performSelector:@selector(editGlider:) withObject:self.glider];
    }
    
    [self close];
}

#pragma mark - Changes

- (IBAction)change:(id)sender {
    [self validate];
}

#pragma mark - Field actions

-(BOOL)textFieldShouldReturn:(UITextField*)textField {
    if (textField == self.identification) {
        [self.type becomeFirstResponder];
    } else {
        if (!IsEmpty(self.identification.text)) {
            [self save:nil];
        } else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Fail" message:@"The glider was not saved because the identification field is empty." delegate:nil cancelButtonTitle:@"Retry" otherButtonTitles:nil];
            [alert show];
            [alert release];
        }
    }
    return NO;
}

#pragma mark - Sheet actions

- (void)close {
    [self.navigationController.parentViewController dismissModalViewControllerAnimated:YES];
}

- (void)validate {
    BOOL valid = !IsEmpty(self.identification.text);
    self.navigationItem.rightBarButtonItem.enabled = valid;
}

#pragma mark - Orientation

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}

@end
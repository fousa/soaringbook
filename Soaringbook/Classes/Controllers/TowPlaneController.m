//
//  TowPlaneController.m
//  Soaringbook
//
//  Created by Jelle Vandebeeck on 30/04/11.
//  Copyright 2011 10to1. All rights reserved.
//

#import "TowPlaneController.h"

#import "TowPlanesController.h"

#import "DataController.h"

@interface TowPlaneController (SheetActions)
- (void)close;
- (void)validate;
@end

@implementation TowPlaneController
@synthesize towPlane, delegate, identification, type;

#pragma mark - Memory

- (void)dealloc {
    self.towPlane = nil;
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
    
    if (self.towPlane == nil) {
        self.title = @"Add tow plane";
    } else {
        self.title = @"Edit tow plane";
        self.identification.text = self.towPlane.identification;
        self.type.text = self.towPlane.type;
    }
    
    [self validate];
    
    [self.identification becomeFirstResponder];
}

#pragma mark - Actions

- (IBAction)cancel:(id)sender {
    [self close];
}

- (IBAction)save:(id)sender {
    BOOL edit = self.towPlane != nil;
    if (!edit) self.towPlane = [TowPlane insertInManagedObjectContext:MOC];
    
    self.towPlane.identification = self.identification.text;
    self.towPlane.type = self.type.text;
    [MOC save:nil];
    
    if (!edit && [self.delegate respondsToSelector:@selector(addTowPlane:)]) {
        [self.delegate performSelector:@selector(addTowPlane:) withObject:self.towPlane];
    } else if (edit && [self.delegate respondsToSelector:@selector(editTowPlane:)]) {
        [self.delegate performSelector:@selector(editTowPlane:) withObject:self.towPlane];
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
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Fail" message:@"The tow plane was not saved because the identification field is empty." delegate:nil cancelButtonTitle:@"Retry" otherButtonTitles:nil];
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

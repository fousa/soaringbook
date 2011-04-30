//
//  PersonController.m
//  Soaringbook
//
//  Created by Jelle Vandebeeck on 29/04/11.
//  Copyright 2011 10to1. All rights reserved.
//

#import "PersonController.h"

#import "PeopleController.h"

#import "DataController.h"

@interface PersonController (SheetActions)
- (void)close;
- (void)validate;
@end

@implementation PersonController
@synthesize person, delegate, name, pilot, towPilot, instructor;

#pragma mark - Memory

- (void)dealloc {
    self.person = nil;
    self.name = nil;
    self.pilot = nil;
    self.towPilot = nil;
    self.instructor = nil;
    
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
    
    if (self.person == nil) {
        self.title = @"Add person";
    } else {
        self.title = @"Edit person";
        self.name.text = self.person.name;
        self.pilot.on = self.person.pilotValue;
        self.towPilot.on = self.person.towPilotValue;
        self.instructor.on = self.person.instructorValue;
    }
    
    [self validate];
}

#pragma mark - Actions

- (IBAction)cancel:(id)sender {
    [self close];
}

- (IBAction)save:(id)sender {
    BOOL edit = self.person != nil;
    if (!edit) self.person = [Person insertInManagedObjectContext:MOC];
    
    self.person.name = self.name.text;
    self.person.pilotValue = self.pilot.on;
    self.person.towPilotValue = self.towPilot.on;
    self.person.instructorValue = self.instructor.on;
    [MOC save:nil];
    
    if (!edit && [self.delegate respondsToSelector:@selector(addPerson:)]) {
        [self.delegate performSelector:@selector(addPerson:) withObject:self.person];
    } else if (edit && [self.delegate respondsToSelector:@selector(editPerson:)]) {
        [self.delegate performSelector:@selector(editPerson:) withObject:self.person];
    }
    
    [self close];
}

#pragma mark - Changes

- (IBAction)change:(id)sender {
    [self validate];
}

#pragma mark - Sheet actions

- (void)close {
    [self.navigationController.parentViewController dismissModalViewControllerAnimated:YES];
}

- (void)validate {
    BOOL valid = !IsEmpty(self.name.text);
    valid = valid && ((self.instructor.on == YES && self.pilot.on == YES) || self.instructor.on == NO);
    self.navigationItem.rightBarButtonItem.enabled = valid;
}

#pragma mark - Orientation

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}

@end

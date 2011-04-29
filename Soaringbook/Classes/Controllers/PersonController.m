//
//  PersonController.m
//  Soaringbook
//
//  Created by Jelle Vandebeeck on 29/04/11.
//  Copyright 2011 10to1. All rights reserved.
//

#import "PersonController.h"

@interface PersonController (SheetActions)
- (void)close;
@end

@implementation PersonController
@synthesize editable;

#pragma mark - Memory

- (void)dealloc {
    [super dealloc];
}

#pragma mark - View flow

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStyleDone target:self action:@selector(save:)];
    self.navigationItem.rightBarButtonItem = saveButton;
    [saveButton release];
    
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(cancel:)];
    self.navigationItem.leftBarButtonItem = cancelButton;
    [cancelButton release];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.title = self.editable ? @"Edit person" : @"Add person";
}

#pragma mark - Actions

- (IBAction)cancel:(id)sender {
    [self close];
}

- (IBAction)save:(id)sender {
    [self close];
}

#pragma mark - Sheet actions

- (void)close {
    [self.navigationController.parentViewController dismissModalViewControllerAnimated:YES];
}

#pragma mark - Orientation

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}

@end

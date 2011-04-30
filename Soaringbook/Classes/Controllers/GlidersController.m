//
//  GlidersController.m
//  Soaringbook
//
//  Created by Jelle Vandebeeck on 30/04/11.
//  Copyright 2011 10to1. All rights reserved.
//

#import "GlidersController.h"

#import "JAVBinarySearchAdditions.h"

#import "DataController.h"

#import "Glider.h"

@interface GlidersController (SheetActions)
- (void)showFormFor:(Glider *)glider;
@end

@implementation GlidersController
@synthesize gliders;

#pragma mark - Memory

- (void)dealloc {
    self.gliders = nil;
    
    [super dealloc];
}

#pragma mark - View flow

- (void)viewWillAppear:(BOOL)animated {
    self.gliders = [NSMutableArray arrayWithArray:[Glider fetchAllSortedGliders:MOC]];
}

#pragma mark - Actions

- (IBAction)add:(id)sender {
    [self showFormFor:nil];
}

- (IBAction)edit:(id)sender {
    self.navigationItem.rightBarButtonItem.title = self.tableView.editing ? @"Edit" : @"Done";
    self.navigationItem.rightBarButtonItem.style = self.tableView.editing ? UIBarButtonItemStyleBordered : UIBarButtonItemStyleDone;
    
    [self.tableView setEditing:!self.tableView.editing animated:YES];
}

#pragma mark - Sheet actions

- (void)showFormFor:(Glider *)glider {
    GliderController *gliderController = [[GliderController alloc] initWithNibName:@"GliderController" bundle:[NSBundle mainBundle]];
    gliderController.glider = glider;
    gliderController.delegate = self;
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:gliderController];
    [gliderController release];
    navigationController.modalPresentationStyle = UIModalPresentationFormSheet;
    navigationController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self.navigationController presentModalViewController:navigationController animated:YES];
    [navigationController release];
}

#pragma mark - Glider delegate methods

- (void)editGlider:(Glider *)glider {
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
}

- (void)addGlider:(Glider *)glider {
    unsigned index = [self.gliders indexOfObject:glider inArraySortedBy:@selector(compare:)];
	if ([self.gliders count] == 0 || index >= [self.gliders count]) {
		unsigned insertIndex = [self.gliders indexOfObject:glider whenAddingToArraySortedBy:@selector(compare:)];
		[self.gliders addObject:glider intoArraySortedBy:@selector(compare:)];
		[self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:insertIndex inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
	}
}

#pragma mark - Orientation

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}

#pragma mark - Table view delegate

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section {
    return [self.gliders count];
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [aTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    Glider *glider = [self.gliders objectAtIndex:indexPath.row];
    cell.textLabel.text = glider.identification;
    
    return cell;
}

- (void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Glider *glider = [self.gliders objectAtIndex:indexPath.row];
    [self showFormFor:glider];
    
    [aTableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (BOOL)tableView:(UITableView *)aTableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)aTableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Glider *glider = [self.gliders objectAtIndex:indexPath.row];
        [self.gliders removeObject:glider];
        [MOC deleteObject:glider];
        [MOC save:nil];
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
}

@end

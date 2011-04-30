//
//  TowPlanesController.m
//  Soaringbook
//
//  Created by Jelle Vandebeeck on 30/04/11.
//  Copyright 2011 10to1. All rights reserved.
//

#import "TowPlanesController.h"

#import "JAVBinarySearchAdditions.h"

#import "DataController.h"

#import "TowPlane.h"

@interface TowPlanesController (SheetActions)
- (void)showFormFor:(TowPlane *)towPlane;
@end

@implementation TowPlanesController
@synthesize towPlanes;

#pragma mark - Memory

- (void)dealloc {
    self.towPlanes = nil;
    
    [super dealloc];
}

#pragma mark - View flow

- (void)viewWillAppear:(BOOL)animated {
    self.towPlanes = [NSMutableArray arrayWithArray:[TowPlane fetchAllSortedTowPlanes:MOC]];
}

#pragma mark - Actions

- (IBAction)add:(id)sender {
    [self showFormFor:nil];
}

- (IBAction)edit:(id)sender {
    [self.tableView setEditing:!self.tableView.editing animated:YES];
}

#pragma mark - Sheet actions

- (void)showFormFor:(TowPlane *)towPlane {
    TowPlaneController *towPlaneController = [[TowPlaneController alloc] initWithNibName:@"TowPlaneController" bundle:[NSBundle mainBundle]];
    towPlaneController.towPlane = towPlane;
    towPlaneController.delegate = self;
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:towPlaneController];
    [towPlaneController release];
    navigationController.modalPresentationStyle = UIModalPresentationFormSheet;
    navigationController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self.navigationController presentModalViewController:navigationController animated:YES];
    [navigationController release];
}

#pragma mark - Person delegate methods

- (void)editTowPlane:(TowPlane *)towPlane {
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
}

- (void)addTowPlane:(TowPlane *)towPlane {
    unsigned index = [self.towPlanes indexOfObject:towPlane inArraySortedBy:@selector(compare:)];
	if ([self.towPlanes count] == 0 || index >= [self.towPlanes count]) {
		unsigned insertIndex = [self.towPlanes indexOfObject:towPlane whenAddingToArraySortedBy:@selector(compare:)];
		[self.towPlanes addObject:towPlane intoArraySortedBy:@selector(compare:)];
		[self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:insertIndex inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
	}
}

#pragma mark - Orientation

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}

#pragma mark - Table view delegate

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section {
    return [self.towPlanes count];
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [aTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    TowPlane *towPlane = [self.towPlanes objectAtIndex:indexPath.row];
    cell.textLabel.text = towPlane.identification;
    
    return cell;
}

- (void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TowPlane *towPlane = [self.towPlanes objectAtIndex:indexPath.row];
    [self showFormFor:towPlane];
    
    [aTableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (BOOL)tableView:(UITableView *)aTableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)aTableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        TowPlane *towPlane = [self.towPlanes objectAtIndex:indexPath.row];
        [self.towPlanes removeObject:towPlane];
        [MOC deleteObject:towPlane];
        [MOC save:nil];
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
}

@end
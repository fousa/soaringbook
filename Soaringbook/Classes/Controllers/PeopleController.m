//
//  PeopleController.m
//  Soaringbook
//
//  Created by Jelle Vandebeeck on 29/04/11.
//  Copyright 2011 10to1. All rights reserved.
//

#import "PeopleController.h"

#import "JAVBinarySearchAdditions.h"

#import "DataController.h"

#import "Person.h"

@interface PeopleController (SheetActions)
- (void)showFormFor:(Person *)person;
@end

@implementation PeopleController
@synthesize people;

#pragma mark - Memory

- (void)dealloc {
    self.people = nil;
    
    [super dealloc];
}

#pragma mark - View flow

- (void)viewWillAppear:(BOOL)animated {
    self.people = [NSMutableArray arrayWithArray:[Person fetchAllSortedPeople:MOC]];
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

- (void)showFormFor:(Person *)person {
    PersonController *personController = [[PersonController alloc] initWithNibName:@"PersonController" bundle:[NSBundle mainBundle]];
    personController.person = person;
    personController.delegate = self;
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:personController];
    [personController release];
    navigationController.modalPresentationStyle = UIModalPresentationFormSheet;
    navigationController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    [self.navigationController presentModalViewController:navigationController animated:YES];
    [navigationController release];
}

#pragma mark - Person delegate methods

- (void)editPerson:(Person *)person {
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
}

- (void)addPerson:(Person *)person {
    unsigned index = [self.people indexOfObject:person inArraySortedBy:@selector(compare:)];
	if ([self.people count] == 0 || index >= [self.people count]) {
		unsigned insertIndex = [self.people indexOfObject:person whenAddingToArraySortedBy:@selector(compare:)];
		[self.people addObject:person intoArraySortedBy:@selector(compare:)];
		[self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:insertIndex inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
	}
}

#pragma mark - Orientation

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}

#pragma mark - Table view delegate

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section {
    return [self.people count];
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [aTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    Person *person = [self.people objectAtIndex:indexPath.row];
    cell.textLabel.text = person.name;
    
    return cell;
}

- (void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Person *person = [self.people objectAtIndex:indexPath.row];
    [self showFormFor:person];
    
    [aTableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (BOOL)tableView:(UITableView *)aTableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)aTableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Person *person = [self.people objectAtIndex:indexPath.row];
        [self.people removeObject:person];
        [MOC deleteObject:person];
        [MOC save:nil];
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
}

@end

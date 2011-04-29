//
//  SoaringbookAppDelegate.m
//  Soaringbook
//
//  Created by Jelle Vandebeeck on 29/04/11.
//  Copyright 2011 10to1. All rights reserved.
//

#import "SoaringbookAppDelegate.h"

@implementation SoaringbookAppDelegate
@synthesize window;
@synthesize tabBarController;

#pragma mark - Memory

- (void)dealloc {
    self.window = nil;
    self.tabBarController = nil;
    
    [super dealloc];
}

#pragma mark - Application delegates

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end

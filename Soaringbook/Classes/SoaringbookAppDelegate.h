//
//  SoaringbookAppDelegate.h
//  Soaringbook
//
//  Created by Jelle Vandebeeck on 29/04/11.
//  Copyright 2011 10to1. All rights reserved.
//

@interface SoaringbookAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate>
@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;
@end

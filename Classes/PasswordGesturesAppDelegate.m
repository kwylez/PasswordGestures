//
//  PasswordGesturesAppDelegate.m
//  PasswordGestures
//
//  Created by Cory Wiles on 11/16/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PasswordGesturesAppDelegate.h"
#import "PasswordGesturesViewController.h"

@implementation PasswordGesturesAppDelegate


@synthesize window;

@synthesize viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	 
	[window addSubview:viewController.view];
	[window makeKeyAndVisible];
	
	return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {

	// Save data if appropriate.

  
}

- (void)dealloc {

	[window release];
	[viewController release];
  [super dealloc];
}

@end

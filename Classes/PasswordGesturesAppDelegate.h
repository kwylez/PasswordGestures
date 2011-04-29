//
//  PasswordGesturesAppDelegate.h
//  PasswordGestures
//
//  Created by Cory Wiles on 11/16/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PasswordGesturesViewController;

@interface PasswordGesturesAppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow *window;
	PasswordGesturesViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet PasswordGesturesViewController *viewController;

@end

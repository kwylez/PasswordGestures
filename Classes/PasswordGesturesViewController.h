//
//  PasswordGesturesViewController.h
//  PasswordGestures
//
//  Created by Cory Wiles on 11/16/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SetPasswordGestureViewController.h"
#import "PasswordReminderViewController.h"

@interface PasswordGesturesViewController : UIViewController {

}

- (void)presentSetPasswordVC;
- (void)presentReminderPasswordVC;

@end
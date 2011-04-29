//
//  SetPasswordGestureViewController.h
//  PasswordGestures
//
//  Created by Cory Wiles on 11/30/10.
//  Copyright 2010 Wiles, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PasswordManager.h"
#import "PanGesture.h"
#import "TapGesture.h"
#import "RotateGesture.h"
#import "PinchGesture.h"
#import "SwipeGesture.h"
#import "LongPressGesture.h"
#import "PasswordGestureProtocol.h"

/**
 * @todo
 * Need to add isConfirmed so that in the event of a viewDidUnload or memorywarning
 * I can release and nil out the confirmPasswordArray.
 *
 * Also need to research how to handle if a call comes in or the app enters the background
 */

@interface SetPasswordGestureViewController : UIViewController <UIGestureRecognizerDelegate, PasswordGestureDelegate> {
  
  NSTimer *timer;
  NSUInteger numSeconds;
  BOOL isConfirming;
  NSMutableArray *initPasswordArray;
  NSMutableArray *confirmPasswordArray;
}

@property (nonatomic, retain) NSTimer *timer;
@property NSUInteger numSeconds;
@property (nonatomic, readonly) BOOL isConfirming;
@property (nonatomic, retain) NSMutableArray *confirmPasswordArray;
@property (nonatomic, retain) NSMutableArray *initPasswordArray;

- (void)finishedSettingPassword;
- (void)confirmingPasswordAction;
- (void)cancelSettingPassword;
- (void)saveGesture:(id)gesture confirming:(BOOL)confirming;

@end

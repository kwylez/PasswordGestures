//
//  Constants.h
//  PasswordGestures
//
//  Created by Cory Wiles on 11/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kPasswordGestureKey @"passwordGesture"
#define kRotateGestureIsRightKey @"isRight"
#define kRotateGestureIsRotateGestureKey @"RotateGesture"
#define kPinchGestureIsZoomKey @"Zoom"
#define kPinchGestureScaleKey @"Scale"
#define kPinchGestureVelocity @"Velocity"
#define kPinchGestureIsPinchGestureKey @"PinchGesture"
#define kPanGestureIsPanGestureKey @"PanGesture"
#define kPanGestureNumberOfTouches @"NumberOfPanTouches"
#define kTapGestureIsTapGestureKey @"TapGesture"
#define kSwipeGestureIsSwipeGestureKey @"SwipeGesture"
#define kLongPressGestureisLongPressGestureKey @"LongPressGesture"
#define kLongPressGestureNumberOfSecondsKey @"LongPressGestureNumSeconds"

typedef enum {
  UIPanGesture,
  UITapGesture,
  UIRotateGesture,
  UIPinchGesture,
  UISwipeDownGesture,
  UISwipeUpGesture,
  UISwipeLeftGesture,
  UISwipeRightGesture,
  UILongPressGesture,
} UIGestureType;

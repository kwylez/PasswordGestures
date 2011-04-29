//
//  PinchGesture.h
//  PasswordGestures
//
//  Created by Cory Wiles on 11/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PinchGesture : NSObject <NSCoding> {
  BOOL isZoomOut;
  CGFloat gestureScale;
  CGFloat gestureVelocity;
  UIGestureType pinchGesture;
}

@property (nonatomic) BOOL isZoomOut;
@property (nonatomic, assign) CGFloat gestureScale;
@property (nonatomic, assign) CGFloat gestureVelocity;
@property UIGestureType pinchGesture;

- (BOOL)isEqualToPinchGesture:(PinchGesture *)aPinchGesture;

@end

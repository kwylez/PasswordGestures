//
//  PanGesture.h
//  PasswordGestures
//
//  Created by Cory Wiles on 11/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PanGesture : NSObject <NSCoding> {
  UIGestureType panGesture;
  NSUInteger numberOfTouches;
}

@property UIGestureType panGesture;
@property NSUInteger numberOfTouches;

- (BOOL)isEqualToPanGesture:(PanGesture *)aPanGesture;

@end

//
//  SwipeGesture.h
//  PasswordGestures
//
//  Created by Cory Wiles on 11/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SwipeGesture : NSObject <NSCoding> {
  UIGestureType swipeGesture;
}

@property UIGestureType swipeGesture;

- (BOOL)isEqualToSwipeGesture:(SwipeGesture *)aSwipeGesture;

@end

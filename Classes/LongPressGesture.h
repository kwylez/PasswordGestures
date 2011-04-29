//
//  LongPressGesture.h
//  PasswordGestures
//
//  Created by Cory Wiles on 11/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface LongPressGesture : NSObject {
  UIGestureType longPressGesture;
  NSUInteger numberOfSeconds;
}

@property UIGestureType longPressGesture;
@property NSUInteger numberOfSeconds;

- (BOOL)isEqualToLongPressGesture:(LongPressGesture *)aLongPressGesture;

@end

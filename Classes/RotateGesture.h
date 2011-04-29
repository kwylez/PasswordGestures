//
//  RotateGesture.h
//  PasswordGestures
//
//  Created by Cory Wiles on 11/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RotateGesture : NSObject <NSCoding> {
	BOOL isRightRotation;
  UIGestureType rotateGesture;
}

@property (nonatomic) BOOL isRightRotation;
@property UIGestureType rotateGesture;

- (BOOL)isEqualToRotateGesture:(RotateGesture *)aRotateGesture;

@end

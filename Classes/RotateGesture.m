//
//  RotateGesture.m
//  PasswordGestures
//
//  Created by Cory Wiles on 11/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "RotateGesture.h"


@implementation RotateGesture

@synthesize isRightRotation;
@synthesize rotateGesture;

- (id)init {
  
  if (self = [super init]) {
		self.isRightRotation = NO;
  }
  
  return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
  
  [aCoder encodeBool:self.isRightRotation forKey:kRotateGestureIsRightKey];
  [aCoder encodeInt:self.rotateGesture forKey:kRotateGestureIsRotateGestureKey];
}

- (id)initWithCoder:(NSCoder *)decoder {
  
	if (self = [super init]) {

		self.isRightRotation = [decoder decodeBoolForKey:kRotateGestureIsRightKey];
    self.rotateGesture   = [decoder decodeIntForKey:kRotateGestureIsRotateGestureKey];
	}
	
	return self;
}

- (BOOL)isEqual:(id)other{
  
  if (other == self)
    return YES;
  
  if (!other || ![other isKindOfClass:[self class]])
    return NO;
  
  return [self isEqualToRotateGesture:other];  
}

- (BOOL)isEqualToRotateGesture:(RotateGesture *)aRotateGesture {
  
  if (self == aRotateGesture)
    return YES;
  
  if (rotateGesture != [aRotateGesture rotateGesture])
    return NO;
  
  if (isRightRotation != [aRotateGesture isRightRotation])
    return NO;
  
  return YES;
}

- (unsigned)hash {
  return isRightRotation ^ rotateGesture;
}

- (void)dealloc {
	[super dealloc];
}


@end

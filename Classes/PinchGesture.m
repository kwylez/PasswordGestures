//
//  PinchGesture.m
//  PasswordGestures
//
//  Created by Cory Wiles on 11/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PinchGesture.h"

@implementation PinchGesture

@synthesize isZoomOut;
@synthesize gestureScale;
@synthesize gestureVelocity;
@synthesize pinchGesture;

- (id)init {
  
  if (self = [super init]) {

		self.isZoomOut       = NO;
    self.gestureScale    = 0.0f;
    self.gestureVelocity = 0.0f;
  }
  
  return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
  
  [aCoder encodeBool:self.isZoomOut forKey:kPinchGestureIsZoomKey];
  [aCoder encodeFloat:self.gestureScale forKey:kPinchGestureScaleKey];
  [aCoder encodeFloat:self.gestureVelocity forKey:kPinchGestureVelocity];
  [aCoder encodeInt:self.pinchGesture forKey:kPinchGestureIsPinchGestureKey];
}

- (id)initWithCoder:(NSCoder *)decoder {
  
	if (self = [super init]) {

    self.isZoomOut       = [decoder decodeBoolForKey:kPinchGestureIsZoomKey];
    self.gestureScale    = [decoder decodeFloatForKey:kPinchGestureScaleKey];
    self.gestureVelocity = [decoder decodeFloatForKey:kPinchGestureVelocity];
    self.pinchGesture    = [decoder decodeIntForKey:kPinchGestureIsPinchGestureKey];
	}
	
	return self;
}

- (void)dealloc {
  [super dealloc];
}

- (BOOL)isEqual:(id)other{
  
  if (other == self)
    return YES;
  
  if (!other || ![other isKindOfClass:[self class]])
    return NO;
  
  return [self isEqualToPinchGesture:other];  
}

- (BOOL)isEqualToPinchGesture:(PinchGesture *)aPinchGesture {
  
  if (self == aPinchGesture)
    return YES;
  
  if (isZoomOut != [aPinchGesture isZoomOut])
    return NO;
  
  if (gestureScale != [aPinchGesture gestureScale])
    return NO;
  
  if (gestureVelocity != [aPinchGesture gestureVelocity])
    return NO;

  if (pinchGesture != [aPinchGesture pinchGesture])
    return NO;
  
  return YES;
}

- (unsigned)hash {
  return isZoomOut + gestureScale + gestureVelocity + pinchGesture;
}


@end

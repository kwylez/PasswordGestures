//
//  PanGesture.m
//  PasswordGestures
//
//  Created by Cory Wiles on 11/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PanGesture.h"


@implementation PanGesture

@synthesize panGesture;
@synthesize numberOfTouches;

- (void)encodeWithCoder:(NSCoder *)aCoder {
  
  [aCoder encodeInt:self.panGesture forKey:kPanGestureIsPanGestureKey];
  [aCoder encodeInt:self.numberOfTouches forKey:kPanGestureNumberOfTouches];
}

- (id)initWithCoder:(NSCoder *)decoder {
  
	if (self = [super init]) {
    
    self.panGesture      = [decoder decodeIntForKey:kPanGestureIsPanGestureKey];
    self.numberOfTouches = [decoder decodeIntForKey:kPanGestureNumberOfTouches];
	}
	
	return self;
}

- (BOOL)isEqualToPanGesture:(PanGesture *)aPanGesture {
  
  if (self == aPanGesture)
    return YES;

  if (panGesture != [aPanGesture panGesture])
    return NO;

  if (numberOfTouches != [aPanGesture numberOfTouches])
    return NO;
  
  return YES;
}

- (BOOL)isEqual:(id)other{
  
  if(other == self)
    return YES;
  
  if(!other || ![other isKindOfClass:[self class]])
    return NO;
  
  return [self isEqualToPanGesture:other];  
}

- (unsigned)hash {
  return panGesture ^ numberOfTouches;
}

- (void)dealloc {
	[super dealloc];
}

@end

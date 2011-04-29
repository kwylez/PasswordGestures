//
//  LongPressGesture.m
//  PasswordGestures
//
//  Created by Cory Wiles on 11/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "LongPressGesture.h"


@implementation LongPressGesture

@synthesize longPressGesture;
@synthesize numberOfSeconds;

- (void)encodeWithCoder:(NSCoder *)aCoder {
  
  [aCoder encodeFloat:self.longPressGesture forKey:kLongPressGestureisLongPressGestureKey];
  [aCoder encodeInt:self.numberOfSeconds forKey:kLongPressGestureNumberOfSecondsKey];
}

- (id)initWithCoder:(NSCoder *)decoder {
  
	if (self = [super init]) {
    
    self.longPressGesture = [decoder decodeFloatForKey:kLongPressGestureisLongPressGestureKey];
    self.numberOfSeconds  = [decoder decodeIntForKey:kLongPressGestureNumberOfSecondsKey];
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
  
  return [self isEqualToLongPressGesture:other];  
}

- (BOOL)isEqualToLongPressGesture:(LongPressGesture *)aLongPressGesture {
  
  if (self == aLongPressGesture)
    return YES;
  
  if (longPressGesture != [aLongPressGesture longPressGesture])
    return NO;
  
  if (numberOfSeconds != [aLongPressGesture numberOfSeconds])
    return NO;
  
  return YES;
}

- (unsigned)hash {
  return longPressGesture ^ numberOfSeconds;
}

@end

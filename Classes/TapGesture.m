//
//  TapGesture.m
//  PasswordGestures
//
//  Created by Cory Wiles on 11/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TapGesture.h"


@implementation TapGesture

@synthesize tapGesture;

- (void)encodeWithCoder:(NSCoder *)aCoder {
  [aCoder encodeInt:self.tapGesture forKey:kTapGestureIsTapGestureKey];
}

- (id)initWithCoder:(NSCoder *)decoder {
  
	if ((self = [super init])) {
    self.tapGesture = [decoder decodeIntForKey:kTapGestureIsTapGestureKey];
	}
	
	return self;
}

- (BOOL)isEqual:(id)other{
  
  if(other == self)
    return YES;
  
  if(!other || ![other isKindOfClass:[self class]])
    return NO;
  
  return [self isEqualToTapGesture:other];  
}

- (BOOL)isEqualToTapGesture:(TapGesture *)aTapGesture {
  
  if (self == aTapGesture)
    return YES;
  
  if (tapGesture != [aTapGesture tapGesture])
    return NO;
  
  return YES;
}

- (unsigned)hash {
  return tapGesture;
}

- (void)dealloc {
	[super dealloc];
}

@end

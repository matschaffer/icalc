//
//  CalculatorController.m
//  icalc
//
//  Created by Mat Schaffer on 2/14/09.
//  Copyright 2009 Mat Schaffer. All rights reserved.
//

#import "CalculatorController.h"


@implementation CalculatorController
- (id) init
{
  if (self = [super init]) {
    calculator = [[Calculator alloc] init];
  }
  return self;
}

- (void) dealloc 
{
  [calculator release];
  [super dealloc];
}

- (NSString *) valueOrEmptyStringAtIndex:(int)index {
  if ([calculator valueAtIndex:index]) {
    return [[calculator valueAtIndex:index] stringValue];
  } else {
    return @"";
  }
}

- (void) display
{
  [reg3Field setStringValue:[self valueOrEmptyStringAtIndex:2]];    
  [reg2Field setStringValue:[self valueOrEmptyStringAtIndex:1]];    
  [reg1Field setStringValue:[self valueOrEmptyStringAtIndex:0]];    
  [reg0Field setStringValue:@""];
}

-(void)appendToMain:(NSString*)character {
	NSString* currentValue = [reg0Field	stringValue];
	NSString* newValue = [currentValue stringByAppendingString:character];
	[reg0Field setStringValue:newValue];
}

-(IBAction)sendPeriod:(NSButton*)sender {
	NSString* currentValue = [reg0Field stringValue];
  
	if ([currentValue length] == 0) {
		[reg0Field setStringValue:@"0."];
	} else if ([currentValue rangeOfString:@"."].location == NSNotFound) {
		[self appendToMain:@"."];
	}
}

-(IBAction)sendNumber:(NSButton*)sender {
  NSLog(@"Got a number: %@", [sender title]);
	[self appendToMain:[sender title]];
}

-(IBAction)enter:(NSButton*)sender 
{
  if ([[reg0Field stringValue] length] > 0) {
    NSNumber * val = [[NSNumber alloc] initWithDouble:[reg0Field doubleValue]];
    NSLog(@"Pushing %@ into calculator", val);
    [calculator push:val];
    NSLog(@"Calculator's bottom register is now %@", [calculator firstValue]);
    [val release];
    [self display]; 
  }
}


-(IBAction)clear:(NSButton*)sender {
//	if ([[reg0Field stringValue] length] > 0) {
//		[reg0Field setStringValue:@"."];
//	} else {
//		[self pushDown];
//	}
}

-(IBAction)doAddition:(NSButton*)sender {
  [self enter:nil];
  [calculator sum];
  [self display];
}

-(IBAction)doSubtraction:(NSButton*)sender {
  [self enter:nil];
  [calculator difference];
  [self display];
}

-(IBAction)doMultiplication:(NSButton*)sender {
  [self enter:nil];
  [calculator product];
  [self display];
}

-(IBAction)doDivision:(NSButton*)sender {
  [self enter:nil];
  [calculator ratio];
  [self display];
}

@end

//
//  Calculator.m
//  icalc
//
//  Created by Mat Schaffer on 12/9/08.
//  Copyright 2008 Mat Schaffer. All rights reserved.
//

#import "Calculator.h"


@implementation Calculator

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
	[self appendToMain:[sender title]];
}

-(IBAction)enter:(NSButton*)sender {
	[reg3Field setStringValue:[reg2Field stringValue]];
	[reg2Field setStringValue:[reg1Field stringValue]];
	[reg1Field setStringValue:[reg0Field stringValue]];
	[reg0Field setStringValue:@""];
}

-(void)getOperands {
	op1 = [reg0Field floatValue];
	op2 = [reg0Field floatValue];
}

-(void)setAccumulator:(float)value {
	[reg0Field setFloatValue:value];
}

-(void)pushDown {
	[reg1Field setStringValue:[reg2Field stringValue]];	
	[reg2Field setStringValue:[reg3Field stringValue]];
	[reg3Field setStringValue:@""];
}

-(IBAction)clear:(NSButton*)sender {
	if ([[reg0Field stringValue] length] > 0) {
		[reg0Field setStringValue:@"."];
	} else {
		[self pushDown];
	}
}

-(IBAction)doAddition:(NSButton*)sender {
	[self getOperands];
	[self setAccumulator:(op1 + op2)];
	[self pushDown];
}

-(IBAction)doSubtraction:(NSButton*)sender {
	[self getOperands];
	[self setAccumulator:(op1 - op2)];
	[self pushDown];
}

-(IBAction)doMultiplication:(NSButton*)sender {
	[self getOperands];
	[self setAccumulator:(op1 * op2)];
	[self pushDown];
}

-(IBAction)doDivision:(NSButton*)sender {
	[self getOperands];
	[self setAccumulator:(op1 / op2)];
	[self pushDown];
}

@end

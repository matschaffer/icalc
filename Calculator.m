//
//  Calculator.m
//  icalc
//
//  Created by Mat Schaffer on 12/9/08.
//  Copyright 2008 Mat Schaffer. All rights reserved.
//

#import "Calculator.h"


@implementation Calculator

@synthesize firstOperator, secondOperator;

- (void)dealloc
{
  [registers release];
  [firstOperator release];
  [secondOperator release];
  [super dealloc];
}

- (id)init
{
  if (self = [super init]) {
    registers = [[NSMutableArray alloc] init];
  }
  return self;
}

- (void)push:(NSNumber *)value
{
  [registers addObject:value];
}

- (NSNumber *)firstValue;
{
  return [registers lastObject];
}

- (NSNumber *)valueAtIndex:(int)index
{
  int size = [registers count];
  int indexToRetrieved = size - 1 - index;
  
  if (indexToRetrieved >= 0 && indexToRetrieved < size) {
    return [registers objectAtIndex:indexToRetrieved];
  } else {
    return nil;
  }
}

- (BOOL)popOneOperator
{
  int size = [registers count];
  if (size >= 1) {
    self.firstOperator = [registers objectAtIndex:size-1];
    [registers removeLastObject];
    return YES;
  } else {
    return NO;
  }  
}

- (BOOL)popTwoOperators
{
  int size = [registers count];
  if (size >= 2) {
    self.firstOperator  = [registers objectAtIndex:size-2];
    self.secondOperator = [registers objectAtIndex:size-1];
    [registers removeLastObject];
    [registers removeLastObject];
    return YES;
  } else {
    return NO;
  }
}

- (void)sum
{
  if ([self popTwoOperators]) {
    NSNumber * result = [[NSNumber alloc] initWithDouble:[firstOperator doubleValue] + [secondOperator doubleValue]];
    [self push:result];
    [result release];
  }
}

- (void)difference
{
  if ([self popTwoOperators]) {
    NSNumber * result = [[NSNumber alloc] initWithDouble:[firstOperator doubleValue] - [secondOperator doubleValue]];
    [self push:result];
    [result release];
  }
}

- (void)product
{
  if ([self popTwoOperators]) {
    NSNumber * result = [[NSNumber alloc] initWithDouble:[firstOperator doubleValue] * [secondOperator doubleValue]];
    [self push:result];
    [result release];
  }
}

- (void)ratio
{
  if ([self popTwoOperators]) {
    NSNumber * result = [[NSNumber alloc] initWithDouble:[firstOperator doubleValue] / [secondOperator doubleValue]];
    [self push:result];
    [result release];
  }
}

- (void)sin
{
  if ([self popOneOperator]) {
    [registers addObject:firstOperator];
  }
}

@end

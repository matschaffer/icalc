//
//  CalculatorTest.m
//  icalc
//
//  Created by Mat Schaffer on 2/21/09.
//  Copyright 2009 Mat Schaffer. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "Calculator.h"

@interface CalculatorTest : SenTestCase {
  Calculator * calculator;
}

@end

@implementation CalculatorTest
- (void)setUp
{
  calculator = [Calculator new];
}

- (void)tearDown
{
  [calculator release];
}

- (void)testShouldAdd
{
  [calculator push:[[NSNumber alloc] initWithInt:1]];
  [calculator push:[[NSNumber alloc] initWithInt:1]];
  
  [calculator sum];
  
  STAssertEquals(2, [[calculator firstValue] intValue], nil);
}

- (void)testShouldSubtractInOrder 
{
  [calculator push:[[NSNumber alloc] initWithInt:2]];
  [calculator push:[[NSNumber alloc] initWithInt:4]];
  
  [calculator difference];
  
  STAssertEquals(-2, [[calculator firstValue] intValue], nil);
}

- (void)testShouldDisplayRegistersInReverse
{
  [calculator push:[[NSNumber alloc] initWithInt:2]];
  [calculator push:[[NSNumber alloc] initWithInt:4]];
  
  STAssertEquals(4, [[calculator valueAtIndex:0] intValue], nil);
  STAssertEquals(2, [[calculator valueAtIndex:1] intValue], nil);  
}

- (void)testShouldReturnNilWhenUnusedRegistersAreAccessed
{
  STAssertNil([calculator valueAtIndex:0], nil);
}

- (void)testCanDropFirstValue
{
  [calculator push:[[NSNumber alloc] initWithInt:2]];
  [calculator push:[[NSNumber alloc] initWithInt:4]];

  [calculator pop];

  STAssertEquals(2, [[calculator valueAtIndex:0] intValue], nil);
}


@end

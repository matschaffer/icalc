//
//  Calculator.h
//  icalc
//
//  Created by Mat Schaffer on 12/9/08.
//  Copyright 2008 Mat Schaffer. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Calculator : NSObject {
  NSMutableArray * registers;
  NSNumber * firstOperator;
  NSNumber * secondOperator;
}

@property(retain) NSNumber * firstOperator;
@property(retain) NSNumber * secondOperator;

- (void) push:(NSNumber *)value;

- (NSNumber *) firstValue;
- (NSNumber *) valueAtIndex:(int) index;

- (void) sum;
- (void) difference;
- (void) product;
- (void) ratio;

@end

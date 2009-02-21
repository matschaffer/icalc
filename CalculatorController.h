//
//  CalculatorController.h
//  icalc
//
//  Created by Mat Schaffer on 2/14/09.
//  Copyright 2009 Mat Schaffer. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Calculator.h"

@interface CalculatorController : NSObject {
  Calculator *calculator;
  
  IBOutlet NSTextField *reg0Field;
  IBOutlet NSTextField *reg1Field;
  IBOutlet NSTextField *reg2Field;
  IBOutlet NSTextField *reg3Field;
}

- (IBAction)sendPeriod:(NSButton*)sender;
- (IBAction)sendNumber:(NSButton*)sender;
- (IBAction)enter:(NSButton*)sender;
- (IBAction)clear:(NSButton*)sender;
- (IBAction)doAddition:(NSButton*)sender;
- (IBAction)doSubtraction:(NSButton*)sender;
- (IBAction)doMultiplication:(NSButton*)sender;
- (IBAction)doDivision:(NSButton*)sender;

@end

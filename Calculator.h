//
//  Calculator.h
//  icalc
//
//  Created by Mat Schaffer on 12/9/08.
//  Copyright 2008 Mat Schaffer. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Calculator : NSObject {
	IBOutlet NSTextField *reg0Field;
	IBOutlet NSTextField *reg1Field;
	IBOutlet NSTextField *reg2Field;
	IBOutlet NSTextField *reg3Field;
	float op1, op2;
}

-(IBAction)sendPeriod:(NSButton*)sender;
-(IBAction)sendNumber:(NSButton*)sender;
-(IBAction)enter:(NSButton*)sender;
-(IBAction)clear:(NSButton*)sender;
-(IBAction)doAddition:(NSButton*)sender;
-(IBAction)doSubtraction:(NSButton*)sender;
-(IBAction)doMultiplication:(NSButton*)sender;
-(IBAction)doDivision:(NSButton*)sender;

@end

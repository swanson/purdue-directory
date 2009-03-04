//
//  Person.m
//  Purdue Dir
//
//  Created by matt on 3/3/09.
//  Copyright 2009 M$. All rights reserved.
//

#import "Person.h"



@implementation Person

@synthesize name;
@synthesize phone;
@synthesize email;
@synthesize addr;
@synthesize univ;

-(void)dealloc {
	[name release];
	[phone release];
	[email release];
	[addr release];
	[univ release];
	[super dealloc];
}
@end

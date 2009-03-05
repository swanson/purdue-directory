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

- (id) init {
	if(self = [super init])
	{
		name = @"testing";
		phone = @"123";
		email = @"testing@test";
		addr = @"123 test";
		univ = @"engr";
	}
	return self;
}


-(void)dealloc {
	[name release];
	[phone release];
	[email release];
	[addr release];
	[univ release];
	[super dealloc];
}
@end

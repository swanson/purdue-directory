//
//  Person.h
//  Purdue Dir
//
//  Created by matt on 3/3/09.
//  Copyright 2009 M$. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Person : NSObject {
	NSString *name;
	NSString *phone;
	NSString *email;
	NSString *addr;
	NSString *univ;
}

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *phone;
@property (nonatomic, retain) NSString *email;
@property (nonatomic, retain) NSString *addr;
@property (nonatomic, retain) NSString *univ;

@end

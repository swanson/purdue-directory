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

- (id) init;

@property (nonatomic, getter=getName, copy) NSString *name;
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *addr;
@property (nonatomic, copy) NSString *univ;

@end

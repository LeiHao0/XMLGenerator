//
//  XMLDeclaration.h
//  XML
//
//  Created by artwalk on 9/16/14.
//  Copyright (c) 2014 artwalk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMLDeclaration : NSObject

- (id)initWithVersion:(NSString *)version encoding:(NSString *)encoding;

- (NSString *)formattedXMLDeclaration;

@end

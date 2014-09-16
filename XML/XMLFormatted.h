//
//  XMLFormatted.h
//  XML
//
//  Created by artwalk on 9/16/14.
//  Copyright (c) 2014 artwalk. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Node;
@class XMLDeclaration;

@interface XMLFormatted : NSObject

- (id)initWithDeclaration:(XMLDeclaration *)declaration rootNode:(Node *)rootNode;

@end

//
//  Node.h
//  XML
//
//  Created by artwalk on 9/16/14.
//  Copyright (c) 2014 artwalk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject

- (id)initWithTag:(NSString *)tag;
- (id)initWithTag:(NSString *)tag elemnet:(NSString *)elemnet;
- (id)initWithTag:(NSString *)tag attribute:(NSDictionary *)attribute;
- (id)initWithTag:(NSString *)tag attribute:(NSDictionary *)attribute elemnet:(NSString *)elemnet;

- (void)addChildNode:(Node *) childNode;
- (void)delChildNode:(Node *) childNode;
- (Node *)getParentNode;

- (NSString *)formattedSelf;

@end

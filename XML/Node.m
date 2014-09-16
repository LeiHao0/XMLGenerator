//
//  Node.m
//  XML
//
//  Created by artwalk on 9/16/14.
//  Copyright (c) 2014 artwalk. All rights reserved.
//

#import "Node.h"

@interface Node ()

// XML
@property (nonatomic, strong) NSString* tag;
@property (nonatomic, strong) NSDictionary* attribute;
@property (nonatomic, strong) NSString* element;


@property (nonatomic, strong) Node* parentNode;

// current node's children
@property (nonatomic, strong) NSMutableArray* childrenNodes;

@end

@implementation Node

#pragma mark - init

- (id) init {
    NSAssert(false, @"You should use [initWithTag:xxx] which declared in Node.h file to init");
    return nil;
}

- (id)initWithTag:(NSString *)tag {
    return [[Node alloc] initWithTag:tag attribute:nil elemnet:nil];
}

- (id)initWithTag:(NSString *)tag elemnet:(NSString *)elemnet {
    return [[Node alloc] initWithTag:tag attribute:nil elemnet:elemnet];
}

- (id)initWithTag:(NSString *)tag attribute:(NSDictionary *)attribute {
    return [[Node alloc] initWithTag:tag attribute:attribute elemnet:nil];
}

- (id)initWithTag:(NSString *)tag attribute:(NSDictionary *)attribute elemnet:(NSString *)elemnet {
    self = [super init];
    
    _tag = tag;
    _attribute = attribute;
    _element = elemnet;
    
    return self;
}

#pragma mark - NodeOperate
- (void)delChildNode:(Node *) childNode {
    childNode.parentNode = nil;
    [_childrenNodes removeObject:childNode];
}

- (void)addChildNode:(Node *) childNode {
    if (_childrenNodes == nil) {
        _childrenNodes = [[NSMutableArray alloc] initWithCapacity:5];
    }
    
    [_childrenNodes addObject:childNode];
    childNode.parentNode = self;
}

- (Node *)getParentNode {
    return _parentNode;
}

#pragma mark - formatted

- (NSString *)formattedSelf {
    NSString *fmtAttr = [self formattedAttribute];
    NSString *fmtElement = [self formattedElement];
    NSString *s = [NSString stringWithFormat:@"<%@%@>%@", self.tag, fmtAttr, fmtElement];
    
    return s;
}

- (NSString *)formattedAttribute {
    if (self.attribute == nil) {
        return @"";
    }
    NSArray *array = [self.attribute allKeys];
    NSString *key = [array objectAtIndex:0];
    NSString *s = [NSString stringWithFormat:@" %@=\"%@\"",key, [self.attribute valueForKey:key]];
    
    return s;
}

- (NSString *)formattedElement {
    NSString *s;
    // BFS
    if (self.childrenNodes != nil) {
        s = @"\n";
        for (Node* node in self.childrenNodes) {
            s = [NSString stringWithFormat:@"%@%@\n",s, node.formattedSelf];
        }
        s = [NSString stringWithFormat:@"%@</%@>", s, self.tag];
    } else {
        NSString *element = self.element == nil ? @"":self.element;
        s = [NSString stringWithFormat:@"%@</%@>", element, self.tag];
    }
    
    return s;
}



@end

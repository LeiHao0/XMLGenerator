//
//  XMLFormatted.m
//  XML
//
//  Created by artwalk on 9/16/14.
//  Copyright (c) 2014 artwalk. All rights reserved.
//

#import "XMLFormatted.h"
#import "XMLDeclaration.h"
#import "Node.h"

@interface XMLFormatted ()

@property (nonatomic, strong) Node * root;
@property (nonatomic, strong) XMLDeclaration *xmlDeclaration;

@end

@implementation XMLFormatted

- (id)initWithDeclaration:(XMLDeclaration *)declaration rootNode:(Node *)rootNode {
    self = [super init];
    
    _xmlDeclaration = declaration;
    _root = rootNode;
    
    return self;
}

- (NSString *)description {
    if (_xmlDeclaration == nil || _root == nil) {
        return @"";
    }
    
    return [NSString stringWithFormat:@"%@%@", _xmlDeclaration.formattedXMLDeclaration, _root.formattedSelf];
}

@end

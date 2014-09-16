//
//  XMLDeclaration.m
//  XML
//
//  Created by artwalk on 9/16/14.
//  Copyright (c) 2014 artwalk. All rights reserved.
//

#import "XMLDeclaration.h"

@interface XMLDeclaration ()

@property (nonatomic, strong) NSString *version;
@property (nonatomic, strong) NSString *encoding;

@end

@implementation XMLDeclaration

- (id) init {
    NSAssert(false, @"You should init XMLDeclaration with the func [initWithVersion:encoding] below");
    return nil;
}

- (id)initWithVersion:(NSString *)version encoding:(NSString *)encoding {
    self = [super init];
    if (self != nil) {
        _version = version;
        _encoding = encoding;
    }
    
    return self;
}

- (NSString *)formattedXMLDeclaration {
    if (self.version == nil || self.encoding == nil) {
        return @"";
    } else {
        // example: <?xml version="1.0" encoding="UTF-8"?>
        return [NSString stringWithFormat:@"<?xml version=\"%@\" encoding=\"%@\"?>\n", self.version, self.encoding];
    }
}

@end

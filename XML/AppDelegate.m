//
//  AppDelegate.m
//  XML
//
//  Created by artwalk on 9/16/14.
//  Copyright (c) 2014 artwalk. All rights reserved.
//

#import "AppDelegate.h"
#import "XMLFormatted.h"
#import "Node.h"
#import "XMLDeclaration.h"


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    XMLDeclaration *xmlDeclaration = [[XMLDeclaration alloc] initWithVersion:@"1.0" encoding:@"UTF-8"];
    
    Node *categoryList  = [[Node alloc] initWithTag:@"CategoryList"];
    
    Node *category = [[Node alloc] initWithTag:@"category" attribute:@{@"ID": @"01"}];
    [categoryList addChildNode:category];
    
    Node *mainCategory = [[Node alloc] initWithTag:@"mainCategory" elemnet:@"XML"];
    [category addChildNode:mainCategory];
    
    Node *description = [[Node alloc] initWithTag:@"description" elemnet:@"This is a list my XML articles."];
    [category addChildNode:description];
    
    Node *active = [[Node alloc] initWithTag:@"active" elemnet:@"true"];
    [category addChildNode:active];
    
    
    XMLFormatted *textXML = [[XMLFormatted alloc] init];
    NSLog(@"%@", textXML);
    
    textXML = [[XMLFormatted alloc] initWithDeclaration:xmlDeclaration rootNode:categoryList];
    NSLog(@"%@", textXML);
    
    return YES;
}


@end

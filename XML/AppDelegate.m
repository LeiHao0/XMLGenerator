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
    
    /*
     // set version & encoding
     XMLDeclaration *xmlDeclaration = [[XMLDeclaration alloc] initWithVersion:@"1.0" encoding:@"BG2312"];
     
     Node *root = [[Node alloc] initWithTag:@"body"];
     Node *imageNode = [[Node alloc] initWithTag:@"img" attribute:@{@"src":@"./img/xxx.png"}];
     // add child node
     [root addChildNode:imageNode];
     
     // print all descendant nodes
     NSLog(@"%@", root.formattedSelf);
     
     // del child node
     [root delChildNode:imageNode];
     
     // get parent node
     [imageNode getParentNode];
     
     // get all children nodes
     [root getChildrenNodes];
     */
    
    return YES;
}


@end

//
//  XMLTests.m
//  XMLTests
//
//  Created by artwalk on 9/16/14.
//  Copyright (c) 2014 artwalk. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "XMLFormatted.h"
#import "Node.h"
#import "XMLDeclaration.h"

@interface XMLTests : XCTestCase

@end

@implementation XMLTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testNodeExist {
    XCTAssertNotNil([Node class], @"Node class should exist.");
}

- (void)testNodeInit {
    XCTAssertThrows([[Node alloc] init], @"Node can't be init");
    XCTAssertThrows([[XMLDeclaration alloc] init], @"Node can't be init");
}

- (void)testNodeCanBeCreated {
    Node *node = [[Node alloc] initWithTag:@"test"];
    XCTAssertNotNil(node, @"Node object can be created.");
}

- (void)testNodeAddandDelChildrenNodes {
    Node *root = [[Node alloc] initWithTag:@"root"];
    Node *node1 = [[Node alloc] initWithTag:@"node1"];
    Node *node2 = [[Node alloc] initWithTag:@"node1"];
    Node *node3 = [[Node alloc] initWithTag:@"node1"];
    
    [root addChildNode:node1];
    [root addChildNode:node2];
    [root addChildNode:node3];
    
    XCTAssertEqual(3, root.getChildrenNodes.count, @"root should has 3 nodes.");
    
    [root delChildNode:node2];
    XCTAssertEqual(2, root.getChildrenNodes.count, @"root should has 2 nodes.");
    
}

- (void)testNodeParent {
    Node *root = [[Node alloc] initWithTag:@"root"];
    Node *node = [[Node alloc] initWithTag:@"node"];
    [root addChildNode:node];
    
    XCTAssertEqualObjects(root, node.getParentNode, @"node's parent should be root");
}

- (void)testCategoryList  {
    NSString *originalXML = @"<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<CategoryList>\n<Category ID=\"01\">\n<MainCategory>XML</MainCategory>\n<Description>This is a list my XML articles.</Description>\n<Active>true</Active>\n</Category>\n</CategoryList>";
    
    
    XMLDeclaration *xmlDeclaration = [[XMLDeclaration alloc] initWithVersion:@"1.0" encoding:@"UTF-8"];
    
    Node *categoryList  = [[Node alloc] initWithTag:@"CategoryList"];
    
    Node *category = [[Node alloc] initWithTag:@"Category" attribute:@{@"ID": @"01"}];
    // add childNode
    [categoryList addChildNode:category];
    
    Node *mainCategory = [[Node alloc] initWithTag:@"MainCategory" elemnet:@"XML"];
    [category addChildNode:mainCategory];
    
    Node *description = [[Node alloc] initWithTag:@"Description" elemnet:@"This is a list my XML articles."];
    [category addChildNode:description];
    
    Node *active = [[Node alloc] initWithTag:@"Active" elemnet:@"true"];
    [category addChildNode:active];
    
    XMLFormatted *testXML = [[XMLFormatted alloc] initWithDeclaration:xmlDeclaration rootNode:categoryList];
    NSString *testXMLString = testXML.description;
    
    XCTAssertTrue([originalXML isEqualToString:testXMLString], @"If OK, do not forget to sent Email");
    
}

@end

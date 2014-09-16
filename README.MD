##USAGE

```objc
example：

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

```

##Test
All test units are in the XMLTests.m file
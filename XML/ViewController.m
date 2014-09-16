//
//  ViewController.m
//  XML
//
//  Created by artwalk on 9/17/14.
//  Copyright (c) 2014 artwalk. All rights reserved.
//

#import "ViewController.h"
#import "XMLFormatted.h"
#import "Node.h"
#import "XMLDeclaration.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
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

    self.textView.text = testXML.description;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

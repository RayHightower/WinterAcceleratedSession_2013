//
//  ViewController.m
//  MMDelegation
//
//  Created by Don Bora on 1/14/13.
//  Copyright (c) 2013 Don Bora. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()
{
    IBOutlet UIWebView* webView;
    IBOutlet UIActivityIndicatorView* activityView;
    SecondViewController* secondViewController;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.pepsi.com"]]];
    webView.delegate = self;
    //secondViewController = [[SecondViewController alloc] initWithNibName:nil bundle:nil];
    
    //secondViewController.delegate = self;
    
    ///[self.view addSubview:secondViewController.view];
    //secondViewController.view.center = CGPointMake/(secondViewController.view.center.x + 100, secondViewController.view.center.y);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark ColorChageDelegate

-(void)changeColor
{
    self.view.backgroundColor = [UIColor blueColor];
}

#pragma mark UIWebViewDelegate

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [activityView stopAnimating];
}
@end





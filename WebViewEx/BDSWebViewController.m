//
//  BDSWebViewController.m
//  WebViewEx
//
//  Created by Mr.Don't Ask on 4/1/14.
//  Copyright (c) 2014 Mr.Don't Ask. All rights reserved.
//

#import "BDSWebViewController.h"

@interface BDSWebViewController ()

@end

@implementation BDSWebViewController

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
    UIWebView *_webview = self.webView;
    [_webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://batdongsan.com.vn"]]];
    //_webview.scalesPageToFit = YES;
    //_webview.autoresizesSubviews = YES;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

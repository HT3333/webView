//
//  BDSWebCallViewController.h
//  WebViewEx
//
//  Created by Mr.Don't Ask on 4/2/14.
//  Copyright (c) 2014 Mr.Don't Ask. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MFMessageComposeViewController.h>
#import <AddressBook/AddressBook.h>
#import <UIKit/UIWebView.h>


@interface BDSWebCallViewController : UIViewController<UIWebViewDelegate,NSObject,MFMessageComposeViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

-(IBAction)btnMesClick:(id)sender;
-(IBAction)btnCallClick:(id)sender;
-(IBAction)btnSaveClick:(id)sender;

@end



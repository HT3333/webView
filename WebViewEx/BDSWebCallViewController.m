//
//  BDSWebCallViewController.m
//  WebViewEx
//
//  Created by Mr.Don't Ask on 4/2/14.
//  Copyright (c) 2014 Mr.Don't Ask. All rights reserved.
//

#import "BDSWebCallViewController.h"
#import "tmpClass.h"

@interface BDSWebCallViewController ()


@end

@implementation BDSWebCallViewController

@synthesize webView;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.webView.delegate = self;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"WebCall" ofType:@"html"] isDirectory:NO]]];
    
        //[self performSelector:@selector(webToNativeCall)];
    webView.delegate = self;
    
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSLog(@"Goi request: %@",request);
    if ([[[request URL] absoluteString] hasPrefix:@"js-call:"]) {
        NSString *requestString = [[request URL] absoluteString];
        // Extract the selector name from the URL
        NSArray *components = [requestString componentsSeparatedByString:@":"];
        NSString *function = [components objectAtIndex:1];
        
        // Call the given selector
        //[self performSelector:NSSelectorFromString(function)];
        
        void (^selectedCase)() = @{
                                   @"webToNativeCall" : ^{
                                       NSLog(@"webToNativeCall");
                                       [self performSelector:@selector(webToNativeCall)];
                                   },
                                   @"anothorFunc" : ^{
                                       NSLog(@"anothorFunc");
                                   },
                                   @"anothorFunc2" : ^{
                                       NSLog(@"anothorFunc2");
                                   },
                                   }[function];
        
        if (selectedCase != nil)
            selectedCase();
        
        return NO;
    }
    return YES;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    
}


-(void)webToNativeCall{
    NSString *tmpStr = [NSString stringWithFormat:@"Quan Vu Quan Vu Quan Vu"];
    NSLog(@"%@",tmpStr);
}


-(void)SendMessage:(NSArray*)receipt{
    [self sendSMS:@"Body of SMS..." recipientList:receipt];

    //[self sendSMS:@"Body of SMS..." recipientList:[NSArray arrayWithObjects:@"+1-111-222-3333", @"111-333-4444", nil]];
}


-(void)makePhoneCall:(NSString*)phoneNum{
    NSString *phoneNumber = [@"telprompt://" stringByAppendingString:phoneNum];
     //NSLog(@"making call with %@",phoneNumber);
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
}


-(void)SaveContact:(NSString*)phoneNum{
    CFErrorRef *error = NULL;
    ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, error); // create address book record
    ABRecordRef person = ABPersonCreate(); // create a person
    
    NSString *phone = phoneNum; // the phone number to add
    
    //Phone number is a list of phone number, so create a multivalue
    ABMutableMultiValueRef phoneNumberMultiValue =
    ABMultiValueCreateMutable(kABPersonPhoneProperty);
    ABMultiValueAddValueAndLabel(phoneNumberMultiValue ,CFBridgingRetain(phone),kABPersonPhoneMobileLabel, NULL);
    
    ABRecordSetValue(person, kABPersonFirstNameProperty, @"FirstName" , nil); // first name of the new person
    ABRecordSetValue(person, kABPersonLastNameProperty, @"LastName", nil); // his last name
    
    ABRecordSetValue(person, kABPersonPhoneProperty, phoneNumberMultiValue,nil); // set the phone number property
    ABAddressBookAddRecord(addressBook, person, nil); //add the new person to the record
    
    ABRecordRef group = ABGroupCreate(); //create a group
    ABRecordSetValue(group, kABGroupNameProperty,@"My Group", nil); // set group's name
    ABGroupAddMember(group, person, nil); // add the person to the group
    ABAddressBookAddRecord(addressBook, group, nil); // add the group
    
    CFErrorRef *anError = NULL;
    
    
    bool tmp = ABAddressBookSave(addressBook, anError);
    if(tmp== TRUE){
        NSLog(@"save contact successfully");
    }; //save the record
    
    CFRelease(person);
}


- (void)sendSMS:(NSString *)bodyOfMessage recipientList:(NSArray *)recipients
{
    MFMessageComposeViewController *controller = [[MFMessageComposeViewController alloc] init] ;
    
    if([MFMessageComposeViewController canSendText])
    {
        controller.body = bodyOfMessage;
        controller.recipients = recipients;
        controller.messageComposeDelegate = self;
    }
}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    
    if (result == MessageComposeResultCancelled)
        NSLog(@"Message cancelled");
        else if (result == MessageComposeResultSent)
            NSLog(@"Message sent");
            else
                NSLog(@"Message failed");
                }


-(void)testFunc{
    NSString *tmpStr = [NSString stringWithFormat:@"Quan Vu Quan Vu Quan Vu"];
    NSLog(@"%@",tmpStr);

}




-(IBAction)btnCallClick:(id)sender{
    //[self makePhoneCall:@"0909090909"];
    
    [self.webView stringByEvaluatingJavaScriptFromString: @"Sms()" ];
    //tmpClass *tmpClass;
    
    //id win = [webView windowScriptObject];
    //[win setValue:tmpClass forKey:@"AddressBook"];
}


-(IBAction)btnMesClick:(id)sender{
    NSArray *arr  = [NSArray arrayWithObjects:@"0909090909",@"0303030303", nil];
    [self SendMessage:arr];
}


-(IBAction)btnSaveClick:(id)sender{
    [self SaveContact:@"0909090909"];
}




@end

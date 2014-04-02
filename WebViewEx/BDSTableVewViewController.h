//
//  BDSTableVewViewController.h
//  WebViewEx
//
//  Created by Mr.Don't Ask on 4/1/14.
//  Copyright (c) 2014 Mr.Don't Ask. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BDSTableVewViewController : UITableViewController
    @property (weak) IBOutlet UISearchBar *searchBar;
    @property (weak) IBOutlet UIBarButtonItem *searchButton;
-(IBAction) btnSearchClick :(id)sender;
-(IBAction) searchBarSearchButtonClicked:(id)sender;
@end

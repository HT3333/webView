
//
//  BDSTableVewViewController.m
//  WebViewEx
//
//  Created by Mr.Don't Ask on 4/1/14.
//  Copyright (c) 2014 Mr.Don't Ask. All rights reserved.
//

#import "BDSTableVewViewController.h"

@interface BDSTableVewViewController ()

@end

@implementation BDSTableVewViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.searchBar.hidden = YES;
    [UIView animateWithDuration:0.1 animations:^{
        self.tableView.contentOffset = CGPointMake(0, 44);
        self.tableView.contentInset = UIEdgeInsetsMake(-44, 0, 0, 0);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{   // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

-(IBAction)btnSearchClick:(id)sender{
    self.searchBar.hidden = NO;
    [UIView animateWithDuration:1 animations:^{
        self.tableView.contentOffset = CGPointMake(0, -64);
        self.tableView.contentInset = UIEdgeInsetsMake(+64	, 0, 0, 0);
    }];
}

- (IBAction)searchBarSearchButtonClicked:(id)sender {
    self.searchBar.text=@"";
    self.searchBar.hidden = YES;
    [UIView animateWithDuration:1 animations:^{
        self.tableView.contentOffset = CGPointMake(0, 44);
        self.tableView.contentInset = UIEdgeInsetsMake(-44, 0, 0, 0);
    }];
}


@end

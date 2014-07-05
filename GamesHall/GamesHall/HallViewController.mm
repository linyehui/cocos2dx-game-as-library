//
//  HallViewController.m
//  GamesHall
//
//  Created by linyehui on 14-7-5.
//  Copyright (c) 2014年 linyehui. All rights reserved.
//

#import "HallViewController.h"
#import "hellocpp/RootViewController.h"
#import "simplegame/SimpleGameRootViewController.h"

@interface HallViewController ()

@end

@implementation HallViewController

@synthesize rootViewController = _rootViewController;
@synthesize smrootViewController = _smrootViewController;

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showCocosRootView:(id)arg
{
    if (_rootViewController == nil) {
        self.rootViewController = [[[RootViewController alloc] initWithNibName:nil bundle:nil] autorelease];
    }
    
    [self.navigationController pushViewController:_rootViewController animated:YES];
}

- (void)showCocosRootView2:(id)arg
{
    if (_smrootViewController == nil) {
        self.smrootViewController = [[[SimpleGameRootViewController alloc] initWithNibName:nil bundle:nil] autorelease];
    }
    
    [self.navigationController pushViewController:_smrootViewController animated:YES];
}

- (IBAction)startGameTapped:(id)sender
{
    [self showCocosRootView:nil];
}

- (IBAction)startGameTapped2:(id)sender
{
    [self showCocosRootView2:nil];
}

- (void)dealloc
{
    [_rootViewController release];
    _rootViewController = nil;
    
    [_smrootViewController release];
    _smrootViewController = nil;
    
    [super dealloc];
}

@end

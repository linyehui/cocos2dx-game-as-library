//
//  MainMenuViewController.m
//  HelloCpp
//
//  Created by linyehui on 14-7-4.
//
//

#import "MainMenuViewController.h"

@interface MainMenuViewController ()

@end

@implementation MainMenuViewController

@synthesize rootViewController = _rootViewController;

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

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)showCocosRootView:(id)arg
{
    if (_rootViewController == nil) {
        self.rootViewController = [[[RootViewController alloc] initWithNibName:nil bundle:nil] autorelease];
    }
    
    [self.navigationController pushViewController:_rootViewController animated:YES];
}

- (IBAction)viewTapped:(id)sender
{
    [self showCocosRootView:nil];
}

- (void)dealloc
{
    [_rootViewController release];
    _rootViewController = nil;
    [super dealloc];
}
@end

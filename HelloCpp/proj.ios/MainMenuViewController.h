//
//  MainMenuViewController.h
//  HelloCpp
//
//  Created by linyehui on 14-7-4.
//
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"

@interface MainMenuViewController : UIViewController
{
    RootViewController *_rootViewController;
}

@property (retain) IBOutlet RootViewController *rootViewController;

- (void)showCocosRootView:(id)arg;
- (IBAction)viewTapped:(id)sender;

@end

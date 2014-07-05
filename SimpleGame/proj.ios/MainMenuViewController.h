//
//  MainMenuViewController.h
//  HelloCpp
//
//  Created by linyehui on 14-7-4.
//
//

#import <UIKit/UIKit.h>
#import "SimpleGameRootViewController.h"

@interface MainMenuViewController : UIViewController
{
    SimpleGameRootViewController *_rootViewController;
}

@property (retain) IBOutlet SimpleGameRootViewController *rootViewController;

- (void)showCocosRootView:(id)arg;
- (IBAction)viewTapped:(id)sender;

@end

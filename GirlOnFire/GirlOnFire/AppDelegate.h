//
//  AppDelegate.h
//  GirlOnFire
//
//  Created by Ahmed Sadiq on 18/02/2016.
//  Copyright © 2016 TxLabz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SYWaveformPlayerView.h"

@class ViewController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) SYWaveformPlayerView *playerView;
@property (strong, nonatomic) UIWindow *window;
@property ( strong , nonatomic ) UINavigationController *navigationController;
@property ( strong , nonatomic ) UIViewController *viewController;


@end


//
//  AudioPlayer.h
//  GirlOnFire
//
//  Created by Ahmed Sadiq on 19/02/2016.
//  Copyright © 2016 TxLabz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@interface AudioPlayer : UIViewController {
    NSTimer *timer;
    AppDelegate *del;
}
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndc;
@property (weak, nonatomic) IBOutlet UIView *overlay;

@property (weak, nonatomic) IBOutlet UIView *playerView;
@end

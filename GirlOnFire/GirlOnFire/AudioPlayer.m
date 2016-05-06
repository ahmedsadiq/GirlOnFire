//
//  AudioPlayer.m
//  GirlOnFire
//
//  Created by Ahmed Sadiq on 19/02/2016.
//  Copyright © 2016 TxLabz. All rights reserved.
//

#import "AudioPlayer.h"
#import "SYWaveformPlayerView.h"


@interface AudioPlayer ()

@end

@implementation AudioPlayer

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    del = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    
    
    if(del.playerView) {
        [del.playerView stopPlayer];
        [del.playerView removeFromSuperview];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btn1Pressed:(id)sender {
    
    SYWaveformPlayerView *pView = (SYWaveformPlayerView*) [self.playerView viewWithTag:101];
    if(pView) {
        [pView stopPlayer];
        [pView removeFromSuperview];
    }
    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:[[NSBundle mainBundle] URLForResource:@"music1" withExtension:@"mp3"] options:nil];
    
    SYWaveformPlayerView *playerView = [[SYWaveformPlayerView alloc] initWithFrame:CGRectMake(0, 0, self.playerView.frame.size.width, 120) asset:asset color:[UIColor whiteColor] progressColor:[UIColor purpleColor]];
    playerView.tag = 101;
    [self.playerView addSubview:playerView];
    
    del.playerView = playerView;
    
}
-(void)targetMethod:(NSTimer *)timer {
    //do smth
    SYWaveformPlayerView *pView = (SYWaveformPlayerView*)[self.playerView viewWithTag:101];
    if(pView.player.playing) {
        _overlay.hidden = true;
        [_activityIndc startAnimating];
    }
}

- (IBAction)btn2Pressed:(id)sender {
    SYWaveformPlayerView *pView = (SYWaveformPlayerView*) [self.playerView viewWithTag:101];
    if(pView) {
        [pView stopPlayer];
        [pView removeFromSuperview];
    }
    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:[[NSBundle mainBundle] URLForResource:@"music2" withExtension:@"mp3"] options:nil];
    
    SYWaveformPlayerView *playerView = [[SYWaveformPlayerView alloc] initWithFrame:CGRectMake(0, 0, self.playerView.frame.size.width, 120) asset:asset color:[UIColor whiteColor] progressColor:[UIColor purpleColor]];
    playerView.tag = 101;
    [self.playerView addSubview:playerView];
    
    del.playerView = playerView;
}

- (IBAction)backPressed:(id)sender {
    
    [self.navigationController popViewControllerAnimated:true];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

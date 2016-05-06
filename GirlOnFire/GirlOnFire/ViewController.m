//
//  ViewController.m
//  GirlOnFire
//
//  Created by Ahmed Sadiq on 18/02/2016.
//  Copyright © 2016 TxLabz. All rights reserved.
//

#import "ViewController.h"
#import "AbousUsVC.h"
#import "AudioPlayer.h"
#import "RandomizerVC.h"
#import "Constants.h"
#import "SYWaveformPlayerView.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    del = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
//    BOOL isFirstTime = [[NSUserDefaults standardUserDefaults] boolForKey:@"isFirstTime"];
//    if(!isFirstTime) {
//        
//        _subscribeView.hidden = false;
//    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)randomizerPressed:(id)sender {
    RandomizerVC *childrenSUVC;
    if(IS_IPAD) {
        childrenSUVC = [[RandomizerVC alloc] initWithNibName:@"RandomizerVC_iPad" bundle:nil];
    }
    else {
        childrenSUVC = [[RandomizerVC alloc] initWithNibName:@"RandomizerVC" bundle:nil];
    }
    
    [self.navigationController pushViewController:childrenSUVC animated:YES];
    [self.navigationController setNavigationBarHidden:YES];
}

- (IBAction)aboutusPressed:(id)sender {
    AbousUsVC *childrenSUVC;
    if(IS_IPAD) {
        childrenSUVC = [[AbousUsVC alloc] initWithNibName:@"AboutUsVC_iPad" bundle:nil];
    }
    else {
        childrenSUVC = [[AbousUsVC alloc] initWithNibName:@"AbousUsVC" bundle:nil];
    }
    
    [self.navigationController pushViewController:childrenSUVC animated:YES];
    [self.navigationController setNavigationBarHidden:YES];
}

- (IBAction)audioPlayerPressed:(id)sender {
//    AudioPlayer *childrenSUVC;
//    if(IS_IPAD) {
//        childrenSUVC = [[AudioPlayer alloc] initWithNibName:@"AudioPlayer_iPad" bundle:nil];
//    }
//    else {
//        childrenSUVC = [[AudioPlayer alloc] initWithNibName:@"AudioPlayer" bundle:nil];
//    }
//    
//    [self.navigationController pushViewController:childrenSUVC animated:YES];
//    [self.navigationController setNavigationBarHidden:YES];
    
    _audioView.hidden = false;
}

- (IBAction)submitBtnPressed:(id)sender {
    UIButton *senderBtn = (UIButton*)sender;
    if(_fullname.text.length > 2 && [self validateEmailWithString:_email.text]) {
        
        senderBtn.enabled = false;
        [[ChimpKit sharedKit] setApiKey:@"14866811e482912047731a65038f0695-us7"];
        
        NSDictionary *emailDict = [NSDictionary dictionaryWithObjectsAndKeys:_email.text,@"email",nil];
        
        NSDictionary *eventLocation = [NSDictionary dictionaryWithObjectsAndKeys:@"161ced6cdd",@"id",emailDict,@"email",_fullname.text,@"name" ,@"true",@"double_optin",nil];
        
        [[ChimpKit sharedKit] callApiMethod:@"lists/subscribe" withParams:eventLocation andCompletionHandler:^(NSURLResponse *response, NSData *data, NSError *error)  {
            
            if (error) {
                //Handle connection error
                NSLog(@"Error, %@", error);
                dispatch_async(dispatch_get_main_queue(), ^{
                    //Update UI here
                });
            } else {
                NSError *parseError = nil;
                id response = [NSJSONSerialization JSONObjectWithData:data
                                                              options:0
                                                                error:&parseError];
                senderBtn.enabled = true;
                if ([response isKindOfClass:[NSDictionary class]]) {
                    
                    id email = [response objectForKey:@"email"];
                    
                    if ([email isKindOfClass:[NSString class]]) {
                        //Successfully subscribed email address
                        [[NSUserDefaults standardUserDefaults] setBool:true forKey:@"isFirstTime"];
                        [[NSUserDefaults standardUserDefaults] synchronize];
                        
                        dispatch_async(dispatch_get_main_queue(), ^{
                            _subscribeView.hidden = true;
                        });
                    }
                    else {
                        
                    }
                }
            }
        }];
        _subscribeView.hidden = true;
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Validation Error" message:@"All fields must have valid data" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (BOOL)validateEmailWithString:(NSString*)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

#pragma mark - Text Field Delegate Methods
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - Audio View Methods
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
    
    [_audioBtn1 setBackgroundImage:[UIImage imageNamed:@"so1_selected.jpg"] forState:UIControlStateNormal];
    [_audioBtn2 setBackgroundImage:[UIImage imageNamed:@"so2.jpg"] forState:UIControlStateNormal];
    
    
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
    
    [_audioBtn1 setBackgroundImage:[UIImage imageNamed:@"so1.jpg"] forState:UIControlStateNormal];
    [_audioBtn2 setBackgroundImage:[UIImage imageNamed:@"so2_selected.jpg"] forState:UIControlStateNormal];
}

- (IBAction)audioBackPressed:(id)sender {
    
    _audioView.hidden = true;
}
- (IBAction)skipPressed:(id)sender {
    _subscribeView.hidden = true;
}
@end

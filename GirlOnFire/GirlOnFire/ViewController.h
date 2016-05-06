//
//  ViewController.h
//  GirlOnFire
//
//  Created by Ahmed Sadiq on 18/02/2016.
//  Copyright © 2016 TxLabz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChimpKit.h"
#import "AppDelegate.h"

@interface ViewController : UIViewController <UITextFieldDelegate,ChimpKitRequestDelegate> {
    AppDelegate *del;
}
@property (weak, nonatomic) IBOutlet UIView *audioView;

@property (weak, nonatomic) IBOutlet UIView *subscribeView;
@property (weak, nonatomic) IBOutlet UITextField *fullname;
@property (weak, nonatomic) IBOutlet UITextField *email;

@property (weak, nonatomic) IBOutlet UIButton *audioBtn1;
@property (weak, nonatomic) IBOutlet UIButton *audioBtn2;

@property (weak, nonatomic) IBOutlet UIView *playerView;

- (IBAction)submitBtnPressed:(id)sender;



@end


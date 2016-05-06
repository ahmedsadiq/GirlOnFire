//
//  RandomizerVC.h
//  GirlOnFire
//
//  Created by Ahmed Sadiq on 19/02/2016.
//  Copyright © 2016 TxLabz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RandomizerVC : UIViewController {
    int currentIndex;
    __weak IBOutlet UIButton *rightBtn;
    __weak IBOutlet UIButton *leftBtn;
    
    int width;
    int height;
    
    BOOL screenNotLoaded;
}

@property (weak, nonatomic) IBOutlet UIView *outerView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
- (IBAction)randomizerBtnPressed:(id)sender;
- (IBAction)leftPressed:(id)sender;
- (IBAction)rightPressed:(id)sender;
@end

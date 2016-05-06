//
//  RandomizerVC.m
//  GirlOnFire
//
//  Created by Ahmed Sadiq on 19/02/2016.
//  Copyright © 2016 TxLabz. All rights reserved.
//

#import "RandomizerVC.h"
#import "Constants.h"
#import <QuartzCore/QuartzCore.h>

@interface RandomizerVC ()

@end

@implementation RandomizerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidLayoutSubviews{
    _outerView.layer.cornerRadius = 15.0;
    _outerView.layer.masksToBounds = YES;
    
    int x=0;
    int y=0;
    height = _outerView.frame.size.height;
    width = _outerView.frame.size.width;
    
    for(int i=1; i<=40; i++) {
        
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, width, height)];
        imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.png",i]];
        
        if(IS_IPAD){
            imgView.contentMode = UIViewContentModeScaleAspectFit;
        }
        
        [_scrollView addSubview:imgView];
        x=x+_scrollView.frame.size.width;
    }
    _scrollView.contentSize = CGSizeMake(39*width, height);
    
    int randomNumber = [self getRandomNumberBetween:1 to:12];
    
    currentIndex = randomNumber;
    
    if(currentIndex == 39) {
        rightBtn.enabled = false;
    }
    else {
        rightBtn.enabled = true;
    }
    
    if(currentIndex == 0 ){
        leftBtn.enabled = false;
    }
    else {
        leftBtn.enabled = true;
    }
    
    [_scrollView setContentOffset:CGPointMake(randomNumber*width, 0) animated:YES];
    
    screenNotLoaded = true;
    
}

-(int)getRandomNumberBetween:(int)from to:(int)to {
    
    return (int)from + arc4random() % (to-from+1);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (IBAction)randomizerBtnPressed:(id)sender {
    if(!screenNotLoaded) {
        int randomNumber = [self getRandomNumberBetween:1 to:60];
        
        currentIndex = randomNumber;
        [_scrollView setContentOffset:CGPointMake(randomNumber*width, 0) animated:YES];
    }
    else {
        
        NSArray *viewsToRemove = [self.scrollView subviews];
        for (UIView *v in viewsToRemove) {
            [v removeFromSuperview];
        }
        
        int x=0;
        int y=0;
        
        for(int i=1; i<=61; i++) {
            
            UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, width, height)];
            imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.png",i]];
            
            if(IS_IPAD){
                imgView.contentMode = UIViewContentModeScaleAspectFit;
            }
            
            [_scrollView addSubview:imgView];
            x=x+_scrollView.frame.size.width;
        }
        _scrollView.contentSize = CGSizeMake(60*width, height);
        
        int randomNumber = [self getRandomNumberBetween:1 to:60];
        
        currentIndex = randomNumber;
        
        if(currentIndex == 60) {
            rightBtn.enabled = false;
        }
        else {
            rightBtn.enabled = true;
        }
        
        if(currentIndex == 0 ){
            leftBtn.enabled = false;
        }
        else {
            leftBtn.enabled = true;
        }
        
        [_scrollView setContentOffset:CGPointMake(randomNumber*width, 0) animated:YES];
        
        screenNotLoaded = false;
    }
    
    
}

- (IBAction)leftPressed:(id)sender {
    currentIndex--;
    [_scrollView setContentOffset:CGPointMake(currentIndex*width, 0) animated:YES];
    if(currentIndex == 0 ) {
        leftBtn.enabled = false;
    }
    rightBtn.enabled = true;
}

- (IBAction)rightPressed:(id)sender {
    currentIndex++;
    [_scrollView setContentOffset:CGPointMake(currentIndex*width, 0) animated:YES];
    if(!screenNotLoaded) {
        if(currentIndex >= 60 ) {
            rightBtn.enabled = false;
        }
    }
    else {
        if(currentIndex == 39 ) {
            rightBtn.enabled = false;
        }
    }
    
    leftBtn.enabled = true;
}
@end

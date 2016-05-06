//
//  AbousUsVC.m
//  GirlOnFire
//
//  Created by Ahmed Sadiq on 19/02/2016.
//  Copyright © 2016 TxLabz. All rights reserved.
//

#import "AbousUsVC.h"

@interface AbousUsVC ()

@end

@implementation AbousUsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)backPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:true];
}
@end

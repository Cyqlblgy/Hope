//
//  LoginViewController.m
//  Hope
//
//  Created by Bin Lang on 11/30/14.
//  Copyright (c) 2014 BinLang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) IBOutlet UITextField *loginUsername;
@property (nonatomic,strong) IBOutlet  UIImageView *imageView;
@property (nonatomic,strong) IBOutlet UITextField *loginPassword;
@property (weak, nonatomic) IBOutlet UILabel *signupLabel;
@property (weak, nonatomic) IBOutlet UIButton *singupButton;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *forgetPasswordButton;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *usernameImage = [UIImage imageNamed:@"LoginUsername"];
    UIView *leftViewForUsername = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, usernameImage.size.height)];
    UIImageView *imageViewForUsername = [[UIImageView alloc] initWithFrame:CGRectMake(10,0,usernameImage.size.width, usernameImage.size.height)];
    [imageViewForUsername setImage:usernameImage];
    [leftViewForUsername addSubview:imageViewForUsername];
    _loginUsername.leftView = leftViewForUsername;
    _loginUsername.leftViewMode = UITextFieldViewModeAlways;
    
    UIImage *passwrodImage = [UIImage imageNamed:@"LoginPassword"];
    UIView *leftViewForPassword = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, passwrodImage.size.height)];
    UIImageView *imageViewForPassword = [[UIImageView alloc] initWithFrame:CGRectMake(10,0,passwrodImage.size.width, passwrodImage.size.height)];
    [imageViewForPassword setImage:passwrodImage];
    [leftViewForPassword addSubview:imageViewForPassword];
    _loginPassword.leftView = leftViewForPassword;
    _loginPassword.leftViewMode = UITextFieldViewModeAlways;
    
    _signupLabel.text = @"Need an account?";
    [_singupButton setTitle:@"Sign up" forState:UIControlStateNormal];
    [_loginButton setTitle:@"Login" forState:UIControlStateNormal];
    // Do any additional setup after loading the view, typically from a nib.
    [_forgetPasswordButton setTitle:@"Forgot password? " forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

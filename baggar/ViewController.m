//
//  ViewController.m
//  baggar
//
//  Created by SangChan Lee on 12. 4. 16..
//  Copyright (c) 2012년 KTH Corp. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *donateButton;
- (IBAction)pressedDonateButtonTier:(id)sender;
- (IBAction)pressedTHXButton:(id)sender;

@end

@implementation ViewController
@synthesize donateButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initADBanner];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setDonateButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)pressedDonateButtonTier:(id)sender {
    NSString *donateMessage;
    switch ([sender tag]) {
        case 0:
            donateMessage = [NSString stringWithString:@"조금만 더 쓰시죠"];
            break;
        case 1:
            donateMessage = [NSString stringWithString:@"정말 감사합니다"];
            break;
        default:
            donateMessage = [NSString stringWithString:@"이 은혜 잊지 않겠습니다 ㅠㅠ"];
            break;
    }
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"감사합니다" message:donateMessage delegate:nil cancelButtonTitle:@"취소" otherButtonTitles:@"확인", nil];
    [alert show];
}
- (IBAction)pressedTHXButton:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

- (void)initADBanner
{
    // iAd 배너
    if( NSClassFromString(@"ADBannerView") )
    {
        adBanner = [[ADBannerView alloc] initWithFrame:CGRectZero];
        [adBanner setRequiredContentSizeIdentifiers:
         [NSSet setWithObjects:ADBannerContentSizeIdentifierPortrait, nil]];
        
        [adBanner setCurrentContentSizeIdentifier:ADBannerContentSizeIdentifierPortrait];
        [adBanner setFrame:CGRectMake(0, 0, 320, 50)];
        [adBanner setDelegate:self];
        [self.view addSubview:adBanner];
    }
    
}

#pragma mark -
#pragma mark iAD Delegate

- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    [UIView beginAnimations:@"animateBannerAppear" context:nil];
    [adBanner setFrame:CGRectMake(0, 0, 320, 50)];
    [UIView commitAnimations];
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    [UIView beginAnimations:@"animateBannerOff" context:nil];
    [adBanner setFrame:CGRectMake(0, 0, 320, 50)];
    [UIView commitAnimations];
}


@end

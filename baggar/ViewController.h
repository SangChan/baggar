//
//  ViewController.h
//  baggar
//
//  Created by SangChan Lee on 12. 4. 16..
//  Copyright (c) 2012년 KTH Corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface ViewController : UIViewController<ADBannerViewDelegate> {
    ADBannerView* adBanner; // iAD
}

@end

//
//  ViewController.h
//  firstapp
//
//  Created by Armando on 10/09/14.
//  Copyright (c) 2014 Armando. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SystemConfiguration/SystemConfiguration.h>
@class Reachability;
Reachability *internetreachable;
Reachability *hostreachable;
@interface ViewController : UIViewController<UIWebViewDelegate,UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webview;


//-(void)checkNetworkStatus:(NSNotification *)notice;


@end

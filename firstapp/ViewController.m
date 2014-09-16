//
//  ViewController.m
//  firstapp
//
//  Created by Armando on 10/09/14.
//  Copyright (c) 2014 Armando. All rights reserved.
//

#import "ViewController.h"
#import "Reachability.h"
#import "newViewController.h"
@interface ViewController ()

@end

@implementation ViewController
@synthesize webview;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    NSString *str=@"http://v.ncorpuscle.com/m-go.aspx";
    //NSString *str=@"https://members.via121.com/my/usersignin.aspx";
    NSURL *url=[NSURL URLWithString:str];
    NSURLRequest *req=[NSURLRequest requestWithURL:url];
    [self.webview loadRequest:req];
    
   self.automaticallyAdjustsScrollViewInsets=YES;
   self.webview.scalesPageToFit=YES;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(checkNetworkStatus:) name:kReachabilityChangedNotification object:nil];
    
    internetreachable = [Reachability reachabilityForInternetConnection];
    [internetreachable startNotifier];
    
     //check if a pathway to a random host exists
   
    hostreachable = [Reachability reachabilityWithHostName:@"http://v.ncorpuscle.com/m-go.aspx"];
    [hostreachable startNotifier];
   
    // [self replacementForUpdateInterfaceWithReachability: hostreachable];
    
 
    
}
-(void)replacementForUpdateInterfaceWithReachability:(Reachability*)curReach
{
    NetworkStatus netStatus = [curReach currentReachabilityStatus];
    if (netStatus == NotReachable)
    {
        //NSLog(@"you are in replaceforupdate");
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error" message:@"Internet is not available" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        [webview reload];
    }
}
-(void)checkNetworkStatus:(NSNotification *)notice
{
    NetworkStatus internetstatus=[internetreachable currentReachabilityStatus];
    switch (internetstatus)
    {
        case NotReachable:
            
        {
          
            NSLog(@"Internet is down");
            
            newViewController *new=[[newViewController alloc]initWithNibName:@"newViewController" bundle:nil];
            new.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
            new.modalPresentationStyle=UIModalPresentationFullScreen;
        [self presentViewController:new animated:YES completion:nil];
            
          //  UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error" message:@"Internet is not available" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
         //  [alert show];
           
            
            break;
        }
        case ReachableViaWiFi:
        {
            NSLog(@"The internet is working via WIFI.");
            
            [webview reload];
            
            
            break;
        }
        case ReachableViaWWAN:
        {
            NSLog(@"The internet is working via WWAN.");
           // self.internetActive = YES;
            
            [webview reload];
            
            break;
        }
    }
    
    NetworkStatus hoststatus=[internetreachable currentReachabilityStatus];
    switch (hoststatus) {
        case NotReachable:
        {
            NSLog(@"host server is down");
            
            break;
        }
            
        case ReachableViaWiFi:
        {
            NSLog(@"host server is working via WIFI");
            [webview reload];
                        break;
        }
        case ReachableViaWWAN:
        {
            NSLog(@"host server is working via WWAN");
            [webview reload];
            break;
        }
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"You have no internet connection!" delegate:self cancelButtonTitle:@"Close" otherButtonTitles:nil, nil];
    [alert show];
}
/*- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    exit(0);
    
}*/
/*-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    
    [webview sizeToFit];
    [webview setFrame:CGRectMake(webview.frame.origin.x, webview.frame.origin.y, 320.0, webview.frame.size.height)];
}*/
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    [webview reload];
}
@end

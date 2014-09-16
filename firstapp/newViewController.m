//
//  newViewController.m
//  firstapp
//
//  Created by Armando on 12/09/14.
//  Copyright (c) 2014 Armando. All rights reserved.
//

#import "newViewController.h"
#import "Reachability.h"
#import "ViewController.h"

@interface newViewController ()

@end

@implementation newViewController
@synthesize lbl;
@synthesize trybtn;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
       
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
   
    [self.view addSubview:lbl];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)trybtnclick:(id)sender
{
     NetworkStatus internetstatus=[internetreachable currentReachabilityStatus];
    if(internetstatus==NotReachable)
    {
        NSLog(@"In not reachable state");
        [self.view setNeedsDisplay];
        
    }
    else
    {
       // ViewController *vc=[[ViewController alloc]init];
       // [vc.webview reload];
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }
    
    
}

@end

//
//  newViewController.h
//  firstapp
//
//  Created by Armando on 12/09/14.
//  Copyright (c) 2014 Armando. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Reachability;
Reachability *internetreachable;

@interface newViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *lbl;
@property (weak, nonatomic) IBOutlet UIButton *trybtn;

- (IBAction)trybtnclick:(id)sender;

@end

//
//  ViewController.h
//  jsontest
//
//  Created by Narist Chalangsut on 11/21/57 BE.
//  Copyright (c) 2557 Narist Chalangsut. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    IBOutlet UIButton *test1;
       IBOutlet UIButton *test2;
       IBOutlet UIButton *test3;
       IBOutlet UIButton *test4;
       IBOutlet UIButton *test5;
       IBOutlet UIButton *test6;
       IBOutlet UIButton *test7;
       IBOutlet UIButton *test8;
    IBOutlet UIImageView *iamgeview;
    NSString *createtimeString,*closetimeString,*opentimeString;
}
-(IBAction)jsonparser:(id)sender;
@end

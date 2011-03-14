//
//  TestViewController.h
//  HotOMeter
//
//  Created by Boris Jabes on 3/13/11.
//  Copyright 2011 NA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HotOMeterView.h"

@interface TestViewController : UIViewController {
  HotOMeterView *sliderView;
}

- (IBAction)slideAction:(UISlider *)sender;
- (IBAction)rateAction:(UIBarButtonItem *)sender event:(UIEvent *)event;
- (IBAction)slideTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (IBAction)slideTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;

@end

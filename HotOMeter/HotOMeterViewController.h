//
//  HotOMeterViewController.h
//  HotOMeter
//
//  Created by Boris Jabes on 3/12/11.
//  Copyright 2011 NA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HotOMeterViewController : UIViewController {
  IBOutlet UISlider *slider;
  IBOutlet UIView *sliderView;
}

- (IBAction)sliderAction:(UISlider *)sender;

@end

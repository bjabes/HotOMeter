//
//  HotOMeterView.h
//  HotOMeter
//
//  Created by Boris Jabes on 3/13/11.
//  Copyright 2011 NA. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface HotOMeterView : UIView {
  UISlider *slider;
  UIImageView *background;
}

@property (readonly, nonatomic) UISlider *slider;

- (IBAction)sliderAction:(UISlider *)sender;

@end

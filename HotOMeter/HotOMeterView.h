//
//  HotOMeterView.h
//  HotOMeter
//
//  Created by Boris Jabes on 3/13/11.
//  Copyright 2011 NA. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HotOMeterDelegate <NSObject>

- (void)didBeginTouch;
- (void)didMoveTouch;
- (void)didEndTouch;

@end


@interface HotOMeterView : UIView {
  UISlider *slider;
  UIImageView *background;
  id <HotOMeterDelegate> delegate;
}

@property (readonly, nonatomic) UISlider *slider;
@property (nonatomic, assign) id <HotOMeterDelegate> delegate;

- (IBAction)sliderAction:(UISlider *)sender;

@end

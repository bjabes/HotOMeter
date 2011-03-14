//
//  HotOMeterView.m
//  HotOMeter
//
//  Created by Boris Jabes on 3/13/11.
//  Copyright 2011 NA. All rights reserved.
//

#import "HotOMeterView.h"


@implementation HotOMeterView

@synthesize slider;

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {

    // init the slider and make it transparent
    slider = [[UISlider alloc] initWithFrame: CGRectMake(0, 12, frame.size.width, frame.size.height)];
    [slider setMinimumTrackImage:[[UIImage alloc] init] forState:UIControlStateNormal];
    [slider setMaximumTrackImage:[[UIImage alloc] init] forState:UIControlStateNormal];
    
    [slider setThumbImage:[UIImage imageNamed:@"slider_handle_dynos.png"] forState:UIControlStateNormal];
    
    // set the bounds of the slider
    [slider setMinimumValue:1.0];
    [slider setMaximumValue:10.0];
    [slider setValue:5.0];
    [slider setUserInteractionEnabled:YES];
    [slider setContinuous:YES];
    
    // init the background image
    UIImage *image = [UIImage imageNamed:@"slider_track.png"];
    background = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, image.size.height)];
    background.autoresizingMask = UIViewAutoresizingNone;
    background.image = image;
    
    // make it all vertical
    self.transform = CGAffineTransformRotate(self.transform, 3*M_PI_2);
    
    // handle value changed event from slider (to increment by a full integer)
    [slider addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
        
    // add them to my view
    [self addSubview:background];
    [self addSubview:slider];
    
    [self setNeedsDisplay];

  }
  return self;
}

- (void)sliderAction:(UISlider *)sender
{
  NSLog(@"slider value = %f",sender.value);
  [slider setValue:roundf(sender.value)]; 
}

- (void)dealloc
{
  [slider release];
  [background release];
  [super dealloc];
}

@end

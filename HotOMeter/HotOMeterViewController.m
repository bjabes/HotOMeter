//
//  HotOMeterViewController.m
//  HotOMeter
//
//  Created by Boris Jabes on 3/12/11.
//  Copyright 2011 NA. All rights reserved.
//

#import "HotOMeterViewController.h"

@implementation HotOMeterViewController

- (void)dealloc
{
  [super dealloc];
}

- (void)didReceiveMemoryWarning
{
  // Releases the view if it doesn't have a superview.
  [super didReceiveMemoryWarning];
  
  // Release any cached data, images, etc that aren't in use.
}

- (void)sliderAction:(UISlider *)sender
{
  NSLog(@"slider value = %f",sender.value);
  [slider setValue:roundf(sender.value)];
}

- (void)rateAction:(UIBarButtonItem *)sender event:(UIEvent *)event
{
  sliderView.hidden = NO;
  
  CGPoint loc = [[[event allTouches] anyObject] locationInView:self.view];
  
  CGPoint startPoint = CGPointMake(loc.x-6, loc.y+160);
  CGPoint endPoint = CGPointMake(loc.x-6, loc.y-240);
  
  sliderView.center = startPoint;
  
  [UIView animateWithDuration:0.5 animations:^{
    sliderView.center = endPoint;
  }];
}

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
  [super viewDidLoad];
  [slider setMinimumTrackImage:[[UIImage alloc] init] forState:UIControlStateNormal];
  [slider setMaximumTrackImage:[[UIImage alloc] init] forState:UIControlStateNormal];
  [slider setThumbImage:[UIImage imageNamed:@"thumb-1.png"] forState:UIControlStateNormal];
  sliderView.transform = CGAffineTransformRotate(sliderView.transform, 3*M_PI_2);
}

- (void)viewDidUnload
{
  [super viewDidUnload];
  // Release any retained subviews of the main view.
  // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  // Return YES for supported orientations
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

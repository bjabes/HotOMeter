//
//  TestViewController.m
//  HotOMeter
//
//  Created by Boris Jabes on 3/13/11.
//  Copyright 2011 NA. All rights reserved.
//

#import "TestViewController.h"


@implementation TestViewController

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

- (IBAction)slideAction:(UISlider *)sender
{
}

- (void)rateAction:(UIBarButtonItem *)sender event:(UIEvent *)event
{
  sliderView.hidden = NO;
  sliderView.alpha = 0.5;
  
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
  sliderView = [[HotOMeterView alloc] initWithFrame:CGRectMake(0,0,300,80)];

  //sliderView.backgroundColor = [UIColor darkGrayColor];
  
  sliderView.delegate = self;
  
  [[sliderView slider] addTarget:self action:@selector(slideAction:) forControlEvents:UIControlEventValueChanged];
  [[sliderView slider] addTarget:self action:@selector(slideTouchesBegan:withEvent:) forControlEvents:UIControlEventTouchDown];
  [[sliderView slider] addTarget:self action:@selector(slideTouchesEnded:withEvent:) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchUpOutside | UIControlEventTouchCancel];
  sliderView.alpha = 0.5;
  sliderView.center = CGPointMake(self.view.bounds.size.width, self.view.bounds.size.height-240);

  [self.view addSubview:sliderView];
  
}

- (void)enterSlider
{
  CGPoint startPoint = CGPointMake(self.view.bounds.size.width, self.view.bounds.size.height-240);
  CGPoint endPoint = CGPointMake(self.view.bounds.size.width-20, self.view.bounds.size.height-240);
  
  sliderView.center = startPoint;
  
  [UIView animateWithDuration:0.25 animations:^{
    sliderView.alpha = 1.0;
    sliderView.transform = CGAffineTransformScale(sliderView.transform, 1.2, 1.2);
    sliderView.center = endPoint;
  }];
}

- (void)exitSlider
{
  CGPoint startPoint = CGPointMake(self.view.bounds.size.width, self.view.bounds.size.height-240);
  CGPoint endPoint = CGPointMake(self.view.bounds.size.width-20, self.view.bounds.size.height-240);
  
  sliderView.center = endPoint;
  
  [UIView animateWithDuration:0.25 animations:^{
    sliderView.alpha = 0.5;
    sliderView.transform = CGAffineTransformScale(sliderView.transform, 1.0/1.2, 1.0/1.2);
    sliderView.center = startPoint;
  }];
}

- (void)didBeginTouch
{
  [self enterSlider];
}

- (void)didEndTouch
{
  [self exitSlider];
}

- (void)didMoveTouch
{
}

- (void)slideTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
  [self enterSlider];
}

- (void)slideTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
  [self exitSlider];
}

- (void)viewDidUnload
{
  [super viewDidUnload];
  // Release any retained subviews of the main view.
  // e.g. self.myOutlet = nil;
  [sliderView release];
  sliderView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  // Return YES for supported orientations
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

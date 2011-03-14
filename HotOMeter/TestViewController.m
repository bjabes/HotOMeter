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
  NSLog(@"HAH");
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
//  sliderView.backgroundColor = [UIColor redColor];
  [[sliderView slider] addTarget:self action:@selector(slideAction:) forControlEvents:UIControlEventValueChanged];
  [[sliderView slider] addTarget:self action:@selector(slideTouchesBegan:withEvent:) forControlEvents:UIControlEventTouchDown];
  [[sliderView slider] addTarget:self action:@selector(slideTouchesEnded:withEvent:) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchDragOutside];
  sliderView.alpha = 0.5;
  sliderView.center = CGPointMake(self.view.bounds.size.width, self.view.bounds.size.height-240);

  [self.view addSubview:sliderView];
  
}

- (void)slideTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
  CGPoint startPoint = CGPointMake(self.view.bounds.size.width, self.view.bounds.size.height-240);
  CGPoint endPoint = CGPointMake(self.view.bounds.size.width-32, self.view.bounds.size.height-240);
  
  sliderView.center = startPoint;
  
  [UIView animateWithDuration:0.25 animations:^{
    sliderView.alpha = 1.0;
    sliderView.center = endPoint;
  }];
}

- (void)slideTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
  CGPoint startPoint = CGPointMake(self.view.bounds.size.width, self.view.bounds.size.height-240);
  CGPoint endPoint = CGPointMake(self.view.bounds.size.width-32, self.view.bounds.size.height-240);
  
  sliderView.center = endPoint;

  [UIView animateWithDuration:0.25 animations:^{
    sliderView.alpha = 0.5;
    sliderView.center = startPoint;
  }];
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

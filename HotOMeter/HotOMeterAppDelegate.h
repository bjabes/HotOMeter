//
//  HotOMeterAppDelegate.h
//  HotOMeter
//
//  Created by Boris Jabes on 3/12/11.
//  Copyright 2011 NA. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HotOMeterViewController;

@interface HotOMeterAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet HotOMeterViewController *viewController;

@end

//
//  TestApp2AppDelegate.h
//  TestApp2
//
//  Created by Wa-jiw Casey on 7/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TestApp2ViewController;

@interface TestApp2AppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet TestApp2ViewController *viewController;

@end

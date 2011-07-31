//
//  TestApp2ViewController.h
//  TestApp2
//
//  Created by Wa-jiw Casey on 7/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LandscapeView.h"

@interface TestApp2ViewController : UIViewController <UIActionSheetDelegate>{
    IBOutlet UITextField *myText;
    IBOutlet UISlider   *slide;
    IBOutlet UIButton *myButton;
    LandscapeView *landscapeView;
    
}

@property (nonatomic, retain) IBOutlet UITextField *myText;
@property (nonatomic, retain) IBOutlet UISlider *slide;

@property (nonatomic, retain) LandscapeView *landscapeView;
- (IBAction) changeButtonPressed:()sender;
- (IBAction) sliderValueChanged:(UISlider *)sender;

@end

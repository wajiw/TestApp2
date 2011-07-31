//
//  TestApp2ViewController.m
//  TestApp2
//
//  Created by Wa-jiw Casey on 7/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TestApp2ViewController.h"

@implementation TestApp2ViewController

@synthesize slide, myText, landscapeView;

- (void)dealloc
{
    [slide dealloc];
    [myText dealloc];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    LandscapeView *v = [[LandscapeView alloc] initWithNibName:@"LandscapeView" bundle:nil];
    self.landscapeView = v;
    [v release];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationChanged:) name:UIDeviceOrientationDidChangeNotification object:nil];
}
-(void)orientationChanged:(NSNotification *)notification
{
    [self performSelector:@selector(updateView) withObject:nil afterDelay:0];
}

- (void) updateView
{
    UIDeviceOrientation orientation = [UIDevice currentDevice].orientation;
    if(UIDeviceOrientationIsLandscape(orientation) )
    {
        myText.text = @"landscape";
        [self presentModalViewController:self.landscapeView animated:YES];
    }
    else if(orientation == UIDeviceOrientationPortrait)
    {
        myText.text = @"portrait";
        [self dismissModalViewControllerAnimated:YES];
    }
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

- (IBAction) sliderValueChanged:(UISlider *)sender
{
    myText.text = [NSString stringWithFormat:@"%.1f", [sender value]];
    NSLog(@"my val:%.1f", [sender value]);
    
}

- (IBAction) changeButtonPressed:()sender
{
    NSString *val = [myText text];
    
    float myFloat = [val floatValue];
    if(myFloat < 0) myFloat = 0;
    if(myFloat > 100) myFloat = 100;
    slide.value = myFloat;
    myText.text = [NSString stringWithFormat:@"%.1f",myFloat];
    if ([myText canResignFirstResponder]) [myText resignFirstResponder];  
    NSLog(@"my val:%.1f", myFloat);
    
//    UIAlertView *alert = [[UIAlertView alloc] 
//                          initWithTitle:[NSString stringWithFormat:@"%.1f",myFloat]               message:@"hello" 
//                             delegate:self 
//                    cancelButtonTitle:@"close" 
//                    otherButtonTitles:nil];
//    [alert show];
//    [alert release];

    UIActionSheet *mySheet = [[UIActionSheet alloc] initWithTitle:@"action title" delegate:self cancelButtonTitle:@"cancel" destructiveButtonTitle:@"destruct"
                              otherButtonTitles:nil];
    [mySheet showInView:self.view];
    [mySheet release];
}

- (void) actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 0)
    { 
        NSURL *url = [ [ NSURL alloc ] initWithString: @"http://developer.apple.com/library/ios/navigation/#section=Resource%20Types&topic=Guides" ];
        [[UIApplication sharedApplication] openURL:url];
    }
}

- (void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event {  
    if (myText) {  
        if ([myText canResignFirstResponder]) [myText resignFirstResponder];  
    }  
    [super touchesBegan: touches withEvent: event];  
} 

@end

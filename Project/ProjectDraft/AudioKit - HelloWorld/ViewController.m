//
//  ViewController.m
//  AudioKit - HelloWorld
//
//  Created by Sam Beedell on 24/06/2015.
//  Copyright (c) 2015 Sam Beedell. All rights reserved.
//
//  ------------------------------------------------------------------------
//  Description:
//  This class control everything that is presented to the user on the storyboard file. It also uses AudioKit to generate an audible tone
//
//  ------------------------------------------------------------------------

#import "ViewController.h"

@interface ViewController()
//@property (nonatomic) CGPoint coordinates;

@end

@implementation ViewController
{
    NewInstrument *newInstrument; // The AKInstrument subclass declaration
    IBOutlet UIButton *freqButton;
    int neckFreq;
    
    NewInstrumentNote *note; // This is the AKNote subclass declaration
    
    
    //Create array for notes and currently played notes
    NSArray *frequencies;
    NSMutableDictionary *currentNotes;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    frequencies = @[@440, @466.16, @493.88, @523.25, @554.37, @587.33, @622.25, @659.26, @698.46, @739.99, @783.99, @830.61, @880, @932.33, @987.77, @1046.5];
    currentNotes = [NSMutableDictionary dictionary];
    
    // Allocate memory for the AKInstrument subclass and run its 'init' method.
    newInstrument = [[NewInstrument alloc] init];
    
    // Add the declared AudioKit instrument(s) to the AKOrchestra which is the environment for all instruments
    [AKOrchestra addInstrument:newInstrument];
    
    
    // Connect the UISliders to the AKInstrumentProperty objects
//    modulationFrequency.property = fmInstrument.modFreq;
//    modulationIndex.property     = fmInstrument.modIndex;
//    amplitude.property           = fmInstrument.amp;
    
    

}


//Add methods for UIGestures

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
        
        UITouch *touch = [touches anyObject];
        [self.view setUserInteractionEnabled:NO];
      //  self.firstPoint = [touch locationInView:self.view];

        

}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    
    //  [self.swipeTimer invalidate];
    
    //  NSLog(@"the timer stops at %f seconds", swipeTime);
    
    UITouch *touch = [touches anyObject];
    //self.lastPoint = [touch locationInView:self.view];
    
 //   CGPoint tapVector = rwSub(self.lastPoint, self.firstPoint); // (vector) last point - first point

    
}


- (IBAction)keyPressed:(id)sender {
    //Receive tag
    NSInteger tag = [(UIButton *)sender tag];
    
    //Initialise note object
    note = [[NewInstrumentNote alloc]init];
    
    //Set the frequency to the note
    note.frequency.value = [[frequencies objectAtIndex:tag] floatValue];

    // Play the note
    [newInstrument playNote:note];
    
    // Save the note object to an array
    [currentNotes setObject:note forKey:[NSNumber numberWithInt:(int)tag]];
}


- (IBAction)keyReleased:(id)sender {
    
    //    // Recieve the tag of the button pressed
    //    NSInteger tag = [(UIButton *)sender tag];
    //
    //    // Get the key note instance from the tag property
    //    FMInstrumentNote *noteToRelease = [currentNotes objectForKey:[NSNumber numberWithInt:(int)tag]];
    //
    //    // Stop the note
    //    [fmInstrument stopNote:noteToRelease];
    //
    //    // Remove the note from the array
    //    [currentNotes removeObjectForKey:[NSNumber numberWithInt:(int)tag]];
}

//- (IBAction)toggleSound:(UIButton *)sender {
//    if (![sender.titleLabel.text isEqual: @"Stop"]) {
//        // Play the instrument
//        [newInstrument play];
//        // Change the text of the UIButton
//        [sender setTitle:@"Stop" forState:UIControlStateNormal];
//    } else {
//        // Stop the instrument
//        [newInstrument stop];
//        // Change the text of the UIButton
//        [sender setTitle:@"Play Sine Wave at 440Hz" forState:UIControlStateNormal];
//    }
//}

@end

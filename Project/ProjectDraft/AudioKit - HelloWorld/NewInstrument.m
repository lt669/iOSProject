//
//  NewInstrument.h
//  AudioKit - HelloWorld
//
//  Created by Lewis Thresh on ?/?/2015.
//  Copyright (c) 2015 Lewis Thresh. All rights reserved.
//


#import "NewInstrument.h"

@implementation NewInstrument

// Produces setter and getter function for controlling properties 
//@synthesize osc;
@synthesize mandolin /*,freq*/;
- (instancetype)init
{
    // Firstly, we must call the intialisation code for the inherited class (AKInstrument)
    // This starts the Orchestra (which only ever happens once) but also sets up the low-level features of the AKInstrument object
    self = [super init]; 
    if (self) {
        
        // Instrument Note Definition
        NewInstrumentNote *note = [[NewInstrumentNote alloc] init];
        
        // Instrument Definition
        //osc = [AKOscillator oscillator];
        mandolin = [AKMandolin mandolin];
     

        //Send parameter to mandolin
         mandolin.bodySize = akp(0.5);
         mandolin.amplitude = akp(0.5);
         mandolin.pairedStringDetuning = akp(0.3 );
         mandolin.frequency = note.frequency;

        
        // Output source of the instrument
        [self setAudioOutput:mandolin];

    }
    return self;
}

@end

@implementation NewInstrumentNote

@synthesize frequency;

- (instancetype)init {
    self = [super init];
    if (self) {
        
        frequency = [self createPropertyWithValue:440 minimum:20 maximum:20000];
        
        self.duration.value = 2; // Useful for testing polyphony in the simulator - not required if a keyReleased method is used
        
    }
    return self;
}

@end


//
//  ADPatient.m
//  Lesson9_HW
//
//  Created by A D on 12/16/13.
//  Copyright (c) 2013 AD. All rights reserved.
//

#import "ADPatient.h"

@implementation ADPatient

@synthesize patientName = _patientName;
@synthesize patientTemperature = _patientTemperature;
@synthesize delegate = _delegate;
@synthesize isHappy = _isHappy;


-(BOOL) hasFever{
        return self.patientTemperature >36.6f ? YES : arc4random()%2;
}

-(BOOL) hasHeadache{
    return arc4random()%2;
}

-(void) isGettingWorse{
    
    BOOL fever = [self hasFever];
    BOOL headache = [self hasHeadache];
    
    if(fever || headache){
        NSLog(@"Patient %@ with temperature %1.1f %@ visits %@",
              self.patientName, self.patientTemperature,
              headache ? @"and headache" : @"", self.delegate);
        [self.delegate visitDoctor:self];
    }
}

-(void) getRest{
    NSLog(@"Patien %@ needs to rest.", self.patientName);
}

-(void) drinkAlcoPepper{
    NSLog(@"Patien %@ needs a healing drink.", self.patientName);
}

-(void) needsHotNurse{
    NSLog(@"Patien %@ needs a serious warm up.", self.patientName);
}


-(void) takeLeech{
    
    NSLog(@"Patient %@ takes a leech", self.patientName);
    
}


-(void) itHurts{
    
    NSArray *bodyParts = [NSArray arrayWithObjects:@"Head", @"Leg", @"Stomack", nil];
    NSInteger random = arc4random()%3;
    NSString *bodyPart = [bodyParts objectAtIndex:random];
    
    NSLog(@"Patien %@ has pain in %@", self.patientName, bodyPart);
    
    [self.delegate patient:self hasPainIn:bodyPart];
}

@end

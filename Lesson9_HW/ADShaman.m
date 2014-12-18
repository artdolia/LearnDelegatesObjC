//
//  ADShaman.m
//  Lesson9_HW
//
//  Created by A D on 12/16/13.
//  Copyright (c) 2013 AD. All rights reserved.
//

#import "ADShaman.h"



@implementation ADShaman

@synthesize name = _name;
@synthesize report = _report;

-(NSString*) description{
    return self.name;
}

-(void) visitDoctor:(ADPatient *) patient{
    
    [patient takeLeech];
}

-(void) patient:(ADPatient *)patient hasPainIn:(NSString *)bodyPart{

    //[self addToReport:patient tookTreatment:bodyPart];
    
    NSLog(@"This is %@", self.name);
    
    [self.report setValue:bodyPart forKey:patient.patientName];
    
    if([bodyPart isEqualToString:@"Head"]){
        NSLog(@"Patient %@ needs to eat a frog", patient.patientName);
        
    }else if([bodyPart isEqualToString:@"Leg"]){
        NSLog(@"Patient %@ needs to eat a grasshopper", patient.patientName);
        
    }else if([bodyPart isEqualToString:@"Stomack"]){
        NSLog(@"Patient %@ needs to jump on left foot", patient.patientName);
        
    }else{
        NSLog(@"I cannot access the spirits of universe");
    }
}

/*
-(void) addToReport:(ADPatient*) patient tookTreatment:(NSString*)bodyPart{
    
    [self.report setObject:bodyPart forKey:patient.patientName];
    
}
 */

@end

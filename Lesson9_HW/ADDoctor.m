//
//  ADDoctor.m
//  Lesson9_HW
//
//  Created by A D on 12/16/13.
//  Copyright (c) 2013 AD. All rights reserved.
//

#import "ADDoctor.h"

@implementation ADDoctor

@synthesize name = _name;
@synthesize report =_report;

-(NSString*) description{
    return self.name;
}

#pragma mark - ADPatientDelegate -

-(void) visitDoctor:(ADPatient *) patient{
    
    if([patient hasHeadache] && [patient hasFever]){
        
        NSLog(@"Patient %@ is way to sick, nothing I can do", patient.patientName);
    }else if([patient hasHeadache]){
        
        //take a drink
        [patient drinkAlcoPepper];
        
    }else if([patient hasFever]){
        
        if( patient.patientTemperature < 36.6f){
            [patient needsHotNurse];
        }else if(patient.patientTemperature >=36.6 && patient.patientTemperature <38.f){
            [patient getRest];
        }else{
            [patient drinkAlcoPepper];
        }
    }else{
        NSLog(@"Hey, %@, stop simulating, go home!", patient.patientName);
    }
}

-(void) patient:(ADPatient *)patient hasPainIn:(NSString *)bodyPart{
    
    NSLog(@"This is %@", self.name);
    
    //add to the report
    [self.report setValue:bodyPart forKey:patient.patientName];
        //NSLog(@"%@", self.report);
    
    
    //[self addToReport:patient tookTreatment:bodyPart];
    
    if([bodyPart isEqualToString:@"Head"]){
        NSLog(@"Patient %@ needs a helmet", patient.patientName);
        
    }else if([bodyPart isEqualToString:@"Leg"]){
        NSLog(@"Patient %@ needs a crutches", patient.patientName);
        
    }else if([bodyPart isEqualToString:@"Stomack"]){
        NSLog(@"Patient %@ needs a cup of hot chocolate", patient.patientName);
        
    }else{
        NSLog(@"I cannot recognize any symphtoms.");
    }
    
}

/*

-(void) addToReport:(ADPatient*) patient tookTreatment:(NSString*)bodyPart{
    
    [self.report setObject:bodyPart forKey:patient.patientName];
    NSLog(@"%@", self.report);
    
}
 
 */

@end

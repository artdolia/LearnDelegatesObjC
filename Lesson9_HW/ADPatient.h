//
//  ADPatient.h
//  Lesson9_HW
//
//  Created by A D on 12/16/13.
//  Copyright (c) 2013 AD. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ADPatientDelegate;


@interface ADPatient : NSObject

@property (strong, nonatomic) NSString *patientName;
@property (assign, nonatomic) CGFloat patientTemperature;
@property (weak, nonatomic) id <ADPatientDelegate> delegate;
@property (assign, nonatomic) BOOL isHappy;

-(BOOL) hasFever;
-(BOOL) hasHeadache;
-(void) isGettingWorse;
-(void) getRest;
-(void) drinkAlcoPepper;
-(void) needsHotNurse;
-(void) takeLeech;
-(void) itHurts;

@end


@protocol ADPatientDelegate

-(void) patient:(ADPatient *) patient hasPainIn:(NSString *) bodyPart;
-(void) visitDoctor:(ADPatient *) patient;

@end

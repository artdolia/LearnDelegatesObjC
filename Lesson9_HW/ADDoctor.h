//
//  ADDoctor.h
//  Lesson9_HW
//
//  Created by A D on 12/16/13.
//  Copyright (c) 2013 AD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ADPatient.h"

@interface ADDoctor : NSObject <ADPatientDelegate>
@property (strong, nonatomic) NSString * name;
@property (strong, nonatomic) NSMutableDictionary *report;

//-(void) addToReport:(ADPatient*) patient tookTreatment:(NSString*)bodyPart;
@end

//
//  ADAppDelegate.m
//  Lesson9_HW
//
//  Created by A D on 12/16/13.
//  Copyright (c) 2013 AD. All rights reserved.
//

#import "ADAppDelegate.h"
#import "ADPatient.h"
#import "ADDoctor.h"
#import "ADShaman.h"

@implementation ADAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    //create patients and a doctor
    
    ADPatient *patient1 = [[ADPatient alloc] init];
    patient1.patientName = @"Pat1";
    patient1.patientTemperature = 34.4f;
    
    ADPatient *patient2 = [[ADPatient alloc] init];
    patient2.patientName = @"Pat2";
    patient2.patientTemperature = 37.4f;
    
    ADPatient *patient3 = [[ADPatient alloc] init];
    patient3.patientName = @"Pat3";
    patient3.patientTemperature = 44.4f;
    
    ADPatient *patient4 = [[ADPatient alloc] init];
    patient4.patientName = @"Pat4";
    patient4.patientTemperature = 38.4f;
    
    ADDoctor *doctor = [[ADDoctor alloc] init];
    doctor.name = @"Doctor";
    doctor.report = [NSMutableDictionary dictionary];
    
    ADShaman *shaman1 = [[ADShaman alloc] init];
    shaman1.name = @"Shaman1";
    shaman1.report = [NSMutableDictionary dictionary];
    
    ADShaman *shaman2 = [[ADShaman alloc] init];
    shaman2.name = @"Shaman2";
    shaman2.report = [NSMutableDictionary dictionary];
    
    NSArray *healers = [NSArray arrayWithObjects:doctor, shaman1, shaman2, nil];
    
    NSArray *patients = [NSArray arrayWithObjects:patient1, patient2, patient3, patient4, nil];
    
    //set patien's doctor in random order
    for(ADPatient *patient in patients){
        patient.delegate = [healers objectAtIndex:arc4random()%[healers count]];
    }
    
    NSInteger days = 2;
    
    for(int i = 0; i<days; i++){
        
        NSLog(@"\n\n ******************* DAY %d ****************\n\n", i+1);
        
        //send the patient to the doctor
        for(ADPatient *patient in patients){
            [patient itHurts];
        }
    
        //print the doctor's report
        for(ADDoctor * healer in healers){
            
            if([healer.report count] == 0){
                NSLog(@"%@ didn't see patients today.", healer.name);
                
            }else{
                NSLog(@"%@'s report: %@",healer.name, healer.report);
            }
        }
        
        //set patient's happines to random YES/NO
        if(i < days-1){
            for(ADPatient *patient in patients){
                patient.isHappy = arc4random()%2;
                
                //check if the patient is happy and change the doctor if necessary
                if(!patient.isHappy && [healers indexOfObject:patient.delegate] == [healers count]-1){
                    
                    patient.delegate = [healers objectAtIndex:0];
                    NSLog(@"Patient %@ is not happy and changed the doctor to %@", patient.patientName, patient.delegate);
        
                }else if(!patient.isHappy){
                    
                    patient.delegate = [healers objectAtIndex:[healers indexOfObject:patient.delegate]+1];
                    NSLog(@"Patient %@ is not happy and changed the doctor to %@", patient.patientName, patient.delegate);
                }else{
                    NSLog(@"Patient %@ is happy with the doctor %@. No change is needed.", patient.patientName, patient.delegate);
                }
            }
        }
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

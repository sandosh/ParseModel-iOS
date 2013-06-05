//
//  AppDelegate.m
//  ParseModel-iOS-Demo
//
//  Created by Christopher Constable on 6/3/13.
//  Copyright (c) 2013 Futura IO. All rights reserved.
//

#import <Parse/Parse.h>
#import "AppDelegate.h"

#import "TestObject.h"
#import "TestUser.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //////////////////////////////////////////////////////////////////////
    // TODO: Put your Parse keys here...
    //
    [Parse setApplicationId:@""
                  clientKey:@""];
    //
    //////////////////////////////////////////////////////////////////////
    
    // Create a new object and save it to our Parse account.
    TestObject *testObject = [TestObject parseModel];
    testObject.someString = @"Hello there";
    testObject.anInteger = 1255389;
    testObject.aDate = [NSDate date];
    
    // The underlying parse objects are exposed so you can save
    // however you'd like.
    [testObject.parseObject saveInBackground];
    
    // Create a new user and sign them up.
    TestUser *testUser = [TestUser parseModel];
    testUser.parseUser.username = @"user92378534862";
    testUser.parseUser.password = @"password";
    [testUser.parseUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            testUser.userFullName = @"Some Parse User";
            testUser.userAge = 25;
            [testUser.parseUser saveInBackground];
        }
    }];
    
    return YES;
}

@end
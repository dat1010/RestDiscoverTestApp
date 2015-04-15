//
//  AppDelegate.h
//  Rest
//
//  Created by David Tanner Jr on 4/8/15.
//  Copyright (c) 2015 David Tanner Jr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) IBOutlet UILabel *greetingId;
@property (nonatomic, strong) IBOutlet UILabel *greetingContent;

@property (strong, nonatomic) UIWindow *window;


@end


//
//  Remedie_ServerAppDelegate.m
//  Remedie Server
//
//  Created by Kohichi Aoki on 7/12/09.
//  Copyright 2009 drikin.com. All rights reserved.
//

#import "Remedie_ServerAppDelegate.h"

@implementation Remedie_ServerAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	NSLog(@"Hello world");
  [self createStatusBar];
}

@end


#pragma mark private methods
@implementation Remedie_ServerAppDelegate (Private)

- (void)createStatusBar
{
  // create status bar
  NSStatusBar *bar = [NSStatusBar systemStatusBar];
  
  statusBarItem = [bar statusItemWithLength : NSVariableStatusItemLength];
  [statusBarItem retain];
  [statusBarItem setTitle            : @""];
  [statusBarItem setImage            : [NSImage imageNamed:@"status_icon"]];
  [statusBarItem setToolTip          : @"Remedie Server"];
  [statusBarItem setHighlightMode    : YES];
  [statusBarItem setMenu             : statusBarMenu];
  [statusBarItem retain];
  return;
}

@end
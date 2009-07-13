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
  [self createStatusBar];
  [self run:self];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification
{
  [task stopProcess];
  [task release];
}

- (IBAction)run:(id)sender
{
  if (task != nil) {
    [task release];
  }

  NSBundle* bundle = [NSBundle mainBundle];
  NSString* scriptPath = [bundle pathForResource:@"script" ofType:@""];
  NSLog(@"%@", scriptPath);

  task=[[TaskWrapper alloc] initWithController:self 
                                     arguments:[NSArray arrayWithObjects:@"/bin/sh", scriptPath, nil]];
  [task startProcess];
  [task waitUntilExit];
  [task retain];
}

- (void)appendOutput:(NSString *)output
{
  [[consoleTextField textStorage] appendAttributedString: [[[NSAttributedString alloc]
                                                            initWithString: output] autorelease]];
}

- (void)processStarted
{
  [consoleTextField setString:@"Starting...\n"];
}

- (void)processFinished
{
  [consoleTextField setString:@"Finished.\n"];
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
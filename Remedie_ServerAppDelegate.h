//
//  Remedie_ServerAppDelegate.h
//  Remedie Server
//
//  Created by Kohichi Aoki on 7/12/09.
//  Copyright 2009 drikin.com. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "TaskWrapper.h"

@interface Remedie_ServerAppDelegate : NSObject <TaskWrapperController> {
  IBOutlet id           consoleTextField;
  IBOutlet id           statusBarMenu;
  IBOutlet id           statusBarItem;
  IBOutlet id           openConfirmPanel;
  
  NSWindow              *window;
  
  TaskWrapper           *task;
}

@property (assign) IBOutlet NSWindow *window;

- (IBAction)openRemedie:(id)sender;
- (IBAction)run:(id)sender;
- (IBAction)refresh:(id)sender;

@end


#pragma mark private methods
@interface Remedie_ServerAppDelegate (Private)
- (void)createStatusBar;
@end

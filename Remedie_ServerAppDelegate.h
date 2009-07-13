//
//  Remedie_ServerAppDelegate.h
//  Remedie Server
//
//  Created by Kohichi Aoki on 7/12/09.
//  Copyright 2009 drikin.com. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Remedie_ServerAppDelegate : NSObject {
    NSWindow              *window;
    NSMenu                *statusBarMenu;
    NSStatusItem          *statusBarItem;
}

@property (assign) IBOutlet NSWindow *window;

@end


#pragma mark private methods
@interface Remedie_ServerAppDelegate (Private)
- (void)createStatusBar;
@end

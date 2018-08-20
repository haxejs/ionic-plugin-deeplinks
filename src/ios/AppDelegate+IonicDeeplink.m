#import "AppDelegate.h"
#import "IonicDeeplinkPlugin.h"

static NSString *const PLUGIN_NAME = @"IonicDeeplinkPlugin";

/**
 *  Category for the AppDelegate that overrides application:continueUserActivity:restorationHandler method,
 *  so we could handle application launch when user clicks on the link in the browser.
 */
@interface AppDelegate (IonicDeeplinkPlugin)

- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray * _Nullable))restorationHandler;

@end

@implementation AppDelegate (IonicDeeplinkPlugin)

- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray *restorableObjects))restorationHandler {
    // Pass it off to our plugin
    IonicDeeplinkPlugin *plugin = [self.viewController getCommandInstance:PLUGIN_NAME];

    if(plugin == nil) {
      return NO;
    }

    BOOL handled = [plugin handleContinueUserActivity:userActivity];

    if(!handled) {
        // Continue sending the openURL request through
    }
    return YES;
}

@end

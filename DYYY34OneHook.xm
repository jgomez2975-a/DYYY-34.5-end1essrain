# Standard Logos one-hook baseline: no private Douyin classes.
#import <UIKit/UIKit.h>

%hook UIApplication

- (void)applicationDidBecomeActive:(UIApplication *)application {
    %orig(application);
}

%end

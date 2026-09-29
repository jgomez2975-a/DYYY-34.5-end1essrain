// DYYY 34.5 step 3: settings hooks, no private business modules
#import <UIKit/UIKit.h>

%hook UIApplication
- (void)applicationDidBecomeActive:(UIApplication *)application {
    %orig(application);
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"DYYY34Step3Loaded"];
}
%end

@interface AWESettingBaseViewController : UIViewController
- (BOOL)useCardUIStyle;
@end
%hook AWESettingBaseViewController
- (BOOL)useCardUIStyle { return YES; }
%end

@interface AWELeftSideBarWeatherLabel : UILabel
@end
%hook AWELeftSideBarWeatherLabel
- (id)initWithFrame:(CGRect)frame {
    id result = %orig(frame);
    self.hidden = YES;
    return result;
}
%end

@interface AWELeftSideBarWeatherView : UIView
@end
%hook AWELeftSideBarWeatherView
- (void)layoutSubviews {
    %orig;
    self.hidden = YES;
}
%end

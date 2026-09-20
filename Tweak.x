#import <UIKit/UIKit.h>

@interface SBIconView : UIView
@end

%hook SBIconView

- (void)layoutSubviews {
    %orig;
    @try {
        UIView *label = [self valueForKey:@"_labelView"];
        label.hidden = YES;
    } @catch (__unused NSException *e) {}
}

%end

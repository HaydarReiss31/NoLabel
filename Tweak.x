#import <UIKit/UIKit.h>

@interface SBIconView : UIView
@end

static void hideLabelViews(UIView *root) {
    for (UIView *sub in root.subviews) {
        NSString *name = NSStringFromClass([sub class]);
        if ([name containsString:@"Badge"]) continue; // rozetlere dokunma
        if ([name containsString:@"Label"]) {
            sub.hidden = YES;
            sub.alpha = 0.0;
        } else {
            hideLabelViews(sub);
        }
    }
}

%hook SBIconView

- (void)layoutSubviews {
    %orig;
    hideLabelViews(self);
}

%end

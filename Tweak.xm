#define PLIST_PATH @"/var/mobile/Library/Preferences/apt.sun.msettings.plist"

inline bool GetBool(NSString *key)

{

return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];

}

//Springboard

%hook SBIconListPageControl

-(id)initWithFrame:(CGRect)arg {

if(GetBool(@"HideTurnPoint")) {

return NULL;

}

return %orig;

}

%end

%hook SBDockView

-(void)layoutSubviews {

if(GetBool(@"HideDockBg")) {

return;

}

return %orig;

}

%end

%hook SBSpotlightSettings

-(bool)enableSpotlightOnMinusPage {

    if(GetBool(@"DisableLeftSearch")) {

        return FALSE;
}

return %orig;

}

%end

%hook SBSearchScrollView

-(bool)gestureRecognizerShouldBegin:(id)arg {

if(GetBool(@"DisableDownSearch")) {

return FALSE;

}

return %orig;

}

%end

%hook SBTodayViewController

-(id)todayTableFooterView {

if(GetBool(@"HideNCLogo")) {

return NULL;

}

return %orig;

}

%end

%hook SBNotificationSeparatorView

-(id)initWithFrame:(struct CGRect)arg1 mode:(long long)arg2 {

if(GetBool(@"HideNCLine")) {

return NULL;

}

return %orig;

}

%end

%hook UITableView

-(void)setSeparatorColor:(id)arg {

if(GetBool(@"HideGlobalLine")) {

return;

}

return %orig;

}

%end

%hook SBApplication

-(BOOL)supportsApplicationType:(int)arg {

if(GetBool(@"ForceAppFit"))

{

return TRUE;

}

return %orig;

}

%end

%hook SBLockScreenViewController

-(int) statusBarStyle {

    if(GetBool(@"SameStatusBar"))

{

        return 0;

}

return %orig;

}

%end

%hook SBTelephonyManager

-(bool)_lteConnectionShows4G {

    if(GetBool(@"ShowsLTE")) {

        return FALSE;

}

return %orig;

}

%end

%hook UIStatusBarForegroundStyleAttributes

-(BOOL)canShowBreadcrumbs {

if(GetBool(@"HideBackTo")) {

return FALSE;

}

return %orig;

}

%end

%hook UITextInputTraits

-(long long)keyboardAppearance {

if(GetBool(@"BlackKeyBoard")) {

return 1;

}

return %orig;

}

%end

%hook UITextField

-(void)setSecureTextEntry:(BOOL)arg1 {

if(GetBool(@"AllBoardPass")) {

arg1 = FALSE;

return %orig(arg1);

}

return %orig;

}

%end

//Settings

%hook PSSearchController

-(void)setSearchBarVisible:(BOOL)arg1 animated:(BOOL)arg2 {

if(GetBool(@"MakesSettingsTop")) {

arg1 = TRUE;

return %orig(arg1, arg2);

}

return %orig;

}

%end

//Phone

%hook PhoneTabBarController

-(void)showFavoritesTab:(BOOL)arg1 recentsTab:(BOOL)arg2 contactsTab:(BOOL)arg3 keypadTab:(BOOL)arg4 voicemailTab:(BOOL)arg5 {

if(GetBool(@"HideFavorite")) {

arg1 = FALSE;

return %orig(arg1, arg2, arg3, arg4, arg5);

}

return %orig;

}

-(int)defaultTabViewType {

if(GetBool(@"AlwaysDialPad")) {

return 4;

}

return %orig;

}

-(int)currentTabViewType {

if(GetBool(@"AlwaysDialPad")) {

return 4;

}

return %orig;

}

%end

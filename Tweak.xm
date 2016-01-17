//动态写法
#define SETTINGS_PLIST_PATH @"/var/mobile/Library/Preferences/apt.sun.msettings.plist"
inline bool PrefsBool(NSString *key)
{
	return [[[NSDictionary dictionaryWithContentsOfFile:SETTINGS_PLIST_PATH] valueForKey:key] boolValue];
}

//SpringBoard

//隐藏翻页小白点
%hook SBIconListPageControl
-(id)initWithFrame:(CGRect)arg {
	if(PrefsBool(@"HideTurnPoint")) {
		return nil;
	}
	return %orig;
}
%end

//隐藏Dock背景
%hook SBDockView
-(void)layoutSubviews {
	if(PrefsBool(@"HideDockBg")) {
		return;
	}
	%orig;
}
%end

//禁用左侧搜索
%hook SBSpotlightSettings
-(bool)enableSpotlightOnMinusPage {
	if(PrefsBool(@"DisableLeftSearch")) {
		return NO;
	}
	return %orig;
}
%end

//禁用下拉搜索
%hook SBSearchScrollView
-(bool)gestureRecognizerShouldBegin:(id)arg {
	if(PrefsBool(@"DisableDownSearch")) {
		return NO;
	}
	return %orig;
}
%end

//隐藏通知中心提供商
%hook SBTodayViewController
-(id)todayTableFooterView {
	if(PrefsBool(@"HideNCLogo")) {
		return nil;
	}
	return %orig;
}
%end

//隐藏通知中心分割线
%hook SBNotificationSeparatorView
-(id)initWithFrame:(struct CGRect)arg1 mode:(long long)arg2 {
	if(PrefsBool(@"HideNCLine")) {
		return nil;
	}
	return %orig;
}
%end

//隐藏全局分割线
%hook UITableView
-(void)setSeparatorColor:(id)arg {
	if(PrefsBool(@"HideGlobalLine")) {
		return;
	}
	%orig;
}
%end

//强制分辨率
%hook SBApplication
-(BOOL)supportsApplicationType:(int)arg {
	if(PrefsBool(@"ForceAppFit"))
	{
		return YES;
	}
	return %orig;
}
%end

//状态栏大小不变
%hook SBLockScreenViewController
-(int) statusBarStyle {
	if(PrefsBool(@"SameStatusBar"))
	{
		return 0;
	}
	return %orig;
}
%end

//LTE标识
%hook SBTelephonyManager
-(bool)_lteConnectionShows4G {
	if(PrefsBool(@"ShowsLTE")) {
		return NO;
	}
	return %orig;
}
%end

//隐藏返回xxx
%hook UIStatusBarForegroundStyleAttributes
-(BOOL)canShowBreadcrumbs {
	if(PrefsBool(@"HideBackTo")) {
		return NO;
	}
	return %orig;
}
%end

//黑色键盘
%hook UITextInputTraits
-(long long)keyboardAppearance {
	if(PrefsBool(@"BlackKeyBoard")) {
		return 1;
	}
	return %orig;
}
%end

//第三方输入法输密码
%hook UITextField
-(void)setSecureTextEntry:(BOOL)arg1 {
	if(PrefsBool(@"AllBoardPass")) {
		arg1 = 0;
	}
	%orig;
}
%end

//禁止控制中心回弹
%hook SBControlCenterSettings
-(bool)useNewBounce {
	if(PrefsBool(@"DisableCCBounce")) {
		return NO;
	}
	return %orig;
}
%end
//隐藏锁屏上下横杠
%hook SBLockScreenView
-(void)setBottomGrabberView:(id)arg {
	if(PrefsBool(@"HideLockScreenGrabber")) {
		arg = nil;
	}
	%orig;
}
-(bool)isBottomGrabberHidden {
	if(PrefsBool(@"HideLockScreenGrabber")) {
		return NO;
	}
	return %orig;
}
-(bool)isTopGrabberHidden {
	if(PrefsBool(@"HideLockScreenGrabber")) {
		return NO;
	}
	return %orig;
}
-(void)_layoutGrabberView:(id)arg1 atTop:(bool)arg2 {
	if(PrefsBool(@"HideLockScreenGrabber")) {
		arg2 = 0;
	}
	%orig;
}
-(void)_addGrabberViews {
	if(PrefsBool(@"HideLockScreenGrabber")) {
		return;
	}
	%orig;
}
-(void)setTopGrabberView:(id)arg {
	if(PrefsBool(@"HideLockScreenGrabber")) {
		return;
	}
	%orig;
}
%end
//iOS 多任务背景去磨砂
%hook SBAppSwitcherSettings
-(double) deckSwitcherBackgroundDarkeningFactor {
	if(PrefsBool(@"HideSwitcherBgDarkeningFactor")) {
		return 0;
	}
	return %orig;
}
-(double) deckSwitcherBackgroundBlurRadius {
	if(PrefsBool(@"HideSwitcherBgDarkeningFactor")) {
		return 0;
	}
	return %orig;
}
%end
//iOS 多任务去除主屏幕卡片磨砂
%hook SBSwitcherWallpaperPageContentView
-(id)wallpaperEffectView {
	if(PrefsBool(@"HideSwitcherCardDarkeningFactor")) {
		return nil;
	}
	return %orig;
}
%end
//Settings

//设置自动置顶
%hook PSSearchController
-(void)setSearchBarVisible:(BOOL)arg1 animated:(BOOL)arg2 {
	if(PrefsBool(@"MakesSettingsTop")) {
		arg1 = 1;
	}
	%orig;
}
%end
//隐藏设置搜索栏
%hook UISearchBar
-(id) initWithFrame:(CGRect)frame {
	if(PrefsBool(@"HideSetingsSearch")) {
		return nil;
	}
	return %orig;
}
-(void) dealloc {
	if(PrefsBool(@"HideSetingsSearch")) {
		return;
	}
	%orig;
}
-(id) init {
	if(PrefsBool(@"HideSetingsSearch")) {
		return nil;
	}
	return %orig;
}
%end
//隐藏设置应用程序列表
%hook PrefsListController
-(void) _loadThirdPartySpecifierslfNecessaryWithCompletion:(id)arg1 {
	if(PrefsBool(@"HideAppSettings")) {
		return;
	}
	%orig;
	
}
-(void) _loadThirdPartySpecifiersWithCompletion:(id)arg2 {
	if(PrefsBool(@"HideAppSettings")) {
		return;
	}
	%orig;
}
-(void) _reallyLoadThirdPartySpecifiersForProxies:(id) withCompletion:(id)arg3 {
	if(PrefsBool(@"HideAppSettings")) {
		return;
	}
	%orig;
}
%end //iOS 8

%hook PSUIPrefsListController
-(void) _loadThirdPartySpecifierslfNecessaryWithCompletion:(id)arg1 {
	if(PrefsBool(@"HideAppSettings")) {
		return;
	}
	%orig;
	
}
-(void) _loadThirdPartySpecifiersWithCompletion:(id)arg2 {
	if(PrefsBool(@"HideAppSettings")) {
		return;
	}
	%orig;
}
-(void) _reallyLoadThirdPartySpecifiersForProxies:(id) withCompletion:(id)arg3 {
	if(PrefsBool(@"HideAppSettings")) {
		return;
	}
	%orig;
}
%end //iOS 8


//Phone 隐藏收藏、默认拨号界面
%hook PhoneTabBarController
-(void)showFavoritesTab:(BOOL)arg1 recentsTab:(BOOL)arg2 contactsTab:(BOOL)arg3 keypadTab:(BOOL)arg4 voicemailTab:(BOOL)arg5 {
	if(PrefsBool(@"HideFavorite")) {
		arg1 = NO;
	}
	%orig;
}
-(int)defaultTabViewType {
	if(PrefsBool(@"AlwaysDialPad")) {
		return 4;
	}
	return %orig;
}

-(int)currentTabViewType {
	if(PrefsBool(@"AlwaysDialPad")) {
		return 4;
	}
	return %orig;
}
%end

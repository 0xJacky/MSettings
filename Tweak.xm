//动态写法
#define PLIST_PATH @"/var/mobile/Library/Preferences/apt.sun.msettings.plist"
inline bool GetBool(NSString *key)
{
	return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}

//SpringBoard

//隐藏翻页小白点
%hook SBIconListPageControl
-(id)initWithFrame:(CGRect)arg {
	if(GetBool(@"HideTurnPoint")) {
		return nil;
	}
	return %orig;
}
%end

//隐藏Dock背景
%hook SBDockView
-(void)layoutSubviews {
	if(GetBool(@"HideDockBg")) {
		return;
	}
	%orig;
}
%end

//隐藏左侧搜索
%hook SBSpotlightSettings
-(bool)enableSpotlightOnMinusPage {
	if(GetBool(@"DisableLeftSearch")) {
		return NO;
	}
	return %orig;
}
%end

//隐藏下拉搜索
%hook SBSearchScrollView
-(bool)gestureRecognizerShouldBegin:(id)arg {
	if(GetBool(@"DisableDownSearch")) {
		return NO;
	}
	return %orig;
}
%end

//隐藏通知中心提供商
%hook SBTodayViewController
-(id)todayTableFooterView {
	if(GetBool(@"HideNCLogo")) {
		return NULL;
	}
	return %orig;
}
%end

//隐藏通知中心分割线
%hook SBNotificationSeparatorView
-(id)initWithFrame:(struct CGRect)arg1 mode:(long long)arg2 {
	if(GetBool(@"HideNCLine")) {
		return NULL;
	}
	return %orig;
}
%end

//隐藏全局分割线
%hook UITableView
-(void)setSeparatorColor:(id)arg {
	if(GetBool(@"HideGlobalLine")) {
		return;
	}
	return %orig;
}
%end

//强制分辨率
%hook SBApplication
-(BOOL)supportsApplicationType:(int)arg {
	if(GetBool(@"ForceAppFit"))
	{
		return YES;
	}
	return %orig;
}
%end

//状态栏大小不变
%hook SBLockScreenViewController
-(int) statusBarStyle {
	if(GetBool(@"SameStatusBar"))
	{
		return 0;
	}
	return %orig;
}
%end

//LTE标识
%hook SBTelephonyManager
-(bool)_lteConnectionShows4G {
	if(GetBool(@"ShowsLTE")) {
		return NO;
	}
	return %orig;
}
%end

//隐藏返回xxx
%hook UIStatusBarForegroundStyleAttributes
-(BOOL)canShowBreadcrumbs {
	if(GetBool(@"HideBackTo")) {
		return NO;
	}
	return %orig;
}
%end

//黑色键盘
%hook UITextInputTraits
-(long long)keyboardAppearance {
	if(GetBool(@"BlackKeyBoard")) {
		return 1;
	}
	return %orig;
}
%end

//第三方输入法输密码
%hook UITextField
-(void)setSecureTextEntry:(BOOL)arg1 {
	if(GetBool(@"AllBoardPass")) {
		arg1 = 0;
		return %orig(arg1);
	}
	return %orig;
}

%end

//禁止控制中心回弹
%hook SBControlCenterSettings
-(bool)useNewBounce {
	if(GetBool(@"DisableCCBounce")) {
		return NO;
	}
	return %orig;
}

%end

//Settings

//设置自动置顶
%hook PSSearchController
-(void)setSearchBarVisible:(BOOL)arg1 animated:(BOOL)arg2 {
	if(GetBool(@"MakesSettingsTop")) {
		arg1 = 1;
		return %orig(arg1, arg2);
	}
	%orig;
}
%end

//Phone 隐藏收藏、默认拨号界面
%hook PhoneTabBarController
-(void)showFavoritesTab:(BOOL)arg1 recentsTab:(BOOL)arg2 contactsTab:(BOOL)arg3 keypadTab:(BOOL)arg4 voicemailTab:(BOOL)arg5 {
	if(GetBool(@"HideFavorite")) {
		arg1 = NO;
		return %orig(arg1, arg2, arg3, arg4, arg5);
	}
	%orig;
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

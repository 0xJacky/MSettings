#ifndef kCFCoreFoundationVersionNumber_iOS_9_0
#define kCFCoreFoundationVersionNumber_iOS_9_0 1240.10
#endif

static BOOL Enabled = YES;

static BOOL HideAppSettings = NO;
static BOOL MakesSettingsTop = NO;
static BOOL HideSetingsSearch = NO;
static BOOL HideFavorite = NO;
static BOOL AlwaysDialPad = NO;
static BOOL HideVoiceEmail = NO;

static void initPrefs()
{
	NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/apt.sun.msettings.plist"];
	if(prefs) {
		Enabled = ([prefs objectForKey:@"Enabled"] ? [[prefs objectForKey:@"Enabled"] boolValue] : Enabled );

		MakesSettingsTop = ([prefs objectForKey:@"MakesSettingsTop"] ? [[prefs objectForKey:@"MakesSettingsTop"] boolValue] : MakesSettingsTop );
		HideSetingsSearch = ([prefs objectForKey:@"HideSetingsSearch"] ? [[prefs objectForKey:@"HideSetingsSearch"] boolValue] : HideSetingsSearch );
		HideAppSettings = ([prefs objectForKey:@"HideAppSettings"] ? [[prefs objectForKey:@"HideAppSettings"] boolValue] : HideAppSettings );
		HideFavorite = ([prefs objectForKey:@"HideFavorite"] ? [[prefs objectForKey:@"HideFavorite"] boolValue] : HideFavorite );
		AlwaysDialPad = ([prefs objectForKey:@"AlwaysDialPad"] ? [[prefs objectForKey:@"AlwaysDialPad"] boolValue] : AlwaysDialPad );
		HideVoiceEmail = ([prefs objectForKey:@"HideVoiceEmail"] ? [[prefs objectForKey:@"HideVoiceEmail"] boolValue] : HideVoiceEmail );
	}

	[prefs release];
}
/* Settings */
//设置自动置顶
%hook PSSearchController
- (void)setSearchBarVisible:(BOOL)arg1 animated:(BOOL)arg2 {
	if(MakesSettingsTop && Enabled) {
		arg1 = 1;
	}
	%orig;
}
%end
//隐藏设置搜索栏
%hook UISearchBar
- (id)initWithFrame:(CGRect)frame {
	if(HideSetingsSearch && Enabled) {
		return nil;
	}
	return %orig;
}
- (void)dealloc {
	if(HideSetingsSearch && Enabled) {
		return;
	}
	%orig;
}
- (id)init {
	if(HideSetingsSearch && Enabled) {
		return nil;
	}
	return %orig;
}
%end
//隐藏设置应用程序列表
%group iOS78
%hook PrefsListController
- (void)_loadThirdPartySpecifierslfNecessaryWithCompletion:(id)arg1 {
	if(HideAppSettings && Enabled) {
		return;
	}
	%orig;

}
- (void)_loadThirdPartySpecifiersWithCompletion:(id)arg2 {
	if(HideAppSettings && Enabled) {
		return;
	}
	%orig;
}
- (void)_reallyLoadThirdPartySpecifiersForProxies:(id) withCompletion:(id)arg3 {
	if(HideAppSettings && Enabled) {
		return;
	}
	%orig;
}
%end
%end

%group iOS9
%hook PSUIPrefsListController
- (void)_loadThirdPartySpecifierslfNecessaryWithCompletion:(id)arg1 {
	if(HideAppSettings && Enabled) {
		return;
	}
	%orig;

}
- (void)_loadThirdPartySpecifiersWithCompletion:(id)arg2 {
	if(HideAppSettings && Enabled) {
		return;
	}
	%orig;
}
- (void)_reallyLoadThirdPartySpecifiersForProxies:(id) withCompletion:(id)arg3 {
	if(HideAppSettings && Enabled) {
		return;
	}
	%orig;
}
%end
%end
/* Phone */
%hook PhoneTabBarController
//隐藏收藏
- (void)showFavoritesTab:(BOOL)arg1 recentsTab:(BOOL)arg2 contactsTab:(BOOL)arg3 keypadTab:(BOOL)arg4 voicemailTab:(BOOL)arg5 {
	if(HideFavorite && Enabled) {
		arg1 = NO;
	}
	if(HideVoiceEmail && Enabled) {
		arg5 = NO;
	}
	%orig;
}
//默认拨号界面
- (int)defaultTabViewType {
	if(AlwaysDialPad && Enabled) {
		return 4;
	}
	return %orig;
}

- (int)currentTabViewType {
	if(AlwaysDialPad && Enabled) {
		return 4;
	}
	return %orig;
}
%end

%ctor
{
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)initPrefs, CFSTR("apt.sun.msettings/settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
	initPrefs();
	if (kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_iOS_9_0) {
		%init(iOS9);
	} else {
		%init(iOS78);
	}
	%init();
}

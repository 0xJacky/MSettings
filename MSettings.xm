#define DPKG_PATH @"/var/lib/dpkg/info/apt.sun.msettings.list"

#ifndef kCFCoreFoundationVersionNumber_iOS_9_0
#define kCFCoreFoundationVersionNumber_iOS_9_0 1240.10
#endif

static BOOL Enabled = YES;

static BOOL HideTurnPoint = NO;
static BOOL HideDockBg = NO;
static BOOL DisableLeftSearch = NO;
static BOOL DisableDownSearch = NO;
static BOOL HideNCLogo = NO;
static BOOL HideNCLine = NO;
static BOOL ForceAppFit = NO;
static BOOL SameStatusBar = NO;
static BOOL ShowsLTE = NO;
static BOOL DisableCCBounce = NO;
static BOOL HideLockScreenGrabber = NO;
static BOOL HideSwitcherBgDarkeningFactor = NO;
static BOOL HideSwitcherCardDarkeningFactor = NO;
static BOOL MakesSettingsTop = NO;
static BOOL HideSetingsSearch = NO;
static BOOL HideAppSettings = NO;
static BOOL HideFavorite = NO;
static BOOL AlwaysDialPad = NO;
static BOOL enableAnimationspeed = NO;
static BOOL HideFolderBg  = NO;
static BOOL DisableVoiceControl = NO;
static BOOL HideCCDarkBg = NO;
static BOOL HideCCAirDrop = NO;
static BOOL HideCCToggle = NO;
static BOOL HideBrightnessSection = NO;
static BOOL HideMediaControls = NO;
static BOOL HideLaunchSection = NO;
static BOOL HideUnlockText = NO;
static BOOL HideUnlockSlider = NO;
static BOOL HideLCMusicControl = NO;
static BOOL HideLCCamera = NO;
static BOOL HideNCCalendar = NO;
static BOOL HideLunarDate = NO;
static BOOL HideNCConfigureButton = NO;
static BOOL CustomOperator = NO;
static NSString *customOperator;
static NSString *customUnlockText;

static CGFloat Animationspeed = 0.5;
NSFileManager *manager = [NSFileManager defaultManager];

static void initPrefs()
{
	NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/apt.sun.msettings.plist"];
	if(prefs) {
		Enabled = ([prefs objectForKey:@"Enabled"] ? [[prefs objectForKey:@"Enabled"] boolValue] : Enabled );

		HideTurnPoint = ([prefs objectForKey:@"HideTurnPoint"] ? [[prefs objectForKey:@"HideTurnPoint"] boolValue] : HideTurnPoint );
		HideDockBg = ([prefs objectForKey:@"HideDockBg"] ? [[prefs objectForKey:@"HideDockBg"] boolValue] : HideDockBg );
		DisableLeftSearch = ([prefs objectForKey:@"DisableLeftSearch"] ? [[prefs objectForKey:@"DisableLeftSearch"] boolValue] : DisableLeftSearch );
		DisableDownSearch = ([prefs objectForKey:@"DisableDownSearch"] ? [[prefs objectForKey:@"DisableDownSearch"] boolValue] : DisableDownSearch );
		HideNCLogo = ([prefs objectForKey:@"HideNCLogo"] ? [[prefs objectForKey:@"HideNCLogo"] boolValue] : HideNCLogo );
		HideNCLine = ([prefs objectForKey:@"HideNCLine"] ? [[prefs objectForKey:@"HideNCLine"] boolValue] : HideNCLine );
		ForceAppFit = ([prefs objectForKey:@"ForceAppFit"] ? [[prefs objectForKey:@"ForceAppFit"] boolValue] : ForceAppFit );
		SameStatusBar = ([prefs objectForKey:@"SameStatusBar"] ? [[prefs objectForKey:@"SameStatusBar"] boolValue] : SameStatusBar );
		ShowsLTE = ([prefs objectForKey:@"ShowsLTE"] ? [[prefs objectForKey:@"ShowsLTE"] boolValue] : ShowsLTE );
		DisableCCBounce = ([prefs objectForKey:@"DisableCCBounce"] ? [[prefs objectForKey:@"DisableCCBounce"] boolValue] : DisableCCBounce );
		HideLockScreenGrabber = ([prefs objectForKey:@"HideLockScreenGrabber"] ? [[prefs objectForKey:@"HideLockScreenGrabber"] boolValue] : HideLockScreenGrabber );
		HideSwitcherBgDarkeningFactor = ([prefs objectForKey:@"HideSwitcherBgDarkeningFactor"] ? [[prefs objectForKey:@"HideSwitcherBgDarkeningFactor"] boolValue] : HideSwitcherBgDarkeningFactor );
		HideSwitcherCardDarkeningFactor = ([prefs objectForKey:@"HideSwitcherCardDarkeningFactor"] ? [[prefs objectForKey:@"HideSwitcherCardDarkeningFactor"] boolValue] : HideSwitcherCardDarkeningFactor );
		MakesSettingsTop = ([prefs objectForKey:@"MakesSettingsTop"] ? [[prefs objectForKey:@"MakesSettingsTop"] boolValue] : MakesSettingsTop );
		HideSetingsSearch = ([prefs objectForKey:@"HideSetingsSearch"] ? [[prefs objectForKey:@"HideSetingsSearch"] boolValue] : HideSetingsSearch );
		HideAppSettings = ([prefs objectForKey:@"HideAppSettings"] ? [[prefs objectForKey:@"HideAppSettings"] boolValue] : HideAppSettings );
		HideFavorite = ([prefs objectForKey:@"HideFavorite"] ? [[prefs objectForKey:@"HideFavorite"] boolValue] : HideFavorite );
		AlwaysDialPad = ([prefs objectForKey:@"AlwaysDialPad"] ? [[prefs objectForKey:@"AlwaysDialPad"] boolValue] : AlwaysDialPad );
		enableAnimationspeed = ([prefs objectForKey:@"enableAnimationspeed"] ? [[prefs objectForKey:@"enableAnimationspeed"] boolValue] : enableAnimationspeed );
		Animationspeed = ([prefs objectForKey:@"Animationspeed"] ? [[prefs objectForKey:@"Animationspeed"] floatValue] : Animationspeed );
		HideFolderBg = ([prefs objectForKey:@"HideFolderBg"] ? [[prefs objectForKey:@"HideFolderBg"] boolValue] : HideFolderBg );
		DisableVoiceControl = ([prefs objectForKey:@"DisableVoiceControl"] ? [[prefs objectForKey:@"DisableVoiceControl"] boolValue] : DisableVoiceControl );
		HideCCDarkBg = ([prefs objectForKey:@"HideCCDarkBg"] ? [[prefs objectForKey:@"HideCCDarkBg"] boolValue] : HideCCDarkBg );
		HideCCAirDrop = ([prefs objectForKey:@"HideCCAirDrop"] ? [[prefs objectForKey:@"HideCCAirDrop"] boolValue] : HideCCAirDrop );
		HideCCToggle = ([prefs objectForKey:@"HideCCToggle"] ? [[prefs objectForKey:@"HideCCToggle"] boolValue] : HideCCToggle );
		HideBrightnessSection = ([prefs objectForKey:@"HideBrightnessSection"] ? [[prefs objectForKey:@"HideBrightnessSection"] boolValue] : HideBrightnessSection );
		HideMediaControls = ([prefs objectForKey:@"HideMediaControls"] ? [[prefs objectForKey:@"HideMediaControls"] boolValue] : HideMediaControls );
		HideLaunchSection = ([prefs objectForKey:@"HideLaunchSection"] ? [[prefs objectForKey:@"HideLaunchSection"] boolValue] : HideLaunchSection );
		HideUnlockText = ([prefs objectForKey:@"HideUnlockText"] ? [[prefs objectForKey:@"HideUnlockText"] boolValue] : HideUnlockText );
		HideUnlockSlider = ([prefs objectForKey:@"HideUnlockSlider"] ? [[prefs objectForKey:@"HideUnlockSlider"] boolValue] : HideUnlockSlider );
		HideLCMusicControl = ([prefs objectForKey:@"HideLCMusicControl"] ? [[prefs objectForKey:@"HideLCMusicControl"] boolValue] : HideLCMusicControl );
		HideLCCamera = ([prefs objectForKey:@"HideLCCamera"] ? [[prefs objectForKey:@"HideLCCamera"] boolValue] : HideCCToggle );
		HideNCCalendar = ([prefs objectForKey:@"HideNCCalendar"] ? [[prefs objectForKey:@"HideNCCalendar"] boolValue] : HideNCCalendar );
		HideLunarDate = ([prefs objectForKey:@"HideLunarDate"] ? [[prefs objectForKey:@"HideLunarDate"] boolValue] : HideLunarDate );
		HideNCConfigureButton = ([prefs objectForKey:@"HideNCConfigureButton"] ? [[prefs objectForKey:@"HideNCConfigureButton"] boolValue] : HideNCConfigureButton );
		CustomOperator = ([prefs objectForKey:@"CustomOperator"] ? [[prefs objectForKey:@"CustomOperator"] boolValue] : CustomOperator );
		customOperator = ([prefs objectForKey:@"customOperator"] ? [prefs objectForKey:@"customOperator"] : customOperator);
		customUnlockText = ([prefs objectForKey:@"customUnlockText"] ? [prefs objectForKey:@"customUnlockText"] : customUnlockText);
	}

	[prefs release];
	[customOperator retain];
	[customUnlockText retain];
}
/* SpringBoard */
//Do a check for DPKG_PATH
%hook SpringBoard
- (void)applicationDidFinishLaunching:(id)arg1 {
	%orig;
	if (![manager fileExistsAtPath:DPKG_PATH]) {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"警告"
			message:@"MSettings 的软件包标示符被篡改！\n意味着你安装的不是来自官方源的 MSettings\n请添加 S™ 中文源（http://apt.Sunbelife.com)来获取官方版本!"
			delegate:nil
			cancelButtonTitle:@"好的"
			otherButtonTitles:nil];
		[alert show];
		[alert release];
	}
}
%end
//隐藏翻页小白点
%hook SBIconListPageControl
- (id)initWithFrame:(CGRect)arg {
	if(HideTurnPoint && Enabled) {
		return nil;
	}
	return %orig;
}
%end

//隐藏Dock背景
%hook SBDockView
- (void)layoutSubviews {
	if(HideDockBg && Enabled) {
		return;
	}
	%orig;
}
%end

//禁用左侧搜索
%hook SBSpotlightSettings
- (bool)enableSpotlightOnMinusPage {
	if(DisableLeftSearch && Enabled) {
		return NO;
	}
	return %orig;
}
%end

//禁用下拉搜索
%hook SBSearchScrollView
- (bool)gestureRecognizerShouldBegin:(id)arg {
	if(DisableDownSearch && Enabled) {
		return NO;
	}
	return %orig;
}
%end

//隐藏通知中心提供商
%hook SBTodayViewController
- (id)todayTableFooterView {
	if(HideNCLogo && Enabled) {
		return nil;
	}
	return %orig;
}
%end

//隐藏通知中心分割线
%hook SBNotificationSeparatorView
- (id)initWithFrame:(struct CGRect)arg1 mode:(long long)arg2 {
	if(HideNCLine && Enabled) {
		return nil;
	}
	return %orig;
}
%end

//强制分辨率
%hook SBApplication
- (BOOL)supportsApplicationType:(int)arg {
	if(ForceAppFit && Enabled)
	{
		return YES;
	}
	return %orig;
}
%end

//锁屏 状态栏大小不变
%hook SBLockScreenViewController
- (int)statusBarStyle {
	if (SameStatusBar && Enabled) {
		return 0;
	}
	return %orig;
}
//锁屏 隐藏音乐播放示图
- (void)setMediaControlsHidden:(bool)arg1 forRequester:(id)arg2 withAnimationFactory:(id)arg3 {
	if (HideLCMusicControl && Enabled) {
		arg1 = 1;
		arg3 = nil;
	}
	%orig;
}
//锁屏 隐藏滑动解锁文字
/*- (id)_defaultSlideToUnlockText {
	if (HideUnlockText && Enabled) {
		return nil;
	}
	if (Enabled && customUnlockText) {

	    return customUnlockText;
	}
	return %orig;
}*/
%end
%hook SBLockScreenNowPlayingPluginController
- (id)initWithLockScreenViewController:(id)arg1 mediaController:(id)arg2 {
	if (HideLCMusicControl && Enabled) {
		arg2 = nil;
	}
	return %orig;
}
%end
//LTE标识
%hook SBTelephonyManager
- (bool)_lteConnectionShows4G {
	if(ShowsLTE && Enabled) {
		return NO;
	}
	return %orig;
}
//自定义运营商
- (void)_reallySetOperatorName:(id)arg {
	if (Enabled && CustomOperator) {
		if (customOperator) {
			arg = customOperator;
		}
	}
	%orig(arg);
}
%end
//禁止控制中心回弹
%hook SBControlCenterSettings
- (bool)useNewBounce {
	if(DisableCCBounce && Enabled) {
		return NO;
	}
	return %orig;
}
%end
//隐藏锁屏上下横杠
%hook SBLockScreenView
- (void)setBottomGrabberView:(id)arg {
	if(HideLockScreenGrabber && Enabled) {
		arg = nil;
	}
	%orig;
}
- (bool)isBottomGrabberHidden {
	if(HideLockScreenGrabber && Enabled) {
		return NO;
	}
	return %orig;
}
- (bool)isTopGrabberHidden {
	if(HideLockScreenGrabber && Enabled) {
		return NO;
	}
	return %orig;
}
- (void)_layoutGrabberView:(id)arg1 atTop:(bool)arg2 {
	if(HideLockScreenGrabber && Enabled) {
		arg2 = 0;
	}
	%orig;
}
- (void)_addGrabberViews {
	if(HideLockScreenGrabber && Enabled) {
		return;
	}
	%orig;
}
- (void)setTopGrabberView:(id)arg {
	if(HideLockScreenGrabber && Enabled) {
		return;
	}
	%orig;
}
- (id)_defaultSlideToUnlockText {
	if (HideUnlockText && Enabled) {
		return nil;
	}	else if (!Enabled || customUnlockText == nil || [customUnlockText isEqualToString:@""]) {
		return %orig;
	}
	if (Enabled && customUnlockText) {
	    return customUnlockText;
	}
	return %orig;
}
%end
//iOS 多任务背景去磨砂
%hook SBAppSwitcherSettings
- (double)deckSwitcherBackgroundDarkeningFactor {
	if(HideSwitcherBgDarkeningFactor && Enabled) {
		return 0;
	}
	return %orig;
}
- (double)deckSwitcherBackgroundBlurRadius {
	if(HideSwitcherBgDarkeningFactor && Enabled) {
		return 0;
	}
	return %orig;
}
%end
//iOS 多任务去除主屏幕卡片磨砂
%hook SBSwitcherWallpaperPageContentView
- (id)wallpaperEffectView {
	if(HideSwitcherCardDarkeningFactor && Enabled) {
		return nil;
	}
	return %orig;
}
%end
//锁屏 隐藏解锁滑块
%hook _UIGlintyStringView
- (id)chevron {
	if (HideUnlockSlider && Enabled) {
		return nil;
	}
	return %orig;
}
%end
//动画持续时间
%group iOS9
%hook SBAnimationFactorySettings
- (BOOL)slowAnimations {
	return enableAnimationspeed;
}
- (CGFloat)slowDownFactor {
	if (enableAnimationspeed && Enabled) {
		return Animationspeed;
	} else {
		return %orig();
	}
}
%end
%end

%group iOS78
%hook SBFAnimationFactorySettings
- (BOOL) slowAnimations {
	return enableAnimationspeed;
}

- (CGFloat) slowDownFactor {
	if (enableAnimationspeed && Enabled) {
		return Animationspeed;
	} else {
		return %orig();
	}

}
%end
%end
//修复闪屏
%hook SBFadeAnimationSettings
- (CGFloat) backlightFadeDuration {
	if (enableAnimationspeed && Enabled) {
		if (Animationspeed <= 0.30)
		{
			return 0.1;
		}
		else if (Animationspeed <= 0.10)
		{
			return 0.0;
		}
		else
		{
			return 0.2;
		}
	}
	else
	{
		return %orig();
	}
}
%end
//隐藏文件夹背景
%hook SBFolderBackgroundView
- (id) initWithFrame:(CGRect)arg1 {
	if (HideFolderBg && Enabled) {
		return nil;
	}
	return %orig;
}
%end
//禁用语言控制
%hook SBVoiceControlController
- (BOOL)handleHomeButtonHeld {
	if (DisableVoiceControl && Enabled) {
		return NO;
	}
	return %orig;
}
%end
//控制中心 禁用背景色差
%hook SBCCBrightnessSectionController
- (bool)_shouldDarkenBackground {
	if (HideCCDarkBg && Enabled) {
		return nil;
	}
	return %orig;
}
%end
//控制中心
%hook SBControlCenterContentView
//控制中心 隐藏快捷开关
- (id)settingsSection {
	if (HideCCToggle && Enabled) {
		return nil;
	}
	return %orig;
}
//控制中心 隐藏亮度滑块
- (void)setBrightnessSection:(id)arg1 {
	if (HideBrightnessSection && Enabled) {
		return;
	}
	%orig;
}
//控制中心 隐藏音乐控制
- (void)setMediaControlsSection:(id)arg1 {
	if (HideMediaControls && Enabled) {
		arg1 = nil;
	}
	%orig;
}
- (id)mediaControlsSection {
	if (HideMediaControls && Enabled) {
		return nil;
	}
	return %orig;
}
//控制中心 隐藏快速启动
- (id)quickLaunchSection {
	if (HideLaunchSection && Enabled) {
		return nil;
	}
	return %orig;
}
//控制中心 隐藏AirDrop/AirPlay
- (void)setAirplaySection:(id)arg1 {
	if (HideCCAirDrop && Enabled) {
		return;
	}
	%orig;
}
%end
//锁屏
%hook SBSlideUpAppGrabberView
//锁屏 隐藏相机图标
- (void)setBackgroundColor:(id)arg1 {
	if (HideLCCamera && Enabled) {
		return;
	}
	%orig;
}
- (BOOL)_shouldUseVibrancy {
	if (HideLCCamera && Enabled) {
		return NO;
	}
	return %orig;
}
%end
//通知中心 隐藏日历
%hook SBTodayTableHeaderView
- (id)initWithFrame:(CGRect)arg1 {
	if (HideNCCalendar && Enabled) {
		return nil;
	}
	return %orig;
}
//通知中心 隐藏农历
- (bool)showsLunarDate {
	if (HideLunarDate && Enabled) {
		return NO;
	}
	return %orig;
}
%end
//通知中心 隐藏编辑按钮
%hook SBNotificationVibrantButton
- (void)_configureButton:(id*)arg1 withSettings:(id)arg2 {
	if (HideNCConfigureButton && Enabled) {
		return;
	}
	%orig;
}
%end
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
//Phone 隐藏收藏、默认拨号界面
%hook PhoneTabBarController
- (void)showFavoritesTab:(BOOL)arg1 recentsTab:(BOOL)arg2 contactsTab:(BOOL)arg3 keypadTab:(BOOL)arg4 voicemailTab:(BOOL)arg5 {
	if(HideFavorite && Enabled) {
		arg1 = NO;
	}
	%orig;
}
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

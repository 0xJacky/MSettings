#define DPKG_PATH @"/var/lib/dpkg/info/apt.sun.msettings.list"

@interface SBWallpaperEffectView : UIView
@end

#ifndef kCFCoreFoundationVersionNumber_iOS_9_0
#define kCFCoreFoundationVersionNumber_iOS_9_0 1240.10
#endif

static BOOL Enabled = YES;

static BOOL HideTurnPoint = NO;
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
static BOOL HideIconName = NO;
static BOOL HideFolderName = NO;
static BOOL enableAnimationspeed = NO;
static BOOL HideFolderBg  = NO;
static BOOL HideFolderCloseBg  = NO;
static BOOL DisableVoiceControl = NO;
static BOOL HideCCDarkBg = NO;
static BOOL HideCCAirDrop = NO;
static BOOL HideCCToggle = NO;
static BOOL HideBrightnessSection = NO;
static BOOL HideMediaControls = NO;
static BOOL HideLaunchSection = NO;
static BOOL CustomUnlockText = NO;
static BOOL HideUnlockSlider = NO;
static BOOL HideLCMusicControl = NO;
static BOOL HideLCCamera = NO;
static BOOL HideNCCalendar = NO;
static BOOL HideLunarDate = NO;
static BOOL HideNCConfigureButton = NO;
static BOOL HideLCClock = NO;
static BOOL CustomOperator = NO;
static BOOL LSSTatusBarTime = NO;
static BOOL HideStatusBarBattery = NO;
static NSString *customOperator;
static NSString *customUnlockText;
static CGFloat Animationspeed = 0.5;
static int DockStyle = 1;
NSFileManager *manager = [NSFileManager defaultManager];

static void initPrefs()
{
	NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/apt.sun.msettings.plist"];
	if(prefs) {
		Enabled = ([prefs objectForKey:@"Enabled"] ? [[prefs objectForKey:@"Enabled"] boolValue] : Enabled );

		HideTurnPoint = ([prefs objectForKey:@"HideTurnPoint"] ? [[prefs objectForKey:@"HideTurnPoint"] boolValue] : HideTurnPoint );
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
		HideIconName = ([prefs objectForKey:@"HideIconName"] ? [[prefs objectForKey:@"HideIconName"] boolValue] : HideIconName );
		HideFolderName = ([prefs objectForKey:@"HideFolderName"] ? [[prefs objectForKey:@"HideFolderName"] boolValue] : HideFolderName );
		enableAnimationspeed = ([prefs objectForKey:@"enableAnimationspeed"] ? [[prefs objectForKey:@"enableAnimationspeed"] boolValue] : enableAnimationspeed );
		Animationspeed = ([prefs objectForKey:@"Animationspeed"] ? [[prefs objectForKey:@"Animationspeed"] floatValue] : Animationspeed );
		HideFolderBg = ([prefs objectForKey:@"HideFolderBg"] ? [[prefs objectForKey:@"HideFolderBg"] boolValue] : HideFolderBg );
		HideFolderCloseBg = ([prefs objectForKey:@"HideFolderCloseBg"] ? [[prefs objectForKey:@"HideFolderCloseBg"] boolValue] : HideFolderCloseBg );
		DisableVoiceControl = ([prefs objectForKey:@"DisableVoiceControl"] ? [[prefs objectForKey:@"DisableVoiceControl"] boolValue] : DisableVoiceControl );
		HideCCDarkBg = ([prefs objectForKey:@"HideCCDarkBg"] ? [[prefs objectForKey:@"HideCCDarkBg"] boolValue] : HideCCDarkBg );
		HideCCAirDrop = ([prefs objectForKey:@"HideCCAirDrop"] ? [[prefs objectForKey:@"HideCCAirDrop"] boolValue] : HideCCAirDrop );
		HideCCToggle = ([prefs objectForKey:@"HideCCToggle"] ? [[prefs objectForKey:@"HideCCToggle"] boolValue] : HideCCToggle );
		HideBrightnessSection = ([prefs objectForKey:@"HideBrightnessSection"] ? [[prefs objectForKey:@"HideBrightnessSection"] boolValue] : HideBrightnessSection );
		HideMediaControls = ([prefs objectForKey:@"HideMediaControls"] ? [[prefs objectForKey:@"HideMediaControls"] boolValue] : HideMediaControls );
		HideLaunchSection = ([prefs objectForKey:@"HideLaunchSection"] ? [[prefs objectForKey:@"HideLaunchSection"] boolValue] : HideLaunchSection );
		CustomUnlockText = ([prefs objectForKey:@"CustomUnlockText"] ? [[prefs objectForKey:@"CustomUnlockText"] boolValue] : CustomUnlockText );
		HideUnlockSlider = ([prefs objectForKey:@"HideUnlockSlider"] ? [[prefs objectForKey:@"HideUnlockSlider"] boolValue] : HideUnlockSlider );
		HideLCMusicControl = ([prefs objectForKey:@"HideLCMusicControl"] ? [[prefs objectForKey:@"HideLCMusicControl"] boolValue] : HideLCMusicControl );
		HideLCCamera = ([prefs objectForKey:@"HideLCCamera"] ? [[prefs objectForKey:@"HideLCCamera"] boolValue] : HideCCToggle );
		HideNCCalendar = ([prefs objectForKey:@"HideNCCalendar"] ? [[prefs objectForKey:@"HideNCCalendar"] boolValue] : HideNCCalendar );
		HideLunarDate = ([prefs objectForKey:@"HideLunarDate"] ? [[prefs objectForKey:@"HideLunarDate"] boolValue] : HideLunarDate );
		HideNCConfigureButton = ([prefs objectForKey:@"HideNCConfigureButton"] ? [[prefs objectForKey:@"HideNCConfigureButton"] boolValue] : HideNCConfigureButton );
		HideLCClock = ([prefs objectForKey:@"HideLCClock"] ? [[prefs objectForKey:@"HideLCClock"] boolValue] : HideLCClock );
		LSSTatusBarTime = ([prefs objectForKey:@"LSSTatusBarTime"] ? [[prefs objectForKey:@"LSSTatusBarTime"] boolValue] : LSSTatusBarTime );
		CustomOperator = ([prefs objectForKey:@"CustomOperator"] ? [[prefs objectForKey:@"CustomOperator"] boolValue] : CustomOperator );
		HideStatusBarBattery = ([prefs objectForKey:@"HideStatusBarBattery"] ? [[prefs objectForKey:@"HideStatusBarBattery"] boolValue] : HideStatusBarBattery );
		customOperator = ([prefs objectForKey:@"customOperator"] ? [prefs objectForKey:@"customOperator"] : customOperator);
		customUnlockText = ([prefs objectForKey:@"customUnlockText"] ? [prefs objectForKey:@"customUnlockText"] : customUnlockText);
		DockStyle = ([prefs objectForKey:@"DockStyle"] ? [[prefs objectForKey:@"DockStyle"] intValue] : DockStyle );
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
			message:@"感谢您安装 MSettings，这是一款免费又实用的系统深度定制插件，但是您的 MSettings 软件包标识符已被篡改！这意味着您正在使用着盗版插件，为了您的设备与个人隐私的安全，请添加 S™ 中文源（http://apt.Sunbelife.com)来获取官方发行的版本!特别提醒，即使检测系统被破解但仍具有法律效力，从非官方源安装的软件在使用过程中出现了任何问题与作者无关！@0xJacky 保留追究破解者法律责任的权力！"
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
	%orig;
	SBWallpaperEffectView *dockBackground = MSHookIvar<SBWallpaperEffectView *>(self, "_backgroundView");
	UIView * backgroundView = MSHookIvar<UIView *>(self, "_backgroundView");
	UIView * highLightView = MSHookIvar<UIView *>(self, "_highlightView");

	switch (DockStyle) {
		case 1: {
			%orig;
		}
			break;
		case 2: {
			dockBackground.hidden = YES;
		}
			break;
		case 3: {
			highLightView.alpha = 0;
			backgroundView.layer.cornerRadius = 20;
			backgroundView.layer.masksToBounds = YES;
			CGRect frame = backgroundView.frame;
			backgroundView.frame = (CGRect){{10, frame.origin.y},{frame.size.width - 20, frame.size.height}};
		}
			break;
		default: {
			%orig;
		}
			break;
	}
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
//隐藏桌面图标名称
%hook SBIconLabelImageParameters
- (id)text {
	if(HideIconName && Enabled) {
		return nil;
	}
	return %orig;
}
%end
//隐藏文件夹名称
%hook SBFolder
- (id)displayName {
	if(HideFolderName && Enabled) {
		return nil;
	}
	return %orig;
}
%end
%hook _SBIconWallpaperBackgroundProvider
- (void)_updateBlurForClient:(id)arg {
	if(HideFolderCloseBg && Enabled) {
	arg = nil;
	}
	%orig;
}
%end
%hook SBFolderIconImageView
- (void)_updateAccessibilityBackgroundContrast {
	if(HideFolderCloseBg && Enabled) {
		return;
	}
	%orig;
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
/*状态栏*/
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
			arg = customOperator;
	}
	%orig(arg);
}
%end
/*锁屏*/
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
//锁屏 状态栏大小不变
%hook SBLockScreenViewController
- (int)statusBarStyle {
	if (SameStatusBar && Enabled) {
		return 0;
	}
	return %orig;
}
//锁屏显示时间
- (bool)shouldShowLockStatusBarTime {
	if(LSSTatusBarTime && Enabled) {
		return YES;
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
%end
%hook SBLockScreenNowPlayingPluginController
- (id)initWithLockScreenViewController:(id)arg1 mediaController:(id)arg2 {
	if (HideLCMusicControl && Enabled) {
		arg2 = nil;
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
	if((HideLockScreenGrabber && Enabled) || (LSSTatusBarTime && Enabled)) {
		return NO;
	}
	return %orig;
}
- (void)_layoutGrabberView:(id)arg1 atTop:(bool)arg2 {
	if((HideLockScreenGrabber && Enabled) || (LSSTatusBarTime && Enabled)) {
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
//锁屏 解锁文字自定义
- (id)_defaultSlideToUnlockText {
	if (CustomUnlockText && Enabled) {
			if([customUnlockText isEqualToString:@"echoTime"]) {
				NSDate *currentDate = [NSDate date];//获取当前时间，日期
				NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
				[dateFormatter setDateFormat:@"M月d日 a h:mm"];
				NSString *dateString = [dateFormatter stringFromDate:currentDate];
				return dateString;
			} else {
				return customUnlockText;
			}
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
//锁屏 隐藏时间/充电信息等
%hook SBLockScreenDateViewController
- (void)loadView {
	if(HideLCClock && Enabled) {
		return;
	}
	%orig;
}
%end
/*通知中心*/
//隐藏通知中心提供商
%hook SBTodayTableFooterView
- (void)setAttributionViewController:(id)arg {
	if(HideNCLogo && Enabled) {
		arg = nil;
	}
	%orig;
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
- (void)_configureOverlayViewWithSettings:(id)arg {
	if (HideNCConfigureButton && Enabled) {
		arg = nil;
	}
	%orig;
}
%end
/*控制中心*/
//禁止控制中心回弹
%hook SBControlCenterSettings
- (bool)useNewBounce {
	if(DisableCCBounce && Enabled) {
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

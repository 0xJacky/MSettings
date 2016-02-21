#import <Preferences/Preferences.h>
#import <SettingsKit/SKListControllerProtocol.h>
#import <SettingsKit/SKTintedListController.h>
#import <SettingsKit/SKSharedHelper.h>

#define kUrl_VisitWebSite @"http://jackyu.cn"
#define kUrl_Weibo @"1750883770"
#define kUrl_MakeDonation @"https://qr.alipay.com/ap62zojev3quz2gb7e"
#define kUrl_Repo @"http://apt.Sunbelife.com"
#define kUrl_MailTo @"jacky-943572677@qq.com"
#define kUrl_MailSubject @"MSettings"

@interface MSettingsPrefsListController: SKTintedListController<SKListControllerProtocol>{
}
@end
@interface MSettingsPrefsSpringBoardSettingsListController: SKTintedListController<SKListControllerProtocol>{
}
@end
@interface MSettingsPrefsLockScreenSettingsListController: SKTintedListController<SKListControllerProtocol>{
}
@end
@interface MSettingsPrefsNotificationCenterSettingsListController: SKTintedListController<SKListControllerProtocol>{
}
@end
@interface MSettingsPrefsContolCenterSettingsListController: SKTintedListController<SKListControllerProtocol>{
}
@end
@interface MSettingsPrefsSystemAppSettingsListController: SKTintedListController<SKListControllerProtocol>{
}
@end
@interface MSettingsPrefsAboutListController: SKTintedListController<SKListControllerProtocol>{
}
@end

@implementation MSettingsPrefsListController

- (UIColor*) navigationTintColor {
	return [UIColor darkGrayColor];
}

- (UIColor*) navigationTitleTintColor {
	return [UIColor darkGrayColor];
}

- (UIColor*) switchTintColor {
	return [UIColor grayColor];
}

-(UIColor*) switchOnTintColor {
	return [UIColor darkGrayColor];
}

-(BOOL) showHeartImage { return YES; }
-(BOOL) tintNavigationTitleText { return NO; }
-(BOOL) shiftHeartImage { return YES; }
-(NSString*) shareMessage { return @"我正在使用 MSettings 深度系统定制插件，这个插件挺实用的！小伙伴们快添加 S™中文源（http://apt.Sunbelife.com）来下载吧~"; }

-(NSString*) headerText { return @"MSettings"; }
-(NSString*) headerSubText { return @"深度系统定制"; }

-(NSString*) customTitle { return @"MSettings"; }
-(NSArray*) customSpecifiers
{
	return @[
		@{
			@"cell" : @"PSGroupCell",
			@"footerText" : @"本插件的所有功能均受此开关控制",
		},
		@{
			@"cell" : @"PSSwitchCell",
			@"default" : @YES,
			@"defaults" : @"apt.sun.msettings",
			@"key" : @"Enabled",
			@"label" : @"启用",
			@"PostNotification" : @"MSettings/reloadSettings",
			@"cellClass" : @"SKTintedSwitchCell"
		},
		@{
			@"cell" : @"PSGroupCell",
			@"label" : @"设置",
		},
		@{
			@"cell" : @"PSLinkListCell",
			@"label" : @"主屏幕",
			@"detail" : @"MSettingsPrefsSpringBoardSettingsListController",
			@"cellClass" : @"SKTintedCell",
		},
		@{
			@"cell" : @"PSLinkListCell",
			@"label" : @"锁定屏幕",
			@"detail" : @"MSettingsPrefsLockScreenSettingsListController",
			@"cellClass" : @"SKTintedCell",
		},
		@{
			@"cell" : @"PSLinkListCell",
			@"label" : @"通知中心",
			@"detail" : @"MSettingsPrefsNotificationCenterSettingsListController",
			@"cellClass" : @"SKTintedCell",
		},
		@{
			@"cell" : @"PSLinkListCell",
			@"label" : @"控制中心",
			@"detail" : @"MSettingsPrefsContolCenterSettingsListController",
			@"cellClass" : @"SKTintedCell",
		},
		@{
			@"cell" : @"PSLinkListCell",
			@"label" : @"系统程序",
			@"detail" : @"MSettingsPrefsSystemAppSettingsListController",
			@"cellClass" : @"SKTintedCell",
		},
		@{
			@"alignment" : @"2",
			@"cell" : @"PSButtonCell",
			@"label" : @"应用设置",
			@"action" : @"respring",
		},
		@{
			@"cell" : @"PSGroupCell",
			@"label" : @"",
		},
		@{
			@"cell" : @"PSStaticTextCell",
			@"label" : @"版本：1.5",
			@"cellClass" : @"SKTintedCell",
		},
		@{
			@"cell" : @"PSLinkListCell",
			@"label" : @"软件信息",
			@"detail" : @"MSettingsPrefsAboutListController",
			@"cellClass" : @"SKTintedCell",
		},
		@{
			@"cell" : @"PSGroupCell",
			@"label" : @"支持",
		},
		@{
			@"cell" : @"PSButtonCell",
			@"icon" : @"blog.png",
			@"label" : @"访问 Jacky's Blog",
			@"action" : @"visitWebSite:",
		},
		@{
			@"cell" : @"PSButtonCell",
			@"label" : @"关注@Jacky多啦果粉",
			@"icon" : @"weibo.png",
			@"action" : @"visitWeiBo:",
		},
		@{
			@"cell" : @"PSButtonCell",
			@"label" : @"通过支付宝捐助作者",
			@"icon" : @"donate.png",
			@"action" : @"makeDonation:",
		},
		@{ 
			@"cell" : @"PSGroupCell",
			@"alignment" : @"1",
			@"label" : @"MSettings © 2016 By Jacky\n来自 S™ 中文源",
		},
		];
}

-(void) respring {
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
		message:@"请点击\"立即注销\"以应用设置"
		delegate:self
		cancelButtonTitle:@"取消"
		otherButtonTitles:@"立即注销",nil];
	[alert show];
}

-(void) alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
	if (buttonIndex == 1) {
		system("killall -9 SpringBoard");
	}
}

- (void) visitWebSite:(PSSpecifier *)specifier {
	[SKSharedHelper openWebSite:kUrl_VisitWebSite];
}

- (void) visitWeiBo:(PSSpecifier *)specifier {
	[SKSharedHelper openSina:kUrl_Weibo];
}

- (void) makeDonation:(PSSpecifier *)specifier {
	[SKSharedHelper openWebSite:kUrl_MakeDonation];
}

@end

@implementation MSettingsPrefsSpringBoardSettingsListController

- (UIColor*) tintColor {
	return [UIColor darkGrayColor];
}

- (UIColor*) switchTintColor {
	return [UIColor grayColor];
}

-(BOOL) showHeartImage { return NO; }
-(BOOL) tintNavigationTitleText { return NO; }
-(BOOL) shiftHeartImage { return NO; }

-(NSString*) headerText { return @"SpringBoard"; }
-(NSString*) headerSubText { return @"主屏幕"; }
-(NSString*) customTitle { return @"主屏幕"; }
-(NSArray*) customSpecifiers
{
	return @[
		@{
			@"cell" : @"PSGroupCell",
			@"label" : @"",
		},
		@{
			@"cell" : @"PSSwitchCell",
			@"default" : @NO,
			@"defaults" : @"apt.sun.msettings",
			@"key" : @"HideTurnPoint",
			@"label" : @"隐藏翻页小白点",
			@"PostNotification" : @"MSettings/reloadSettings",
			@"cellClass" : @"SKTintedSwitchCell",
		},
		@{
			@"cell" : @"PSSwitchCell",
			@"default" : @NO,
			@"defaults" : @"apt.sun.msettings",
			@"key" : @"HideDockBg",
			@"label" : @"Dock 透明背景",
			@"PostNotification" : @"MSettings/reloadSettings",
			@"cellClass" : @"SKTintedSwitchCell",
		},
		@{
			@"cell" : @"PSSwitchCell",
			@"default" : @NO,
			@"defaults" : @"apt.sun.msettings",
			@"key" : @"HideFolderBg",
			@"label" : @"隐藏文件夹背景",
			@"PostNotification" : @"MSettings/reloadSettings",
			@"cellClass" : @"SKTintedSwitchCell",
		},
		@{
			@"cell" : @"PSGroupCell",
			@"label" : @"",
		},
		@{
			@"cell" : @"PSSwitchCell",
			@"default" : @NO,
			@"defaults" : @"apt.sun.msettings",
			@"key" : @"DisableLeftSearch",
			@"label" : @"禁用左侧 Spotlight 搜索",
			@"PostNotification" : @"MSettings/reloadSettings",
			@"cellClass" : @"SKTintedSwitchCell",
		},
		@{
			@"cell" : @"PSSwitchCell",
			@"default" : @NO,
			@"defaults" : @"apt.sun.msettings",
			@"key" : @"DisableDownSearch",
			@"label" : @"禁用下拉 Spotlight 搜索",
			@"PostNotification" : @"MSettings/reloadSettings",
			@"cellClass" : @"SKTintedSwitchCell",
		},
		@{
			@"cell" : @"PSSwitchCell",
			@"default" : @NO,
			@"defaults" : @"apt.sun.msettings",
			@"key" : @"HideSwitcherBgDarkeningFactor",
			@"label" : @"应用程序切换器背景透明",
			@"PostNotification" : @"MSettings/reloadSettings",
			@"cellClass" : @"SKTintedSwitchCell",
		},
		@{
			@"cell" : @"PSSwitchCell",
			@"default" : @NO,
			@"defaults" : @"apt.sun.msettings",
			@"key" : @"HideSwitcherCardDarkeningFactor",
			@"label" : @"应用程序切换器窗口透明",
			@"PostNotification" : @"MSettings/reloadSettings",
			@"cellClass" : @"SKTintedSwitchCell",
		},
		@{
			@"cell" : @"PSGroupCell",
			@"label" : @"",
		},
		@{
			@"cell" : @"PSSwitchCell",
			@"default" : @NO,
			@"defaults" : @"apt.sun.msettings",
			@"key" : @"enableAnimationspeed",
			@"label" : @"自定义系统动画持续时间",
			@"PostNotification" : @"MSettings/reloadSettings",
			@"cellClass" : @"SKTintedSwitchCell",
		},
		@{
			@"cell" : @"PSSliderCell",
			@"min" : @0.0,
			@"max" : @1,
			@"default" : @1,
			@"defaults" : @"apt.sun.msettings",
			@"PostNotification" : @"MSettings/reloadSettings",
			@"key" : @"Animationspeed",
		},
		@{
			@"cell" : @"PSGroupCell",
			@"label" : @"",
		},
		@{
			@"cell" : @"PSSwitchCell",
			@"default" : @NO,
			@"defaults" : @"apt.sun.msettings",
			@"key" : @"HideGlobalLine",
			@"label" : @"隐藏全局分割线",
			@"PostNotification" : @"MSettings/reloadSettings",
			@"cellClass" : @"SKTintedSwitchCell"
		},
		@{
			@"cell" : @"PSSwitchCell",
			@"default" : @NO,
			@"defaults" : @"apt.sun.msettings",
			@"key" : @"ForceAppFit",
			@"label" : @"强制程序分辨率",
			@"PostNotification" : @"MSettings/reloadSettings",
			@"cellClass" : @"SKTintedSwitchCell",
		},
		@{
			@"cell" : @"PSSwitchCell",
			@"default" : @NO,
			@"defaults" : @"apt.sun.msettings",
			@"key" : @"BlackKeyBoard",
			@"label" : @"黑色键盘",
			@"PostNotification" : @"MSettings/reloadSettings",
			@"cellClass" : @"SKTintedSwitchCell",
		},
		@{
			@"cell" : @"PSSwitchCell",
			@"default" : @NO,
			@"defaults" : @"apt.sun.msettings",
			@"key" : @"AllBoardPass",
			@"label" : @"使用第三方键盘输入密码",
			@"PostNotification" : @"MSettings/reloadSettings",
			@"cellClass" : @"SKTintedSwitchCell",
		},
		@{
			@"cell" : @"PSGroupCell",
			@"label" : @"",
		},
		@{
			@"cell" : @"PSSwitchCell",
			@"default" : @NO,
			@"defaults" : @"apt.sun.msettings",
			@"key" : @"ShowsLTE",
			@"label" : @"状态栏 4G 标识改为 LTE",
			@"PostNotification" : @"MSettings/reloadSettings",
			@"cellClass" : @"SKTintedSwitchCell",
		},
		@{
			@"cell" : @"PSSwitchCell",
			@"default" : @NO,
			@"defaults" : @"apt.sun.msettings",
			@"key" : @"HideBackTo",
			@"label" : @"禁用状态栏返回上一程序",
			@"PostNotification" : @"MSettings/reloadSettings",
			@"cellClass" : @"SKTintedSwitchCell",
		},
		@{
			@"cell" : @"PSSwitchCell",
			@"default" : @NO,
			@"defaults" : @"apt.sun.msettings",
			@"key" : @"DisableVoiceControl",
			@"label" : @"禁用语音控制",
			@"PostNotification" : @"MSettings/reloadSettings",
			@"cellClass" : @"SKTintedSwitchCell",
		},
		];
}

@end

@implementation MSettingsPrefsLockScreenSettingsListController

- (UIColor*) tintColor {
	return [UIColor darkGrayColor];
}

- (UIColor*) switchTintColor {
	return [UIColor grayColor];
}

-(BOOL) showHeartImage { return NO; }
-(BOOL) tintNavigationTitleText { return NO; }
-(BOOL) shiftHeartImage { return NO; }

-(NSString*) headerText { return @"Lock Screen"; }
-(NSString*) headerSubText { return @"锁定屏幕"; }
-(NSString*) customTitle { return @"锁定屏幕"; }
-(NSArray*) customSpecifiers
{
	return @[
		@{
			@"cell" : @"PSGroupCell",
			@"label" : @"",
		},
		@{
			@"cell" : @"PSSwitchCell",
			@"default" : @NO,
			@"defaults" : @"apt.sun.msettings",
			@"key" : @"HideLockScreenGrabber",
			@"label" : @"隐藏锁屏上下横杠",
			@"PostNotification" : @"MSettings/reloadSettings",
			@"cellClass" : @"SKTintedSwitchCell",
		},
		@{
			@"cell" : @"PSSwitchCell",
			@"default" : @NO,
			@"defaults" : @"apt.sun.msettings",
			@"key" : @"SameStatusBar",
			@"label" : @"状态栏大小与桌面一致",
			@"PostNotification" : @"MSettings/reloadSettings",
			@"cellClass" : @"SKTintedSwitchCell",
		},
		@{
			@"cell" : @"PSGroupCell",
			@"label" : @"",
		},
		@{
			@"cell" : @"PSSwitchCell",
			@"default" : @NO,
			@"defaults" : @"apt.sun.msettings",
			@"key" : @"HideUnlockText",
			@"label" : @"隐藏解锁文字",
			@"PostNotification" : @"MSettings/reloadSettings",
			@"cellClass" : @"SKTintedSwitchCell",
		},
		@{
			@"cell" : @"PSSwitchCell",
			@"default" : @NO,
			@"defaults" : @"apt.sun.msettings",
			@"key" : @"HideUnlockSlider",
			@"label" : @"隐藏解锁滑块",
			@"PostNotification" : @"MSettings/reloadSettings",
			@"cellClass" : @"SKTintedSwitchCell",
		},
		@{
			@"cell" : @"PSSwitchCell",
			@"default" : @NO,
			@"defaults" : @"apt.sun.msettings",
			@"key" : @"HideLCMusicControl",
			@"label" : @"隐藏音乐播放示图",
			@"PostNotification" : @"MSettings/reloadSettings",
			@"cellClass" : @"SKTintedSwitchCell",
		},
		@{
			@"cell" : @"PSSwitchCell",
			@"default" : @NO,
			@"defaults" : @"apt.sun.msettings",
			@"key" : @"HideLCCamera",
			@"label" : @"隐藏相机按钮",
			@"PostNotification" : @"MSettings/reloadSettings",
			@"cellClass" : @"SKTintedSwitchCell",
		},
		];
}
@end

@implementation MSettingsPrefsNotificationCenterSettingsListController

- (UIColor*) tintColor {
	return [UIColor darkGrayColor];
}

- (UIColor*) switchTintColor {
	return [UIColor grayColor];
}

-(BOOL) showHeartImage { return NO; }
-(BOOL) tintNavigationTitleText { return NO; }
-(BOOL) shiftHeartImage { return NO; }

-(NSString*) headerText { return @"Notifications"; }
-(NSString*) headerSubText { return @"通知中心"; }
-(NSString*) customTitle { return @"通知中心"; }
-(NSArray*) customSpecifiers
{
	return @[
		@{
			@"cell" : @"PSGroupCell",
			@"label" : @"",
		},
		@{
			@"cell" : @"PSSwitchCell",
			@"default" : @NO,
			@"defaults" : @"apt.sun.msettings",
			@"key" : @"HideNCLogo",
			@"label" : @"隐藏 天气/股票 提供商信息",
			@"PostNotification" : @"MSettings/reloadSettings",
			@"cellClass" : @"SKTintedSwitchCell"
		},
		@{
			@"cell" : @"PSSwitchCell",
			@"default" : @NO,
			@"defaults" : @"apt.sun.msettings",
			@"key" : @"HideNCLine",
			@"label" : @"隐藏顶部和底部的分割线",
			@"PostNotification" : @"MSettings/reloadSettings",
			@"cellClass" : @"SKTintedSwitchCell",
		},
		@{
			@"cell" : @"PSGroupCell",
			@"label" : @"",
		},
		@{
			@"cell" : @"PSSwitchCell",
			@"default" : @NO,
			@"defaults" : @"apt.sun.msettings",
			@"key" : @"HideNCCalendar",
			@"label" : @"隐藏日历",
			@"PostNotification" : @"MSettings/reloadSettings",
			@"cellClass" : @"SKTintedSwitchCell",
		},
		@{
			@"cell" : @"PSSwitchCell",
			@"default" : @NO,
			@"defaults" : @"apt.sun.msettings",
			@"key" : @"HideNCConfigureButton",
			@"label" : @"隐藏编辑按钮",
			@"PostNotification" : @"MSettings/reloadSettings",
			@"cellClass" : @"SKTintedSwitchCell",
		},
		@{
			@"cell" : @"PSSwitchCell",
			@"default" : @NO,
			@"defaults" : @"apt.sun.msettings",
			@"key" : @"HideLunarDate",
			@"label" : @"隐藏农历信息",
			@"PostNotification" : @"MSettings/reloadSettings",
			@"cellClass" : @"SKTintedSwitchCell",
		},
		];
}
@end
@implementation MSettingsPrefsContolCenterSettingsListController
- (UIColor*) tintColor {
	return [UIColor darkGrayColor];
}

- (UIColor*) switchTintColor {
	return [UIColor grayColor];
}

-(BOOL) showHeartImage { return NO; }
-(BOOL) tintNavigationTitleText { return NO; }
-(BOOL) shiftHeartImage { return NO; }

-(NSString*) headerText { return @"Control Center"; }
-(NSString*) headerSubText { return @"控制中心"; }
-(NSString*) customTitle { return @"控制中心"; }
-(NSArray*) customSpecifiers
{
	return @[
		@{
			@"cell" : @"PSGroupCell",
			@"label" : @"",
		},
		@{
			@"cell" : @"PSSwitchCell",
			@"default" : @NO,
			@"defaults" : @"apt.sun.msettings",
			@"key" : @"DisableCCBounce",
			@"label" : @"禁止控制中心回弹",
			@"PostNotification" : @"MSettings/reloadSettings",
			@"cellClass" : @"SKTintedSwitchCell",
		},
		@{
			@"cell" : @"PSSwitchCell",
			@"default" : @NO,
			@"defaults" : @"apt.sun.msettings",
			@"key" : @"HideCCDarkBg",
			@"label" : @"隐藏深色背景",
			@"PostNotification" : @"MSettings/reloadSettings",
			@"cellClass" : @"SKTintedSwitchCell",
		},
		@{
			@"cell" : @"PSSwitchCell",
			@"default" : @NO,
			@"defaults" : @"apt.sun.msettings",
			@"key" : @"HideCCAirDrop",
			@"label" : @"隐藏 AirDrop / AirPlay",
			@"PostNotification" : @"MSettings/reloadSettings",
			@"cellClass" : @"SKTintedSwitchCell",
		},
		@{
			@"cell" : @"PSGroupCell",
			@"label" : @"",
		},
		@{
			@"cell" : @"PSSwitchCell",
			@"default" : @NO,
			@"defaults" : @"apt.sun.msettings",
			@"key" : @"HideCCToggle",
			@"label" : @"隐藏快捷开关",
			@"PostNotification" : @"MSettings/reloadSettings",
			@"cellClass" : @"SKTintedSwitchCell",
		},
		@{
			@"cell" : @"PSSwitchCell",
			@"default" : @NO,
			@"defaults" : @"apt.sun.msettings",
			@"key" : @"HideBrightnessSection",
			@"label" : @"隐藏亮度调节滑块",
			@"PostNotification" : @"MSettings/reloadSettings",
			@"cellClass" : @"SKTintedSwitchCell",
		},
		@{
			@"cell" : @"PSSwitchCell",
			@"default" : @NO,
			@"defaults" : @"apt.sun.msettings",
			@"key" : @"HideMediaControls",
			@"label" : @"隐藏音乐控制栏",
			@"PostNotification" : @"MSettings/reloadSettings",
			@"cellClass" : @"SKTintedSwitchCell",
		},
		@{
			@"cell" : @"PSSwitchCell",
			@"default" : @NO,
			@"defaults" : @"apt.sun.msettings",
			@"key" : @"HideLaunchSection",
			@"label" : @"隐藏快速启动",
			@"PostNotification" : @"MSettings/reloadSettings",
			@"cellClass" : @"SKTintedSwitchCell",
		},
		];
}
@end

@implementation MSettingsPrefsSystemAppSettingsListController

- (UIColor*) tintColor {
	return [UIColor darkGrayColor];
}

- (UIColor*) switchTintColor {
	return [UIColor grayColor];
}

-(BOOL) showHeartImage { return NO; }
-(BOOL) tintNavigationTitleText { return NO; }
-(BOOL) shiftHeartImage { return NO; }

-(NSString*) headerText { return @"Applications"; }
-(NSString*) headerSubText { return @"系统程序"; }
-(NSString*) customTitle { return @"系统程序"; }
-(NSArray*) customSpecifiers
{
	return @[
		@{
			@"cell" : @"PSGroupCell",
			@"label" : @"",
			@"footerText" : @"开启[优化设置布局]后，打开设置时，设置页面会从顶部开始显示并且默认隐藏搜索栏，稍稍下拉即可看到搜索栏",
		},
		@{
			@"cell" : @"PSSwitchCell",
			@"default" : @NO,
			@"defaults" : @"apt.sun.msettings",
			@"key" : @"MakesSettingsTop",
			@"label" : @"优化设置布局",
			@"PostNotification" : @"MSettings/reloadSettings",
			@"cellClass" : @"SKTintedSwitchCell",
		},
		@{
			@"cell" : @"PSSwitchCell",
			@"default" : @NO,
			@"defaults" : @"apt.sun.msettings",
			@"key" : @"HideSetingsSearch",
			@"label" : @"隐藏设置搜索栏",
			@"PostNotification" : @"MSettings/reloadSettings",
			@"cellClass" : @"SKTintedSwitchCell",
		},
		@{
			@"cell" : @"PSSwitchCell",
			@"default" : @NO,
			@"defaults" : @"apt.sun.msettings",
			@"key" : @"HideAppSettings",
			@"label" : @"隐藏设置应用程序列表",
			@"PostNotification" : @"MSettings/reloadSettings",
			@"cellClass" : @"SKTintedSwitchCell",
		},
		@{
			@"cell" : @"PSGroupCell",
			@"label" : @"电话",
		},
		@{
			@"cell" : @"PSSwitchCell",
			@"default" : @NO,
			@"defaults" : @"apt.sun.msettings",
			@"key" : @"AlwaysDialPad",
			@"label" : @"默认进入拨号界面",
			@"PostNotification" : @"MSettings/reloadSettings",
			@"cellClass" : @"SKTintedSwitchCell",
		},
		@{
			@"cell" : @"PSSwitchCell",
			@"default" : @NO,
			@"defaults" : @"apt.sun.msettings",
			@"key" : @"HideFavorite",
			@"label" : @"隐藏“个人收藏”",
			@"PostNotification" : @"MSettings/reloadSettings",
			@"cellClass" : @"SKTintedSwitchCell",
		},
		@{
			@"cell" : @"PSGroupCell",
			@"alignment" : @"1",
			@"label" : @"更改系统程序的设置后需要重启对应的程序",
		},
		];
}

@end

@implementation MSettingsPrefsAboutListController

- (UIColor*) navigationTintColor {
	return [UIColor darkGrayColor];
}

- (UIColor*) navigationTitleTintColor {
	return [UIColor darkGrayColor];
}

- (UIColor*) switchTintColor {
	return [UIColor grayColor];
}

-(UIColor*) switchOnTintColor {
	return [UIColor darkGrayColor];
}

-(BOOL) showHeartImage { return YES; }
-(BOOL) tintNavigationTitleText { return NO; }
-(BOOL) shiftHeartImage { return YES; }
-(NSString*) shareMessage { return @"我正在使用 MSettings 深度系统定制插件，这个插件挺实用的！小伙伴们快添加 S™中文源（http://apt.Sunbelife.com）来下载吧~"; }

- (NSString*) headerText { return @"About"; }
- (NSString*) headerSubText { return @"软件信息"; }
- (NSString*) customTitle { return @"软件信息"; }
- (NSArray*) customSpecifiers
{
	return @[
		@{
			@"cell" : @"PSGroupCell",
			@"label" : @"",
			@"footerText" : @"欢迎您使用 MSettings\n\nMSettings 是一个深度系统定制插件，我们会不定期给TA增加新的功能\n\n感谢您的支持 ^-^\n\n注意：本插件仅供个人在 AGPL 开源协议的限制下免费使用\n\n特别感谢 @Sunbelife 设计的图标\n\n以及 Rain. 的帮助",
		},
		@{
			@"alignment" : @"2",
			@"cell" : @"PSButtonCell",
			@"label" : @"访问官方源主页",
			@"action" : @"visitRepo:",
			
		},
		@{
			@"cell" : @"PSGroupCell",
			@"label" : @"",
		},
		@{
			@"alignment" : @"2",
			@"cell" : @"PSButtonCell",
			@"label" : @"给我们提点建议吧",
			@"action" : @"giveAdvice:"
		}
		];
}

- (void) giveAdvice:(PSSpecifier *)specifier {
	[SKSharedHelper openEmail:kUrl_MailTo subject:kUrl_MailSubject];
}

- (void) visitRepo:(PSSpecifier *)specifier {
	[SKSharedHelper openWebSite:kUrl_Repo];
}
@end

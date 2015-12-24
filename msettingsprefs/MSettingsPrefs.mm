#import <Preferences/Preferences.h>
#import <SettingsKit/SKListControllerProtocol.h>
#import <SettingsKit/SKTintedListController.h>
#import <SettingsKit/SKSharedHelper.h>
#import <Social/Social.h>
#import <UIKit/UIKit.h>
#include <stdlib.h>

#define kUrl_VisitWebSite @"http://jackyu.cn"
#define kUrl_MailTo @"jacky-943572677@qq.com"
#define kUrl_MailSubject @"MSettings"
#define kUrl_VisitRepo @"http://apt.sunbelife.com"
#define kUrl_Weibo @"http://weibo.cn/jacky189"
#define kUrl_group @"http://jq.qq.com/?_wv=1027&k=euO4Gj"
#define kUrl_MakeDonation @"https://qr.alipay.com/apw95p533uht7qfy10"

@interface MSettingsPrefsListController: SKTintedListController<SKListControllerProtocol>{
}
@end
@interface MSettingsPrefsSpringBoardSettingsListController: SKTintedListController<SKListControllerProtocol>{
}
@end
@interface MSettingsPrefsAppSettingsListController: SKTintedListController<SKListControllerProtocol>{
}
@end
@interface MSettingsPrefsAboutListController: SKTintedListController<SKListControllerProtocol>{
}
@end

@implementation MSettingsPrefsListController
/*
 Want a tint color?
 -(UIColor*) tintColor { return [UIColor orangeColor]; }
 -(BOOL) tintNavigationTitleText { return NO; }
 */
- (UIColor*) tintColor {
    return [UIColor darkGrayColor];
}

-(UIColor*) switchTintColor {
    return [UIColor grayColor];
}

-(BOOL) showHeartImage { return YES; }
-(BOOL) tintNavigationTitleText { return NO; }
-(BOOL) shiftHeartImage { return YES; }
-(NSString*) shareMessage { return @"我正在使用来自 S™ 中文源(apt.Sunbelife.com)的 MSettings 深度系统定制插件，这个插件很实用！@Jacky多啦果粉"; }

-(NSString*) headerText { return @"MSettings"; }
-(NSString*) headerSubText { return @"深度系统定制"; }

-(NSString*) customTitle { return @"MSettings"; }
-(NSArray*) customSpecifiers
{
    return @[
	     @{
		 @"cell": @"PSLinkListCell",
		 @"label": @"系统定制",
		 @"detail": @"MSettingsPrefsSpringBoardSettingsListController",
		 @"cellClass": @"SKTintedCell",
		 },
	     @{
		 @"cell": @"PSGroupCell",
		 @"label": @""
		 },
	     @{
		 @"cell": @"PSLinkListCell",
		 @"label": @"程序定制",
		 @"detail": @"MSettingsPrefsAppSettingsListController",
		 @"cellClass": @"SKTintedCell",
		 },
	     @{
		 @"cell": @"PSGroupCell",
		 @"label": @""
		 },
	     @{
		 @"cell": @"PSLinkListCell",
		 @"label": @"关于我们",
		 @"detail": @"MSettingsPrefsAboutListController",
		 @"cellClass": @"SKTintedCell",
		},
	     @{
		 @"cell": @"PSGroupCell",
		 @"label": @"注销"
		 },
	     @{
		 @"cell" : @"PSButtonCell",
		 @"label" : @"重启 SpringBoard",
		 @"action" : @"respring"
		 },
	     @{
		 @"cell": @"PSGroupCell",
		 @"footerText": @"By Jacky © 2015 来自 S™ 中文源"
		 },
	     ];
}

-(void) respring {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
								  message:@"您确定现在就要要重启 SpringBoard 吗？"
						   delegate:self
					  cancelButtonTitle:@"算了"
					  otherButtonTitles:@"是的",nil];
    [alert show];
}


-(void) alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
	system("killall -9 SpringBoard");
    }
}

@end

@implementation MSettingsPrefsSpringBoardSettingsListController

- (UIColor*) tintColor {
    return [UIColor darkGrayColor];
}

-(UIColor*) switchTintColor {
    return [UIColor grayColor];
}

- (BOOL) showHeartImage { return NO; }
-(NSString*) headerText { return @"SpringBoard"; }
-(NSString*) headerSubText { return @"系统定制"; }
-(NSString*) customTitle { return @"系统定制"; }
-(NSArray*) customSpecifiers
{
    return @[
	     @{
		 @"cell": @"PSGroupCell",
		 @"label": @"主屏幕",
		 },
	     @{
		 @"cell": @"PSSwitchCell",
		 @"default": @NO,
		 @"defaults": @"apt.sun.msettings",
		 @"key": @"HideTurnPoint",
		 @"label": @"隐藏翻页小白点",
		 @"PostNotification": @"MSettings/reloadSettings",
		 @"cellClass": @"SKTintedSwitchCell"
		 },
	     @{
		 @"cell": @"PSSwitchCell",
		 @"default": @NO,
		 @"defaults": @"apt.sun.msettings",
		 @"key": @"HideDockBg",
		 @"label": @"Dock 透明背景",
		 @"PostNotification": @"MSettings/reloadSettings",
		 @"cellClass": @"SKTintedSwitchCell"
		 },
	     @{
		 @"cell": @"PSGroupCell",
		 @"label": @"Spotlight 搜索设置",
		 },
	     @{
		 @"cell": @"PSSwitchCell",
		 @"default": @NO,
		 @"defaults": @"apt.sun.msettings",
		 @"key": @"DisableLeftSearch",
		 @"label": @"禁用左侧 Spotlight 搜索",
		 @"PostNotification": @"MSettings/reloadSettings",
		 @"cellClass": @"SKTintedSwitchCell"
		 },
	     @{
		 @"cell": @"PSSwitchCell",
		 @"default": @NO,
		 @"defaults": @"apt.sun.msettings",
		 @"key": @"DisableDownSearch",
		 @"label": @"禁用下拉 Spotlight 搜索",
		 @"PostNotification": @"MSettings/reloadSettings",
		 @"cellClass": @"SKTintedSwitchCell"
		 },
	     @{
		 @"cell": @"PSGroupCell",
		 @"label": @"通知中心设置",
		 },
	     @{
		 @"cell": @"PSSwitchCell",
		 @"default": @NO,
		 @"defaults": @"apt.sun.msettings",
		 @"key": @"HideNCLogo",
		 @"label": @"隐藏通知中心提供商",
		 @"PostNotification": @"MSettings/reloadSettings",
		 @"cellClass": @"SKTintedSwitchCell"
		 },
	     @{
		 @"cell": @"PSSwitchCell",
		 @"default": @NO,
		 @"defaults": @"apt.sun.msettings",
		 @"key": @"HideNCLine",
		 @"label": @"隐藏通知中心上下分割线",
		 @"PostNotification": @"MSettings/reloadSettings",
		 @"cellClass": @"SKTintedSwitchCell"
		 },
	     @{
		 @"cell": @"PSGroupCell",
		 @"label": @"隐藏全局分割线",
		 },
	     @{
		 @"cell": @"PSSwitchCell",
		 @"default": @NO,
		 @"defaults": @"apt.sun.msettings",
		 @"key": @"HideGlobalLine",
		 @"label": @"启用",
		 @"PostNotification": @"MSettings/reloadSettings",
		 @"cellClass": @"SKTintedSwitchCell"
		 },
	     @{
		 @"cell": @"PSGroupCell",
		 @"label": @"强制分辨率",
		 @"footerText": @"开启后可以使所有的应用程序强制适应当前分辨率"
		 },
	     @{
		 @"cell": @"PSSwitchCell",
		 @"default": @NO,
		 @"defaults": @"apt.sun.msettings",
		 @"key": @"ForceAppFit",
		 @"label": @"启用",
		 @"PostNotification": @"MSettings/reloadSettings",
		 @"cellClass": @"SKTintedSwitchCell"
		 },
	     @{
		 @"cell": @"PSGroupCell",
		 @"label": @"状态栏设置",
		 },
	     @{
		 @"cell": @"PSSwitchCell",
		 @"default": @NO,
		 @"defaults": @"apt.sun.msettings",
		 @"key": @"SameStatusBar",
		 @"label": @"状态栏大小固定",
		 @"PostNotification": @"MSettings/reloadSettings",
		 @"cellClass": @"SKTintedSwitchCell"
		 },
	     @{
		 @"cell": @"PSSwitchCell",
		 @"default": @NO,
		 @"defaults": @"apt.sun.msettings",
		 @"key": @"ShowsLTE",
		 @"label": @"4G 标识改为 LTE",
		 @"PostNotification": @"MSettings/reloadSettings",
		 @"cellClass": @"SKTintedSwitchCell"
		 },
	     @{
		 @"cell": @"PSSwitchCell",
		 @"default": @NO,
		 @"defaults": @"apt.sun.msettings",
		 @"key": @"HideBackTo",
		 @"label": @"移除左上角 “返回xxx”",
		 @"PostNotification": @"MSettings/reloadSettings",
		 @"cellClass": @"SKTintedSwitchCell"
		 },
	     @{
		 @"cell": @"PSGroupCell",
		 @"label": @"自定义优化",
		 },
	     @{
		 @"cell": @"PSSwitchCell",
		 @"default": @NO,
		 @"defaults": @"apt.sun.msettings",
		 @"key": @"BlackKeyBoard",
		 @"label": @"黑色键盘",
		 @"PostNotification": @"MSettings/reloadSettings",
		 @"cellClass": @"SKTintedSwitchCell"
		 },
	     @{
		 @"cell": @"PSSwitchCell",
		 @"default": @NO,
		 @"defaults": @"apt.sun.msettings",
		 @"key": @"AllBoardPass",
		 @"label": @"使用第三方键盘输入密码",
		 @"PostNotification": @"MSettings/reloadSettings",
		 @"cellClass": @"SKTintedSwitchCell"
		 },
	     @{
		 @"cell": @"PSGroupCell",
		 @"footerText": @"更改设置后，您需要重启 SpringBoard 来使配置生效"
		 },
	    ];
}

@end

@implementation MSettingsPrefsAppSettingsListController

- (UIColor*) tintColor {
    return [UIColor darkGrayColor];
}

-(UIColor*) switchTintColor {
    return [UIColor grayColor];
}

- (BOOL) showHeartImage { return NO; }
-(NSString*) headerText { return @"Applications"; }
-(NSString*) headerSubText { return @"程序定制"; }
-(NSString*) customTitle { return @"程序定制"; }
-(NSArray*) customSpecifiers
{
    return @[
	     @{
		 @"cell": @"PSGroupCell",
		 @"label": @"设置",
		 @"footerText": @"[iOS 9] 开启后，打开设置时，设置页面会从顶部开始显示并且默认隐藏搜索栏，稍稍下拉即可看到搜索栏"
		 },
	     @{
		 @"cell": @"PSSwitchCell",
		 @"default": @NO,
		 @"defaults": @"apt.sun.msettings",
		 @"key": @"MakesSettingsTop",
		 @"label": @"设置自动置顶",
		 @"PostNotification": @"MSettings/reloadSettings",
		 @"cellClass": @"SKTintedSwitchCell"
		 },
	     @{
		 @"cell": @"PSGroupCell",
		 @"label": @"电话",
		 },
	     @{
		 @"cell": @"PSSwitchCell",
		 @"default": @NO,
		 @"defaults": @"apt.sun.msettings",
		 @"key": @"AlwaysDialPad",
		 @"label": @"默认进入拨号界面",
		 @"PostNotification": @"MSettings/reloadSettings",
		 @"cellClass": @"SKTintedSwitchCell"
		 },
	     @{
		 @"cell": @"PSSwitchCell",
		 @"default": @NO,
		 @"defaults": @"apt.sun.msettings",
		 @"key": @"HideFavorite",
		 @"label": @"隐藏“个人收藏”",
		 @"PostNotification": @"MSettings/reloadSettings",
		 @"cellClass": @"SKTintedSwitchCell"
		 },
	     @{
		 @"cell": @"PSGroupCell",
		 @"footerText": @"更改程序定制的设置开关后，您需要重启对应的程序"
		 },
	     ];
}

@end


@implementation MSettingsPrefsAboutListController
-(UIColor*) headerColor; { return [UIColor darkGrayColor]; }
-(BOOL) tintNavigationTitleText { return NO; }

- (BOOL) showHeartImage { return NO; }
-(NSString*) headerText { return @"About"; }
-(NSString*) headerSubText { return @"关于我们"; }
-(NSString*) customTitle { return @"关于我们"; }
-(NSArray*) customSpecifiers
{
    return @[
	     @{
		 @"cell": @"PSGroupCell",
		 @"label": @"",
		 @"footerText": @"欢迎您使用来自 S™ 中文源 的系统优化插件\n\n感谢您的支持 ^-^\n\n本插件将会持续更新功能"
		 },
	     @{
		 @"cell" : @"PSGroupCell",
		 @"label" : @"支持 & 帮助",
		 },
	    @{
		 @"cell" : @"PSButtonCell",
		 @"label" : @"给我们提点建议吧",
		 @"icon" : @"support.png",
		 @"action" : @"giveAdvice:"
		 },

	     @{
		 @"cell" : @"PSGroupCell",
		 @"label" : @"开发者",
		 },
			  @{
		 @"cell" : @"PSButtonCell",
		 @"label" : @"访问 Jackyu.cn",
		 @"icon" : @"enabled.png",
		 @"action" : @"visitWebSite:"
		 },
	     @{
		 @"cell" : @"PSButtonCell",
		 @"label" : @"@Jacky多啦果粉",
		 @"icon" : @"weibo.png",
		 @"action" : @"visitWeiBo:"
		 },

	     @{
		 @"cell" : @"PSGroupCell",
		 @"label" : @"关于S™ 中文源",
		 @"footerText": @"S™ 中文源（apt.Sunbelife.com）一个纯主观推荐的 Cydia 源，只推荐最实用的插件，补丁或汉化，源内资源将一直尽量保持少而精的数量，因为我们始终相信，应有尽有并不是无所不包，而是有所甄选的结果。\n维护人员：@Sunbelife & @Jacky多啦果粉"
		 },
	     @{
		 @"cell" : @"PSButtonCell",
		 @"label" : @"S™ 中文源",
		 @"icon" : @"star.png",
		 @"action" : @"visitRepo:"
		 },
	    @{
		 @"cell" : @"PSButtonCell",
		 @"label" : @"捐助我们",
		 @"icon" : @"donate.png",
		 @"action" : @"makeDonation:"
		 },
	     @{
		 @"cell" : @"PSButtonCell",
		 @"label" : @"加入官方讨论群",
		 @"icon" : @"group.png",
		 @"action" : @"group:"
		 }
	     ];
}

- (void) visitWebSite:(PSSpecifier *)specifier {
    [SKSharedHelper openWebSite:kUrl_VisitWebSite];
}

- (void) giveAdvice:(PSSpecifier *)specifier {
    [SKSharedHelper openEmail:kUrl_MailTo subject:kUrl_MailSubject];
}

- (void) visitWeiBo:(PSSpecifier *)specifier {
    [SKSharedHelper openWebSite:kUrl_Weibo];
}

- (void) group:(PSSpecifier *)specifier {
    [SKSharedHelper openWebSite:kUrl_group];
}

- (void) visitRepo:(PSSpecifier *)specifier {
    [SKSharedHelper openWebSite:kUrl_VisitRepo];
}

- (void) makeDonation:(PSSpecifier *)specifier {
    [SKSharedHelper openWebSite:kUrl_MakeDonation];
}

@end


static BOOL Enabled = YES;

static BOOL HideGlobalLine = NO;
static BOOL BlackKeyBoard = NO;
static BOOL HideBackTo = NO;
static BOOL AllBoardPass = NO;

static void initPrefs()
{
	NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/apt.sun.msettings.plist"];
	if(prefs) {
		Enabled = ([prefs objectForKey:@"Enabled"] ? [[prefs objectForKey:@"Enabled"] boolValue] : Enabled );
		HideGlobalLine = ([prefs objectForKey:@"HideGlobalLine"] ? [[prefs objectForKey:@"HideGlobalLine"] boolValue] : HideGlobalLine );
		BlackKeyBoard = ([prefs objectForKey:@"BlackKeyBoard"] ? [[prefs objectForKey:@"BlackKeyBoard"] boolValue] : BlackKeyBoard );
		AllBoardPass = ([prefs objectForKey:@"AllBoardPass"] ? [[prefs objectForKey:@"AllBoardPass"] boolValue] : AllBoardPass );
		HideBackTo = ([prefs objectForKey:@"HideBackTo"] ? [[prefs objectForKey:@"HideBackTo"] boolValue] : HideBackTo );
	}

	[prefs release];
}
/*UIKit*/
//隐藏全局分割线
%hook UITableView
- (void)setSeparatorColor:(id)arg {
	if(HideGlobalLine && Enabled) {
		return;
	}
	%orig;
}
%end
//黑色键盘
%hook UITextInputTraits
- (long long)keyboardAppearance {
	if(BlackKeyBoard && Enabled) {
		return 1;
	}
	return %orig;
}
%end
//隐藏返回xxx
%hook UIStatusBarForegroundStyleAttributes
- (BOOL)canShowBreadcrumbs {
	if(HideBackTo && Enabled) {
		return NO;
	}
	return %orig;
}
%end
//第三方输入法输密码
%hook UITextField
- (void)setSecureTextEntry:(BOOL)arg1 {
	if(AllBoardPass && Enabled) {
		arg1 = 0;
	}
	%orig;
}
%end
%ctor
{
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)initPrefs, CFSTR("apt.sun.msettings/settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
	initPrefs();
	%init();
}

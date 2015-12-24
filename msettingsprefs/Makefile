ARCHS = armv7 arm64
TARGET = iphone:clang:latest:latest
CFLAGS = -fobjc-arc
LDFLAGS = -F$(THEOS)/frameworks

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = MSettingsPrefs
MSettingsPrefs_FILES = MSettingsPrefs.mm $(shell find $(THEOS)/include/SettingsKit -name '*.m')
MSettingsPrefs_INSTALL_PATH = /Library/PreferenceBundles
MSettingsPrefs_FRAMEWORKS = UIKit MessageUI Social QuartzCore CoreGraphics
MSettingsPrefs_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)cp $(THEOS)/include/SettingsKit/Resources/*.png $(THEOS_STAGING_DIR)/Library/PreferenceBundles/MSettingsPrefs.bundle/$(ECHO_END)
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/MSettingsPrefs.plist$(ECHO_END)
